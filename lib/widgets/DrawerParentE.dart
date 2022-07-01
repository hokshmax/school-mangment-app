import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/Pages/StartLogin.dart';

import 'package:schoolapp/Pages/generate.dart';
import 'package:schoolapp/Pages/parentPage.dart';
import 'package:schoolapp/ParentsPages/EditProfileE.dart';
import 'package:schoolapp/ParentsPages/ParentProfileE.dart';
import 'package:schoolapp/ParentsPages/StudentsInfoE.dart';
import 'package:schoolapp/ParentsPages/studentinfo.dart';
import 'package:schoolapp/widgets/StyleMenu.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schoolapp/Pages/editProfile.dart';
import 'package:schoolapp/Pages/id.dart';

import 'package:shared_preferences/shared_preferences.dart';

class DrawerParentE extends StatefulWidget {
  DrawerParentE({Key key}):super (key:key);
  @override
  _DrawerParentEState createState() => _DrawerParentEState();

}

class _DrawerParentEState extends State<DrawerParentE> {

  void initState() {
    getId();

    super.initState();
  }

  String id;

  void getId() {
    SharedPreferences.getInstance().then((value1) {
      setState(() {
        id = value1.get("id");

      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child:Column(
            children: <Widget>[
              //  DrawerHeader(
              //  decoration: BoxDecoration(
              //    gradient: LinearGradient(
              //      colors: <Color>[Colors.lightBlue, Colors.blueGrey])),
              //  child: Container(
              // Container(
              //    child: Column(
              //     children: <Widget>[

              // borderRadius: BorderRadius.all(Radius.circular(50)),
              // elevation: 10,
              //child: Padding(
              //padding: EdgeInsets.all(8),

              //)

              //SafeArea(child: Padding(
              //padding: const EdgeInsets.only(left:100),
              //child: Row(
              //children: [
              //Icon(Icons.person, size: 20),
              //  DrawerParentNE(),
              FutureBuilder(
                  future: FirebaseFirestore.instance.collection("pernatsAccount").doc(id).get(),
                  builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snap) {
                    if (!snap.hasData) {
                      return Text("");
                    }
                    return Flexible(child: ListView.builder(
                        itemCount: 1,

                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                            child: Column(
                              children:<Widget> [
                                Icon(Icons.person, size: 80),
                                Text(snap.data["parnterName"].toString(),style: TextStyle(
                                    fontSize: 20, color: Colors.black
                                ),),
                                CustomListTile(
                                    Icons.home,
                                    'Home Page',
                                        () =>
                                    {
                                        Navigator.popAndPushNamed(context, "parentPage")
                                    }),
                                CustomListTile(
                                    Icons.person, 'Edit Profile', () => {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfilePE()))
                                  // Navigator.of(context).pushReplacementNamed('editprofilepe'),
                                }),
                              /*  CustomListTile(Icons.face, 'Children Profiles', () => {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Studentsinfotest()))
                                }),*/
                                // CustomListTile(Icons.chat,'Contact',()=>{}),
                                CustomListTile(Icons.exit_to_app, 'Logout', () =>
                                {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginstart()))
                                }),
                                FlatButton(
                                  onPressed: () {
                                   // Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfilePE()));
                                  },
                                  child: Text(
                                    'التحويل الى اللغة العربية',
                                    style: TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          );
                        }));}),



            ] )
    );
  }}
