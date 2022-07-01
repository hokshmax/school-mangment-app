import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/Pages/chatPage.dart';
import 'package:schoolapp/Pages/generate.dart';
import 'package:schoolapp/Pages/partnerAttendes.dart';
import 'package:schoolapp/ParentsPages/informUpsense.dart';
import 'package:schoolapp/widgets/DrawerParentE.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:schoolapp/ParentsPages/studentfirst.dart';
import 'package:schoolapp/ParentsPages/testinformabsence.dart';

class Studentschoose extends StatefulWidget{
  String studentID;

  Studentschoose({this.studentID});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StudentschooseState(studentID:this.studentID);
  }

}

class StudentschooseState extends State<Studentschoose> {
  String studentID;

  StudentschooseState({this.studentID});
  @override
  void initState() {
    getId();

    super.initState();
  }

  String id;

  void getId() {
    SharedPreferences.getInstance().then((value1) {

      setState(() {
        id = value1.get("id");

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
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
        drawer: DrawerParentE(),
        body:StreamBuilder(
    stream:  FirebaseFirestore.instance.collection("Students").where("nationalId",isEqualTo: studentID).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snap) {
                if (!snap.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Center(

                    child: Column(
                        children: [


                          Flexible(child: ListView.builder(
                              itemCount: snap.data.size,

                              itemBuilder: (BuildContext context, int index) {
                                return SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                                          child:InkWell(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Studentspage(studentID:snap.data.docs.elementAt(index).data()['nationalId'])));
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
                                                      Row(
                                                          children:[

                                                            Text(snap.data.docs.elementAt(index)
                                                                .data()['studentName'].toString()+' Profile',textAlign: TextAlign.center,style: TextStyle(
                                                                fontSize: 24,
                                                                color: Colors.black,
                                                                )),]),
                                                      SizedBox(height: 5,),

                                                    ]),
                                              ),
                                            ) ,
                                          )
                                          ,
                                        ),
                                      ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                                      child:InkWell(
                                        onTap: (){
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=>partnerAttenTest(StudentId:snap.data.docs.elementAt(index).id,BusId:snap.data.docs.elementAt(index).data()["busId"])));
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
                                                  Row(
                                                      children:[


                                                        Text('Inform Absence',textAlign: TextAlign.center,style: TextStyle(
                                                            fontSize: 24,
                                                            color: Colors.black,
                                                           )),]),
                                                  SizedBox(height: 5,),

                                                ]),
                                          ),
                                        ) ,
                                      )
                                      ,
                                    ),
                                  ),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                                          child:InkWell(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>generate(studentID:snap.data.docs.elementAt(index).id)));
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
                                                      Row(
                                                          children:[

                                                            Text(snap.data.docs.elementAt(index)
                                    .data()['studentName'].toString()+ ' QR',textAlign: TextAlign.center,style: TextStyle(
                                                                fontSize: 24,
                                                                color: Colors.black,
                                                               )),]),
                                                      SizedBox(height: 5,),

                                                    ]),
                                              ),
                                            ) ,
                                          )
                                          ,
                                        ),
                                      ),
                                ]));
                              }))
                        ]));
              })

    );
  }

}

