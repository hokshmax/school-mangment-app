import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/DriversPages/ContactDriverE.dart';
import 'package:schoolapp/DriversPages/DriverPageE.dart';
import 'package:schoolapp/DriversPages/DriverProfileE.dart';
import 'package:schoolapp/DriversPages/EditEmailDE.dart';
import 'package:schoolapp/DriversPages/EditPassDE.dart';
import 'package:schoolapp/DriversPages/EditPhoneDE.dart';
import 'package:schoolapp/DriversPages/AllStudents.dart';
import 'package:schoolapp/Pages/LogIn.dart';
import 'package:schoolapp/Pages/LoginWithEmail.dart';
import 'package:schoolapp/Pages/LoginWithPhone.dart';
import 'package:schoolapp/Pages/StartLogin.dart';
import 'package:schoolapp/Pages/parentPage.dart';
import 'package:schoolapp/Pages/partnerAttendes.dart';
import 'package:schoolapp/Pages/partnerTrackpage.dart';
import 'package:schoolapp/ParentsPages/EditEmailPE.dart';
import 'package:schoolapp/ParentsPages/EditPassPE.dart';
import 'package:schoolapp/ParentsPages/EditPhonePE.dart';
import 'package:schoolapp/ParentsPages/ParentPageE.dart';
import 'package:schoolapp/ParentsPages/ParentProfileE.dart';
import 'package:schoolapp/ParentsPages/StudentsInfoE.dart';

import 'DriversPages/AttendenseCat.dart';
import 'Pages/ContactPartner.dart';
import 'Pages/chatPage.dart';
import 'Pages/driverAttendes.dart';
import 'Pages/driverContact.dart';
import 'Pages/driverPage.dart';
import 'Pages/driverStudentsLocation.dart';
import 'Pages/perantsDriver.dart';
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.




  print("Handling a background message: ${message.messageId}");
}



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MyApp());

}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

        initialRoute: "startlogin",

        routes:{
          "startlogin":(context)=>Loginstart(),
          // '/':(context)=>LogIn(),
          //   "LogIn":(context)=>LogIn(),
          "LogInWithEmail": (context) => LogInWithEmail(),
          "LogInWithPhone": (context) =>LogInWithPhone(),
          "parentPage":(context)=>partnerPage2(),
         "driverPage":(context)=>DriverPageE(),
       // "driverPage":(context)=>driverPage(),
          "partnerTrack":(context)=>partnertrack(),

          "attendenseCat":(context)=>attendenseCat(),

          "contactPartner":(context)=>contactPartner(),
        //  "ProfileParentE":(context)=>ProfileParentE(),
          "DriversView":(context)=>PerantddView(),
          "PerantsView":(context)=>PerantsView(),
          "allStudentsView":(context)=>allStudentsView(),

          "attend":(context)=>partnerAtten(),
          "contactDriver":(context)=>contactDriver(),
          "contactDriverE":(context)=>contactDriverE(),
          "perantsDriver":(context)=>perantsDriver(),
          "driverAttendes":(context)=>driverAttendes(),
          "DriverStudentsLocation":(context)=>DriverStudentsLocation(),
          "StudentInfo":(context)=>StudentsView(),
          "EditEmailPer":(context)=>editemail(),
          "EditPassPer":(context)=>editpassPE(),
          "EditPhonePer":(context)=>editphonePE(),
          "EditEmailDE":(context)=>editemailDE(),
          "EditPassDE":(context)=>editpassDE(),
          "EditPhoneDE":(context)=>editphoneDE(),













        }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
