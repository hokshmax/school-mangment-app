import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/Pages/editProfile.dart';
import 'package:schoolapp/Pages/qrScan.dart';
import 'package:schoolapp/Pages/setUPlocation.dart';

import 'id.dart';

class driverPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return DriverPageState();
  }

}

class DriverPageState extends State<driverPage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(

      appBar:
      AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        iconTheme: IconThemeData(color: Colors.orange),
        toolbarHeight: 100,
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end
          ,

          children: [
            Text("SSB",style: TextStyle(
                fontSize: 30
            ),textAlign: TextAlign.center,)
            ,
            SafeArea(child: Image.asset("assets/imgs/busImage.jpg",width: 150,height: 100,)),
          ],
        ) ,
      ) ,

      drawer:Drawer(
        child:SafeArea(child: Column(
          children: [
            FutureBuilder(builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

              return Text(snapshot.data['driverName'],style: TextStyle(
                  fontSize: 30
              ),);

            },future: FirebaseFirestore.instance.collection("driverAccount").doc(myid).get(),),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>editpage(index: 1,)));
              },
              child:   Text("Edit Profile",style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30
              ),),
            )
          ,
            InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => QRViewExample())),
              child:  Text("ScanQr",style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30
              ),),
            )
            ,

            Text("LogOut",style: TextStyle(
                color: Colors.orange,
                fontSize: 30
            ),)
          ],
        ),
        ) ,
      ),

      body: SizedBox.fromSize(size: MediaQuery.of(context).size,child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,          children: [
        Padding(padding: EdgeInsets.all(30),child:    ElevatedButton(onPressed: () { 
          
          Navigator.pushNamed(context, "driverAttendes");
          
        },
          child:Padding(padding: EdgeInsets.symmetric(vertical: 15),
              child:
              Text("ATTENDES",style: TextStyle(
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
        ),),

        Padding(padding: EdgeInsets.all(30),child:    ElevatedButton(onPressed: () {  },
          child:Padding(padding: EdgeInsets.symmetric(vertical: 15),
              child:
              Text("Bus",style: TextStyle(
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
        Padding(padding: EdgeInsets.all(30),child:    ElevatedButton(onPressed: () {

          Navigator.pushNamed(context, "DriverStudentsLocation");
        },
          child:Padding(padding: EdgeInsets.symmetric(vertical: 15),
              child:
              Text("studens House Location",style: TextStyle(
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
        Padding(padding: EdgeInsets.all(30),child:    ElevatedButton(onPressed: () {
          Navigator.pushNamed(context, "contactDriver");

        },
          child:Padding(padding: EdgeInsets.symmetric(vertical: 15),
              child:
              Text("CONTACT",style: TextStyle(
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

      ],
      )

        ,),
    );

  }
String myid;

  @override
  void initState() {
    super.initState();
    location().getLocation();

    getid().get().then((value) {


      setState(() {
        myid=value;
        setToken(value);


      });
    }
    );
  }

 void setToken(val)
   {
    FirebaseMessaging.instance.getToken( ).then((value) {
     FirebaseFirestore.instance.collection("Tokens").doc(val).set({"token":value});
     print("sasa"+value);

   });

  }
}