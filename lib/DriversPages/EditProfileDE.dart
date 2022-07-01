

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/widgets/DrawerDriverE.dart';
import 'package:schoolapp/widgets/EditDesign.dart';
import 'package:schoolapp/widgets/DesginHomePE.dart';
import 'package:schoolapp/widgets/DrawerParentE.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:schoolapp/DriversPages/verfiypassDE.dart';

class EditProfileDE extends StatefulWidget{
  EditProfileDE({Key key}):super (key:key);
  @override
  _EditProfileDEState createState() => _EditProfileDEState();

}

class _EditProfileDEState extends State<EditProfileDE> {

  @override
  Widget build(BuildContext context) {
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
        drawer: DrawerDriverE(Id: this.id),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EditDesign(
                icon: Icons.remove_red_eye,
                text: "CHANGE PASSWORD",
                press: () =>
                {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>verfiyPassDE()))

              },
              ),
              EditDesign(
                icon: Icons.email,
                text: "CHANGE EMAIL",
                press: () =>
                {
                  Navigator.of(context).pushReplacementNamed('EditEmailDE'),
                  //Navigator.of(context).pushReplacementNamed('attendeese'),
                },
              ),
              EditDesign(
                icon: Icons.phone_iphone,
                text: "CHANGE MOBILE NUMBER",
                press: () =>
                {
                  Navigator.of(context).pushReplacementNamed('EditPhoneDE'),
                },
              ),
            ]
        )
    );
  }


  String id;

  @override
  void initState() {
    super.initState();
    getId();
  }

  void getId() {
    SharedPreferences.getInstance().then((value1) {
      setState(() {
        id = value1.get("id");
      });
    });
  }
}