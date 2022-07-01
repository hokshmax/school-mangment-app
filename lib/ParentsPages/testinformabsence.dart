
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:schoolapp/Pages/id.dart';
import 'package:schoolapp/widgets/DrawerParentE.dart';


class partnerAttenTest extends StatefulWidget{
  String BusId;
  String StudentId;

  partnerAttenTest({this.StudentId,this.BusId});


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return partnerAttenTestState(StudentId: this.StudentId,BusId: this.BusId);  }

}

class partnerAttenTestState extends State<partnerAttenTest>{

  bool _character;
  String StudentId;
  String BusId;
  final String serverToken = 'AAAAoN_E_p0:APA91bHgbIrpwTO0eodKKJTVX1gPcEPVWVkFt2U925CxTHaFc18bJCj79VbLe7o_2fqrH8beUaPeokfK9i3ZDjnUDWCnr9qIWOugDHfOwVx30VB-78bVg0uqmiQ4bt4efkkVuADIYKWH';


  partnerAttenTestState({this.StudentId,this.BusId});
  String myid;

  void SetAttendens()
  {

    print(this.StudentId);


    FirebaseFirestore.instance.collection("driverAccount").where("busid",isEqualTo:this.BusId).get().then((value) {

      FirebaseFirestore.instance.collection("attendess").doc(value.docs.first.id).collection(value.docs.first.id).doc(this.StudentId).set({
        "attendes":_character
      });


      if(!_character)
      {
        sendNotificatonToDriver(value.docs.first.id);
      }



    });

  }

  void sendNotificatonToDriver(String driverId)
  {

    FirebaseFirestore.instance.collection("Students").doc(StudentId).get().then((value22) {

      FirebaseFirestore.instance.collection("Tokens").doc(driverId).get().then((value) async {
        await http.post(
          'https://fcm.googleapis.com/fcm/send',
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization': 'key=$serverToken',
          },
          body: jsonEncode(
            <String, dynamic>{
              'notification': <String, String>{
                'body': 'this is a body',
                'title': '${value22.get('studentName')} will not attend'
              },
              'priority': 'high',
              'data': <String, String>{
                'click_action': 'FLUTTER_NOTIFICATION_CLICK',
                'id': '1',
                'status': 'done'
              },
              'to': value.get('token'),
            },
          ),
        );
      });
    });




  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  SafeArea(child:  Scaffold(
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
      body:
      Stack(

        children: [

          Padding(
            padding: const EdgeInsets.symmetric(vertical:50.0,horizontal: 15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 80,horizontal:40 ),
                child: Column(
                  children: [
                    Column(
                      children: <Widget>[
                       /*RadioListTile(
                          title: const Text('Attend'),
                          value: true,
                          groupValue: _character,
                          onChanged: ( value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),*/
                        RadioListTile(
                          title: const Text('ABSENCE'),
                          value: false,
                          groupValue: _character,
                          onChanged: ( value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child:           Padding(padding: EdgeInsets.all(30),child:    ElevatedButton(onPressed: () {

              SetAttendens();
            },
              child:Padding(padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),
                  child:
                  Text("SEND",textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1,
                      color: Colors.white,

                    ),)







              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue[100],
                shape: RoundedRectangleBorder(side: BorderSide(
                    color: Colors.amberAccent,
                    width: 2.5,
                    style: BorderStyle.solid
                ), borderRadius: BorderRadius.circular(15)),
              ),
            ),)
            ,
          )
        ],
      )


      ,
    )) ;
  }

  @override
  void initState() {
    super.initState();
    getid().get().then((value) {
      setState(() {
        myid = value
        ;
      });
    });
  }
}