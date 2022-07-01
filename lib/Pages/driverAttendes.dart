import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'id.dart';

class driverAttendes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return driverAttendesstate();
  }
  
}
class driverAttendesstate extends State<driverAttendes>{

List<DocumentSnapshot> Perants=List<DocumentSnapshot> ();
List<DocumentSnapshot> students=List<DocumentSnapshot> ();
String myid;
  @override
  initState() {
    print('hoksh');



    super.initState();
    getid().get().then((value) {
      setState(() {
        myid=value;
        takeAttendes();


      });
    }
    );




  }

  void takeAttendes()
   {

    FirebaseFirestore.instance.collection("attendes").doc(myid).collection(myid).where("attendes",isEqualTo: true).
    get().then((value) {
      print('sasa');




      value.docs.forEach((e)  {

           FirebaseFirestore.instance.collection("pernatsAccount").doc(e.id).get().then((Perantsvalue)  {


               Perants.add(Perantsvalue);



           FirebaseFirestore.instance.collection("Students").where("parentNID",isEqualTo: Perantsvalue['nationalId']).get().then((Studentssvalue) {
            
             
             

            setState(() {


                  students.add(Studentssvalue.docs.first);




            });

             
              
              
          


          });

        });
        
      });
      
    });



  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return Scaffold(
  body: ListView.builder(
      itemCount:students.length ,
      itemBuilder: (context,index){

        return   Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [



              Row(
                children: [
                  Text("PerantName:"),
                  Text(Perants.elementAt(index).get('parnterName'))
                ],
              ),
              Row(
                children: [
                  Text("StudentName:"),
                  Text(students.elementAt(index).get('studentName'))
                ],
              ),
              Row(
                children: [
                  Text("ClassNumber:"),
                  Text(students.elementAt(index).get('classNumber'))



                ],)






            ],



          ),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              shape: BoxShape.rectangle
          )
        );


  }),
  
);  }
  
  
}