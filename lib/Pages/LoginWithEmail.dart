

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schoolapp/firebase.dart';

class LogInWithEmail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LogInWithEmailState();
  }


}

class LogInWithEmailState extends State<LogInWithEmail>{

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String message = "";

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                //  SizedBox(height: 5,),
                Container(
                  //decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(20),
                  //  color: Colors.white,
                  //),
                  child: Column(
                    children: <Widget>[
                      //  Image.asset('assets/imgs/screen.jpg', height: 290,),
                      SizedBox(height: 90,),
                      Text('SSB',
                          style: TextStyle(
                            color: Colors.amberAccent,
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,)
                      ),
                    ],
                  ),
                ),
                // body:SafeArea(
                // child:SizedBox.fromSize(
                // size: MediaQuery.of(context).size,
                //child:  Column(
                //mainAxisSize: MainAxisSize.max,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                //children: [
                // Image.asset("assets/imgs/screen.jpg",height: 280,),
                //Text("SSB",style: TextStyle(
                //color: Colors.amberAccent,
                //fontSize: 50,
                //fontWeight: FontWeight.w600,
                //letterSpacing: 1.2,
                //),textAlign: TextAlign.center,),
               Padding(padding: EdgeInsets.all(0),child:
                Card(
                    margin: EdgeInsets.only(top: 6,bottom: 6,left: 15,right: 15),
                    color: Colors.lightBlue[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),


                    ),

                    child:
                    Padding(
                      padding: EdgeInsets.all( 50),
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,



                        children: [
                          Flexible
                            (
                            child:TextField(
                              controller: email,
                              decoration:InputDecoration(
                                hintText: "E-mail"
                                ,

                              ),
                            ) ,
                          )
                          ,
                          Flexible(child:     TextField(
                            obscureText: true,
                            controller: password,
                            decoration:InputDecoration(

                              hintText: "Password"
                              ,

                            ),
                          ))

                        ],
                      ),
                    )

                ),

                ),
               /* Expanded(
                child: ListView(
                children: <Widget>[
                Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),

                child:Form(key: _formkey,
                child: Column(
                children: <Widget>[
                TextFormField(
                decoration: InputDecoration(
                labelText: 'UserName',
                labelStyle: TextStyle(fontSize: 20)),
                controller:email ,
                validator: (value){
                if(value.isEmpty){
                return 'username can not be empty';
                }
                return null;
                },

                ),
                SizedBox(height: 10,),
    TextFormField(
    obscureText: true,
    decoration: InputDecoration(
    labelText: 'Password',
    labelStyle: TextStyle(fontSize: 20)),
    controller:password ,
    validator: (value){
    if(value.isEmpty){
    return 'password can not be empty';
    }
    return null;
    },

    ),*/

                Padding(padding: EdgeInsets.symmetric(horizontal: 20),child:
                ElevatedButton(

                    onPressed: () {


    //server().logInperante(context,email: email.value.text,password: password.value.text).then((value){});
    server().loginAll(context,email: email.value.text,password: password.value.text).then((value){});


    },
                    child:Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        //padding: EdgeInsets.symmetric(vertical: 15),
                        child:
                        Text("LOG IN ",style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ) ,)



                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amberAccent, // background
                      onPrimary: Colors.amberAccent,
                      shape: RoundedRectangleBorder(side: BorderSide(
                          color: Colors.lightBlue[100],
                          width: 1.5,
                          style: BorderStyle.solid
                      ), borderRadius: BorderRadius.circular(15)),
                      // borderRadius: BorderRadius.circular(20),
                      //side: BorderSide(
                      //  color: Colors.black38
                      //,width: 1,style: BorderStyle.solid
                    )
                )
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Forget password?',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 18,
                    ),
                  ),
                ),
              ] ),
        )
      //,)
//               ,







      //           ],

      //       ) ,
      // )

      //   ,
      //   )



    );
  }

}















//import 'dart:ui';

//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:country_code_picker/country_code_picker.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:schoolapp/firebase.dart';

