import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/Pages/chatPage.dart';

class contactPartner extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Padding(padding: EdgeInsets.all(30),child:    ElevatedButton(onPressed: () {

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
          ),)
        ],
      ),

    );


}}