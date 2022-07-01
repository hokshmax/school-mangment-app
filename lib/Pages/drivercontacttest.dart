import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/Pages/chatPage.dart';
import 'package:schoolapp/widgets/DrawerDriverE.dart';

import 'id.dart';

class perantsDrivertest extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return PerantsDrivertestState();
  }


}

class PerantsDrivertestState extends State<perantsDrivertest>{
  List<DocumentSnapshot> Perants=List<DocumentSnapshot> ();
  List<DocumentSnapshot> students=List<DocumentSnapshot> ();
  List<QuerySnapshot> Perants2=List<QuerySnapshot> ();


  String myid;
  String busid;
  getNationalID()
  async {
    await  FirebaseFirestore.instance.collection("driverAccount").doc(myid).get().then((value) {

      setState(() {
        busid=value.get("busid").toString();

      });


    });

  }
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
     //   getPerants();
        getNationalID();

        getdata();



      });
    }
    );
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar:AppBar(
            backgroundColor: Colors.white,
            elevation: 0,

            iconTheme: IconThemeData(color: Colors.amberAccent),
            toolbarHeight: 50,
            flexibleSpace: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end
                ,

                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("SSB", textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
//automaticallyImplyLeading: false,
//backgroundColor: Colors.white,
                  SafeArea(
                      child: Container(
                          padding: EdgeInsets.only(left: 100),
                          child: Row(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.arrow_forward,
                                    color: Colors.amberAccent,),
                                ),
                              ]
                          )
                      )
                  )
                ])
        ),
        backgroundColor: Colors.lightBlue[100],
        drawer: DrawerDriverE(Id:myid ,),
      body:   Center(

                      child: Column(
                          children: [
                            Center(child: Text('PARENTS LIST',style: TextStyle(fontSize: 24, color: Colors.amber,fontWeight: FontWeight.w600))),




                            Flexible(child: ListView.builder(
                                itemCount: Perants.length,

                                itemBuilder: (BuildContext context, int index) {
                                  return SingleChildScrollView(
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                                        child:InkWell(
                                          onTap: (){
                                            Navigator.push(context,  MaterialPageRoute(builder: (context) => chat(index: 2,partnerID:Perants.elementAt(index)
                                                .id,)));
                                          },
                                          child:  Center(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(25),
                                                color: Colors.white,
                                              ),
                                              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                                              child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children:<Widget> [
                                                    SizedBox(height: 20,),
                                                    Row(
                                                        children:[
                                                          Icon(Icons.portrait),
                                                          SizedBox(width: 5,),
                                                          Text('NATIONAL ID',style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors.lightBlue[600],
                                                              fontWeight: FontWeight.bold)),]),
                                                    SizedBox(height: 5,),
                                                    Text(students.elementAt(index).data()['nationalId'].toString(),style: TextStyle(
                                                        fontSize: 24, color: Colors.black
                                                    ),),
                                                    SizedBox(height: 20,),
                                                    Row(
                                                        children:[
                                                          Icon(Icons.person),
                                                          SizedBox(width: 5,),
                                                          Text('PARENT NAME',style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors.lightBlue[600],
                                                              fontWeight: FontWeight.bold)),]),
                                                    SizedBox(height: 5,),
                                                    Text(Perants.elementAt(index)['parnterName'].toString(),style: TextStyle(
                                                        fontSize: 24, color: Colors.black
                                                    ),),
                                                    SizedBox(height: 20,),
                                                    SizedBox(height: 20,),
                                                    Row(
                                                        children:[
                                                          Icon(Icons.person),
                                                          SizedBox(width: 5,),
                                                          Text('Student NAME',style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors.lightBlue[600],
                                                              fontWeight: FontWeight.bold)),]),
                                                    SizedBox(height: 5,),
                                                    Text(students.elementAt(index)['studentName'].toString(),style: TextStyle(
                                                        fontSize: 24, color: Colors.black
                                                    ),),
                                                    SizedBox(height: 20,),


                                                    Row(
                                                        children:[
                                                          Icon(Icons.paste_outlined),
                                                          SizedBox(width: 5,),
                                                          Text('CLASS NUMBER',style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors.lightBlue[600],
                                                              fontWeight: FontWeight.bold)),]),
                                                    SizedBox(height: 5,),
                                                    Text(students.elementAt(index)['classNumber'].toString(),style: TextStyle(
                                                        fontSize: 24, color: Colors.black
                                                    ),),
                                                    SizedBox(height: 20,),
                                                    Row(
                                                        children:[
                                                          Icon(Icons.directions_bus),
                                                          SizedBox(width: 5,),
                                                          Text('BUS ID',style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors.lightBlue[600],
                                                              fontWeight: FontWeight.bold)),]),
                                                    SizedBox(height: 5,),
                                                    Text(students.elementAt(index)['busId'].toString(),style: TextStyle(
                                                        fontSize: 24, color: Colors.black
                                                    ),),
                                                  ]),
                                            ),
                                          ) ,
                                        )
                                        ,
                                      ),
                                    ),
                                  );
                                }))
                          ])









            ,)
  /*    ListView.builder(
          itemCount:students.length ,
          itemBuilder: (context,index){

            return   InkWell(
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
            );


          }) ,*/

    );
  }


void getdata()
{


  FirebaseFirestore.instance.collection("Students").where("busId",isEqualTo: busid).get().then((value) {

    students.addAll(value.docs);

    for (int x=0;x<value.size;x++)
    {

      FirebaseFirestore.instance.collection("pernatsAccount").where("nationalId",
          isEqualTo: value.docs.elementAt(x).data()['parentNID']).get().then((value)  {

            print(value.docs.first.id+"maxxxx");

            setState(() {

              Perants.add(value.docs.first);

            });

      }) ;


    }

  });

}


}