//import 'codePage.dart';

//class LogIn extends StatefulWidget{
//  @override
// State<StatefulWidget> createState() {
// TODO: implement createState
//return loginState();
//  }


//}

//class loginState extends State<LogIn>{

//TextEditingController email=TextEditingController();
//TextEditingController password=TextEditingController();
//TextEditingController PhoneNumber=TextEditingController();


// String CounteryCode;

// @override
//Widget build(BuildContext context) {
// TODO: implement build
//return Scaffold(

//body:SafeArea(
//child:SizedBox.fromSize(
//size: MediaQuery.of(context).size,
//child:  Column(
//mainAxisSize: MainAxisSize.max,
//crossAxisAlignment: CrossAxisAlignment.stretch,
//children: [
//Image.asset("assets/imgs/busImage.jpg"),
//Text("SSB",style: TextStyle(
//  fontSize: 30
//),textAlign: TextAlign.center,),
//Padding(padding: EdgeInsets.all(0),child:
//Card(
//margin: EdgeInsets.all(30),
//shape: RoundedRectangleBorder(
//  borderRadius: BorderRadius.circular(10)

//),

//child:
//  Padding(
//  padding: EdgeInsets.all( 50),
//child:  Column(
//mainAxisAlignment: MainAxisAlignment.start,
//mainAxisSize: MainAxisSize.min,



//children: [

//Row(
//children: [

//                               CountryCodePicker(
//onChanged: (vv){
//setState(() {
//CounteryCode=vv.dialCode.toString();
//print(CounteryCode);

//});
//                               },
//                                                        onInit: (res){

//                              CounteryCode=res.dialCode.toString();


//                                                    },
//                       hideMainText: true,
//                     showFlagMain: true,
//                  showFlag: true,
///                 hideSearch: false,
//             showCountryOnly: true,
//         showOnlyCountryWhenClosed: true,
//         alignLeft: true,
//      ),

//Flexible
// (
//child:TextField(
//controller: PhoneNumber,
//decoration:InputDecoration(
//hintText: "Phone Number"
//,
//
//),
// ) ,
//)

//],
//),

//  Flexible
//(
//            child:TextField(
//                  controller: email,
//decoration:InputDecoration(
// hintText: "E-mail"
//      ,

//),
//                          ) ,
//                      )
//                      ,
//                       Flexible(child:     TextField(
//obscureText: true,
//                         controller: password,
//                       decoration:InputDecoration(
//
//                            hintText: "password"
//                          ,
//
//                         ),
//                    ))

//                 ],
//             ),






//Padding(padding: EdgeInsets.symmetric(horizontal: 30),child:    ElevatedButton(onPressed: () async {
//   server().logIn(context,email: email.value.text,password: password.value.text);

//Fluttertoast.showToast(
//msg: CounteryCode,
// toastLength: Toast.LENGTH_SHORT,
//gravity: ToastGravity.CENTER,
// timeInSecForIosWeb: 1,
//backgroundColor: Colors.red,
//textColor: Colors.white,
//fontSize: 16.0
//);
//server().LoginpartnerPhone(context,CounteryCode+PhoneNumber.value.text).then((value) {

//});







//          },
//          child:Padding(padding: EdgeInsets.symmetric(vertical: 15),
//        child:
//      Text("Log In As Partner",style: TextStyle(
//        fontSize: 30
//  ) ,)


//),
//style: ElevatedButton.styleFrom(
//  shape: RoundedRectangleBorder(
//    borderRadius: BorderRadius.circular(20),
//  side: BorderSide(
//    color: Colors.black38
//  ,width: 1,style: BorderStyle.solid
// )
// )
//),
//),)
//,
// Padding(padding: EdgeInsets.all(30),child:    ElevatedButton(onPressed: () {
//   server().logInDriver(context,email: email.value.text,password: password.value.text);
// server().LoginPhonedriver(context,CounteryCode+PhoneNumber.value.text).then((value) {

