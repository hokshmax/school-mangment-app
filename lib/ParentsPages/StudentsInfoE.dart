import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/Pages/chatPage.dart';
import 'package:schoolapp/Pages/generate.dart';
import 'package:schoolapp/widgets/DrawerParentE.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentsView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StudentsViewState();
  }

}

class StudentsViewState extends State<StudentsView> {
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
        body:FutureBuilder(
          future: FirebaseFirestore.instance.collection("pernatsAccount").doc(id).get(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) =>snapshot.hasData? StreamBuilder(
              stream:  FirebaseFirestore.instance.collection("Students").where("parentNID",isEqualTo: snapshot.data['nationalId']).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snap) {
                if (!snap.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Center(

                    child: Column(
                        children: [


                          /*    //mainAxisSize: MainAxisSize.max,
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100,),
                Flexible(child:  Column(
                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("parnterName"),
                    Text(snap.data.docs.elementAt().data()['parnterName'].toString()),
                    Text("phone"), Text("email"),
                    Text("password"),
                    Text("nationalId"), Text("busId")




                  ],
                )),*/
                          Flexible(child: ListView.builder(
                              itemCount: snap.data.size,

                              itemBuilder: (BuildContext context, int index) {
                                return SingleChildScrollView(
                                  child: Container(
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
                                                  Center(child: Text('STUDENTS INFORMATION',style: TextStyle(fontSize: 24, color: Colors.amber,fontWeight: FontWeight.w600))),
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
                                                  Text(snap.data.docs.elementAt(index)
                                                      .data()['nationalId'].toString(),style: TextStyle(
                                                      fontSize: 24, color: Colors.black
                                                  ),),
                                                  SizedBox(height: 20,),
                                                  Row(
                                                      children:[
                                                        Icon(Icons.person),
                                                        SizedBox(width: 5,),
                                                        Text('NAME',style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.lightBlue[600],
                                                            fontWeight: FontWeight.bold)),]),
                                                  SizedBox(height: 5,),
                                                  Text(snap.data.docs.elementAt(index)
                                                      .data()['studentName'].toString(),style: TextStyle(
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
                                                  Text(snap.data.docs.elementAt(index)
                                                      .data()['classNumber'].toString(),style: TextStyle(
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
                                                  Text(snap.data.docs.elementAt(index)
                                                      .data()['busId'].toString(),style: TextStyle(
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
                        ]));
              }):CircularProgressIndicator(),)
        
       );
  }

}

