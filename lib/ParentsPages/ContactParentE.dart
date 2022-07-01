import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/Pages/chatPage.dart';
import 'package:schoolapp/widgets/DesginHomePE.dart';
import 'package:schoolapp/widgets/DrawerParentE.dart';

class contactPartner extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
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

      Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          ParentHomeDesginE(
            text: "Contact Driver",
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => chat(index: 0,)),
              ),},
          ),
          ParentHomeDesginE(
            text: "Contact School",
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => chat(index: 1,)),
              )},
          ),
          /* Padding(padding: EdgeInsets.all(30),child:    ElevatedButton(onPressed: () {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => chat(index: 0,)),
            );
          },
            child:Padding(padding: EdgeInsets.symmetric(vertical: 15),
                child:
                Text("Contact Driver",style: TextStyle(
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
          Padding(padding: EdgeInsets.all(30),child:    ElevatedButton(onPressed: () {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => chat(index: 1,)),
            );
          },
            child:Padding(padding: EdgeInsets.symmetric(vertical: 15),
                child:
                Text("Contact School",style: TextStyle(
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
      ),

    );


  }}