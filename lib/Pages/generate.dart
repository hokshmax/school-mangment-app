import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/widgets/DrawerParentE.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import 'id.dart';

class generate extends StatefulWidget{


String studentID;

generate({this.studentID});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return generateState( studentID: this.studentID);
  }

}

class generateState extends State<generate>{


  String studentID;
String nationalId;
String myid;

  generateState({ this.studentID});


  @override
  void initState() {
    super.initState();

    // getid().get().then((value) {
    //   setState(() {
    //     myid=value;
    //     getNationalID();
    //
    //
    //   });
    // }
    // );
  }
  
  getNationalID()
  async {
  await  FirebaseFirestore.instance.collection("pernatsAccount").doc(myid).get().then((value) {

setState(() {
  nationalId=value.get("nationalId").toString();

});


    });
    
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar:  AppBar(
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
        SafeArea(child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height/2,
            width:  MediaQuery.of(context).size.height/2,
            child: SfBarcodeGenerator(
              value: studentID,
              symbology: QRCode(),
            ),
          ),
          ),
        )
        
    );
  }


}