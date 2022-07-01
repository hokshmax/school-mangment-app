import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/Pages/chatPage.dart';

import 'id.dart';

class perantsDriver extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    
    return PerantsDriverState();
  }
  
  
}

class PerantsDriverState extends State<perantsDriver>{
  List<DocumentSnapshot> Perants=List<DocumentSnapshot> ();
  List<DocumentSnapshot> students=List<DocumentSnapshot> ();

  String myid;
  void getPerants()
  {

    FirebaseFirestore.instance.collection("attendes").doc(myid).collection(myid).
    get().then((value) {
      print('sasa');




      value.docs.forEach((e)  {

        FirebaseFirestore.instance.collection("Students").doc(e.id).get().then((studentvalue)  {



          students.add(studentvalue);








          FirebaseFirestore.instance.collection("pernatsAccount").where("nationalId",isEqualTo: studentvalue.get('parentNID')).get().then((Perantsvalue) {
            Perants.add(Perantsvalue.docs.first);

          });



        });

      });

    });



  }
  void gettest()
  {

    FirebaseFirestore.instance.collection("driverAccount").doc(myid).collection(myid).
    get().then((value) {
      print('sasa');




      value.docs.forEach((e)  {

        FirebaseFirestore.instance.collection("Students").doc(e.id).get().then((studentvalue)  {



          students.add(studentvalue);








          FirebaseFirestore.instance.collection("pernatsAccount").where("nationalId",isEqualTo: studentvalue.get('parentNID')).get().then((Perantsvalue) {
            Perants.add(Perantsvalue.docs.first);

          });



        });

      });

    });



  }
  @override
  void initState() {
    super.initState();
    getid().get().then((value) {
      setState(() {
        myid=value
        ;
        getPerants();

      });
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:ListView.builder(
          itemCount:students.length ,
          itemBuilder: (context,index){

            return   SingleChildScrollView(
              child: InkWell(
                child: Container(
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
                ),
                onTap: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => chat(index: 2,partnerID:Perants.elementAt(index).id ,)),
                  );
                },
              ),
            );


          }) ,

    );
  }
  
  
  
}

