
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class codepage extends StatefulWidget{

  String result;
  int index;
  String phone;

  codepage({this.result,this.phone,this.index});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return codepageState(result: this.result,phone: this.phone,index:this.index);
  }

}

class codepageState extends State<codepage>{



  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();

String pincode="";
  String result="";
  String phone="";
  int index;

  codepageState({this.result,this.phone,this.index});

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar:  AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back,color: Colors.black,),
                  ),



                ],
              ),
            ),
          ),
        ),
        body:
        SafeArea(child: Center(
          child: Container(width:
            MediaQuery.of(context).size.width,
          child: Column(
            children: [
              PinCodeTextField(
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                animationDuration: Duration(milliseconds: 300),
                errorAnimationController: errorController, // Pass it here
                onChanged: (value) {
                  setState(() {
                    pincode = value;
                  });
                }, appContext: context,
              ),

              Padding(padding: EdgeInsets.symmetric(horizontal: 30),child:    ElevatedButton(onPressed: () async {
                //   server().logIn(context,email: email.value.text,password: password.value.text);


                PhoneAuthCredential phoneAuthCredential = await PhoneAuthProvider.credential(verificationId: result, smsCode: pincode);


                FirebaseAuth.instance.signInWithCredential(phoneAuthCredential).then((value) {

                  if(index==0)
                    {
                      FirebaseFirestore.instance.collection("pernatsAccount").where("phone",isEqualTo:this.phone ).get().then((value1) async {
                        print(value1.docs.first.id);

                        if(value1.docs.first.exists)
                        {

                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString("id", value1.docs.first.id).then((value) {



                            Navigator.popAndPushNamed(context, "parentPage");


                          });
                        }else{

                          Fluttertoast.showToast(
                              msg: "your data not exist",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );

                        }




                      });

                    }
                  else{
                    FirebaseFirestore.instance.collection("driverAccount").where("phone",isEqualTo: this.phone).get().then((value1) async {
                      print(value1.docs.first.id);

                      if(value1.docs.first.exists)
                      {

                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString("id", value1.docs.first.id).then((value) {



                          Navigator.popAndPushNamed(context, "driverPage");


                        });
                      }
    else{

    Fluttertoast.showToast(
    msg: "your data not exist",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0
    );



                    }});

                  }


  
},onError: (err){
  Fluttertoast.showToast(
      msg: (err as FirebaseAuthException).message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
});



              },
                child:Padding(padding: EdgeInsets.symmetric(vertical: 15),
                    child:
                    Text("Log In As Partner",style: TextStyle(
                        fontSize: 30
                    ) ,)



                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            color: Colors.black38
                            ,width: 1,style: BorderStyle.solid
                        )
                    )
                ),
              ),)
            ],
          ),),
        ),
        ) );
  }


}