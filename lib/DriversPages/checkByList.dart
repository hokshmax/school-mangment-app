import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schoolapp/Pages/chatPage.dart';
import 'package:schoolapp/Pages/id.dart';
import 'package:http/http.dart' as http;

import 'package:schoolapp/widgets/DrawerDriverE.dart';
import 'package:schoolapp/widgets/DrawerParentE.dart';
import 'package:shared_preferences/shared_preferences.dart';

class checkByListView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return checkByListViewState();
  }

}

class checkByListViewState extends State<checkByListView> {

  @override
  void initState() {
    getId();

    super.initState();

  }

  String id;
  String SchoolId;

  List<bool>  check=[];


  void getId() {
    getid().get().then((value) {
      FirebaseFirestore.instance.collection("driverAccount").doc(value)
          .get()
          .then((value2) {
        setState(() {
          id = value;
          SchoolId = value2.get('schoolUid');
          print("SchoolId");

          print(SchoolId);
        });
      });
      super.initState();
    }
    );
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
        drawer: DrawerDriverE(Id: id,),
        body:id!=null?  FutureBuilder(builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {






 if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );

          }else {
            return StreamBuilder(
                stream: FirebaseFirestore.instance.collection("Students").where(
                    "busId", isEqualTo: snapshot.data.get("busid")).snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snap) {

                  if(snapshot.hasError)
                    {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }




                  if (!snap.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  else if (snap.data.docs.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  else {
                    for (DocumentSnapshot dd in snap.data.docs) {
                       check.add(false);
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

                                  itemBuilder: (BuildContext context,
                                      int index) {
                                    return SingleChildScrollView(
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 20),
                                          child: Center(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(25),
                                                color: Colors.white,
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 20, horizontal: 20),
                                              child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .stretch,
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .center,
                                                  children: <Widget>[
                                                    Center(child: Text(
                                                        'STUDENTS INFORMATION',
                                                        style: TextStyle(
                                                            fontSize: 24,
                                                            color: Colors.amber,
                                                            fontWeight: FontWeight
                                                                .w600))),
                                                    SizedBox(height: 20,),
                                                    Row(
                                                        children: [
                                                          Icon(Icons.portrait),
                                                          SizedBox(width: 5,),
                                                          Text('NATIONAL ID',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .lightBlue[600],
                                                                  fontWeight: FontWeight
                                                                      .bold)),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Checkbox(
                                                              value: check
                                                                  .elementAt(
                                                                  index),
                                                              onChanged: (
                                                                  bool value) {
                                                                if (value) {
                                                                  setcheckAttendense(
                                                                      snap.data
                                                                          .docs
                                                                          .elementAt(
                                                                          index)
                                                                          .id);
                                                                }
                                                                setState(() {
                                                                  check.insert(
                                                                      index,
                                                                      value);
                                                                });
                                                              },


                                                            ),

                                                          )
                                                        ]),
                                                    SizedBox(height: 5,),
                                                    Text(
                                                      snap.data.docs.elementAt(
                                                          index)
                                                          .data()['nationalId']
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          color: Colors.black
                                                      ),),
                                                    SizedBox(height: 20,),
                                                    Row(
                                                        children: [
                                                          Icon(Icons.person),
                                                          SizedBox(width: 5,),
                                                          Text('NAME',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .lightBlue[600],
                                                                  fontWeight: FontWeight
                                                                      .bold)),
                                                        ]),
                                                    SizedBox(height: 5,),
                                                    Text(
                                                      snap.data.docs.elementAt(
                                                          index)
                                                          .data()['studentName']
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          color: Colors.black
                                                      ),),
                                                    SizedBox(height: 20,),
                                                    Row(
                                                        children: [
                                                          Icon(Icons
                                                              .paste_outlined),
                                                          SizedBox(width: 5,),
                                                          Text('CLASS NUMBER',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .lightBlue[600],
                                                                  fontWeight: FontWeight
                                                                      .bold)),
                                                        ]),
                                                    SizedBox(height: 5,),
                                                    Text(
                                                      snap.data.docs.elementAt(
                                                          index)
                                                          .data()['classNumber']
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          color: Colors.black
                                                      ),),
                                                    SizedBox(height: 20,),
                                                    Row(
                                                        children: [
                                                          Icon(Icons
                                                              .directions_bus),
                                                          SizedBox(width: 5,),
                                                          Text('BUS ID',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .lightBlue[600],
                                                                  fontWeight: FontWeight
                                                                      .bold)),
                                                        ]),
                                                    SizedBox(height: 5,),
                                                    Text(
                                                      snap.data.docs.elementAt(
                                                          index)
                                                          .data()['busId']
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          color: Colors.black
                                                      ),),
                                                  ]),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }))
                            ]));
                  }
                });
          }
        },future:  FirebaseFirestore.instance.collection("driverAccount").doc(id).get(),): Center(
        child: CircularProgressIndicator(),
    )


    );
  }

 void setcheckAttendense(String StudentId)
 {
   FirebaseFirestore.instance.collection("studentsAttend").doc(SchoolId)
       .collection(SchoolId).doc(Timestamp
       .now()
       .toDate()
       .year
       .toString()

       + "-" + Timestamp
       .now()
       .toDate()
       .month
       .toString() + "-" + Timestamp
       .now()
       .toDate()
       .day
       .toString())
       .set({
     StudentId: StudentId}, SetOptions(
       merge: true
   ),

   )
       .then((value) {
     FirebaseFirestore.instance.collection("pernatsAccount").where(
         "nationalId", isEqualTo: StudentId).get().then((value) {
       FirebaseFirestore.instance.collection("Tokens").doc(
           value.docs.first.id).get().then((value) {
         FirebaseMessaging.instance.sendMessage(to: value.get("token"),
             data: {"title": "your son has assined"});
         sendAndRetrieveMessage(value.get("token"));
       });
     });

     Fluttertoast.showToast(
         msg: "list checked scuccsfuly",
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.TOP,
         timeInSecForIosWeb: 1,
         backgroundColor: Colors.green,
         textColor: Colors.white,
         fontSize: 16.0
     );
   }, onError: (err) {
     Fluttertoast.showToast(

         msg: (err as FirebaseException).message,
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.TOP,
         timeInSecForIosWeb: 1,
         backgroundColor: Colors.red,
         textColor: Colors.white,
         fontSize: 16.0
     );
   });

}

final String serverToken = 'AAAAoN_E_p0:APA91bHgbIrpwTO0eodKKJTVX1gPcEPVWVkFt2U925CxTHaFc18bJCj79VbLe7o_2fqrH8beUaPeokfK9i3ZDjnUDWCnr9qIWOugDHfOwVx30VB-78bVg0uqmiQ4bt4efkkVuADIYKWH';

Future<Map<String, dynamic>> sendAndRetrieveMessage(val) async {


  await http.post(
    'https://fcm.googleapis.com/fcm/send',
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverToken',
    },
    body: jsonEncode(
      <String, dynamic>{
        'notification': <String, String>{
          'body': 'son arrived',
          'title': 'son arrived'
        },
        'priority': 'high',
        'data': <String, String>{
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'id': '1',
          'status': 'done'
        },
        'to': val.toString(),
      },
    ),
  );

  final Completer<Map<String, dynamic>> completer =
  Completer<Map<String, dynamic>>();



  return completer.future;
}
}