//});

//},
//child:Padding(padding: EdgeInsets.symmetric(vertical: 15),
//  child:
//Text("Log In As Driver",style: TextStyle(
//  fontSize: 30
//) ,)



//),
//style: ElevatedButton.styleFrom(
//  shape: RoundedRectangleBorder(
//    borderRadius: BorderRadius.circular(20),
//  side: BorderSide(
//    color: Colors.black38
//  ,width: 1,style: BorderStyle.solid
//)
// )
//),
//),)
//,







//],

//) ,
//)

//,
//)


//  )
//  ]
// )
//)
//));
//}

//}
























/*import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schoolapp/firebase.dart';

import 'codePage.dart';

class LogIn extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
return loginState();
  }


}

class loginState extends State<LogIn>{

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController PhoneNumber=TextEditingController();


  String CounteryCode;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(

     body:SafeArea(
       child:SizedBox.fromSize(
         size: MediaQuery.of(context).size,
         child:  Column(
           mainAxisSize: MainAxisSize.max,
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Image.asset("assets/imgs/busImage.jpg"),
             Text("SSB",style: TextStyle(
                 fontSize: 30
             ),textAlign: TextAlign.center,),
             Padding(padding: EdgeInsets.all(0),child:
             Card(
               margin: EdgeInsets.all(30),
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10)

               ),

               child:
                   Padding(
                     padding: EdgeInsets.all( 50),
                     child:  Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       mainAxisSize: MainAxisSize.min,



                       children: [

                         Row(
                           children: [

                                                            CountryCodePicker(
                                 onChanged: (vv){
setState(() {
  CounteryCode=vv.dialCode.toString();
  print(CounteryCode);

});
                                 },
                                                              onInit: (res){

                                     CounteryCode=res.dialCode.toString();


                                                              },
                                 hideMainText: true,
                                 showFlagMain: true,
                                 showFlag: true,
                                 hideSearch: false,
                                 showCountryOnly: true,
                                 showOnlyCountryWhenClosed: true,
                                 alignLeft: true,
                               ),

                             Flexible
                               (
                               child:TextField(
                                 controller: PhoneNumber,
                                 decoration:InputDecoration(
                                   hintText: "Phone Number"
                                   ,

                                 ),
                               ) ,
                             )

                           ],
                         ),

//                          Flexible
//                            (
//                            child:TextField(
//                              controller: email,
// decoration:InputDecoration(
//   hintText: "E-mail"
//       ,
//
// ),
//                            ) ,
//                          )
//                          ,
//                          Flexible(child:     TextField(
// obscureText: true,
//                            controller: password,
//                            decoration:InputDecoration(
//
//                              hintText: "password"
//                              ,
//
//                            ),
//                        ))

                       ],
                     ),
                   )

             ),

 ),
             Padding(padding: EdgeInsets.symmetric(horizontal: 30),child:    ElevatedButton(onPressed: () async {
            //   server().logIn(context,email: email.value.text,password: password.value.text);

               Fluttertoast.showToast(
                   msg: CounteryCode,
                   toastLength: Toast.LENGTH_SHORT,
                   gravity: ToastGravity.CENTER,
                   timeInSecForIosWeb: 1,
                   backgroundColor: Colors.red,
                   textColor: Colors.white,
                   fontSize: 16.0
               );
  server().LoginpartnerPhone(context,CounteryCode+PhoneNumber.value.text).then((value) {

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
          ,
             Padding(padding: EdgeInsets.all(30),child:    ElevatedButton(onPressed: () {
            //   server().logInDriver(context,email: email.value.text,password: password.value.text);
               server().LoginPhonedriver(context,CounteryCode+PhoneNumber.value.text).then((value) {

               });

             },
               child:Padding(padding: EdgeInsets.symmetric(vertical: 15),
                   child:
                   Text("Log In As Driver",style: TextStyle(
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
             ,







           ],

         ) ,
       )

     ,
     )


   );
  }

}*/