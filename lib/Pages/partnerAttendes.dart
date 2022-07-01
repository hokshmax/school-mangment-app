
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'id.dart';

class partnerAtten extends StatefulWidget{
  String BusId;
  String StudentId;

  partnerAtten({this.StudentId,this.BusId});


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
return partnerAttenState(StudentId: this.StudentId,BusId: this.BusId);  }

}

class partnerAttenState extends State<partnerAtten>{

  bool _character;
  String StudentId;
  String BusId;
  final String serverToken = 'AAAAoN_E_p0:APA91bHgbIrpwTO0eodKKJTVX1gPcEPVWVkFt2U925CxTHaFc18bJCj79VbLe7o_2fqrH8beUaPeokfK9i3ZDjnUDWCnr9qIWOugDHfOwVx30VB-78bVg0uqmiQ4bt4efkkVuADIYKWH';


  partnerAttenState({this.StudentId,this.BusId});
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
      body:
      Stack(

        children: [

          Column(
            children: [
              Column(
                children: <Widget>[
                  RadioListTile(
                    title: const Text('Attend'),
                    value: true,
                    groupValue: _character,
                    onChanged: ( value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('AbSense'),
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
          Align(
            alignment: Alignment.bottomCenter,
            child:           Padding(padding: EdgeInsets.all(30),child:    ElevatedButton(onPressed: () {

SetAttendens();
            },
              child:Padding(padding: EdgeInsets.symmetric(vertical: 15),
                  child:
                  Text("UPDATE",style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30

                  ) ,)







              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                          color: Colors.black38
                          ,width: 1,style: BorderStyle.solid
                      )
                  )
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