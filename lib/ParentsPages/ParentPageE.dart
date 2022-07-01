
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:schoolapp/ParentsPages/businfo.dart';
import 'package:schoolapp/ParentsPages/studentinfo.dart';
import 'informUpsense.dart';
import 'trackchildren.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/Pages/generate.dart';
import 'package:schoolapp/Pages/id.dart';
import 'package:schoolapp/Pages/setUPlocation.dart';
import 'package:schoolapp/widgets/DesginHomePE.dart';
import 'package:schoolapp/widgets/DrawerParentE.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:schoolapp/ParentsPages/EditProfileE.dart';

class partnerPage2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return PartnerPage2State();
  }

}


class PartnerPage2State extends State<partnerPage2>{
  String myid;

  @override
  Widget build(BuildContext context)  {
    // TODO: implement build
    return  Scaffold(

        appBar:AppBar(
            backgroundColor: Colors.white,
            elevation: 0,

            iconTheme: IconThemeData(color: Colors.amberAccent),
            toolbarHeight: 40,
            flexibleSpace: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end
                ,

                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text("SSB", textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(padding: EdgeInsets.only(left: 150),) ])

        ),
        backgroundColor: Colors.lightBlue[100],
        /* AppBar(
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
        ) ,*/
        drawer:DrawerParentE(),
/*Drawer(
  child:SafeArea(child: Column(
    children: [
      FutureBuilder(builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

        return Text(snapshot.data['parnterName'],style: TextStyle(
          fontSize: 30
        ),);

      },future: FirebaseFirestore.instance.collection("pernatsAccount").doc(myid).get()),
      InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>editpage(index: 0,)));
        },
        child:   Text("Edit Profile",style: TextStyle(
            color: Colors.orange,
            fontSize: 30
        ),),
      ),
      InkWell(
        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => generate())),
        child:  Text("MYQRCODE",style: TextStyle(
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
),*/

        body:
        //SizedBox.fromSize(size: MediaQuery.of(context).size,child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ParentHomeDesginE(
              text: "PROFILE",
              press: () => {
                Navigator.pushNamed(context, "PerantsView"),
              },
            ),
            ParentHomeDesginE(
              text: "STUDENTS",
              press: () => {
             // Navigator.push(context, MaterialPageRoute(builder: (context)=>inFormUpsenseView()))
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Studentsinfotest()))
                //Navigator.pushNamed(context, "attend"),
              },
            ),
            ParentHomeDesginE(
              text: "TRACK",
              press: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>trackChildrenView()))
                ,
              },
            ),
            ParentHomeDesginE(
              text: "CONTACT",
              press: () => {
                Navigator.pushNamed(context, "contactPartner"),
              },
            ),
            /*   Padding(padding: EdgeInsets.all(30),child:
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, "attend");

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
            ),),*/

            /* Padding(padding: EdgeInsets.all(30),child:    ElevatedButton(onPressed: () {  },
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
          ),)*/

            /*Padding(padding: EdgeInsets.all(30),child:    ElevatedButton(onPressed: () {

            Navigator.pushNamed(context, "partnerTrack");

          },
            child:Padding(padding: EdgeInsets.symmetric(vertical: 15),
                child:
                Text("TRACK",style: TextStyle(
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
,*/
            /*  Padding(padding: EdgeInsets.all(30),child:    ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, "contactPartner");

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
          ),)*/

          ],
        )

      // ,),
    );

  }

  @override
  void initState() {
    super.initState();
    location().getLocation();

    getid().get().then((value) {
      setState(() {
        myid=value
        ;
      });
    }
    );

  }
}