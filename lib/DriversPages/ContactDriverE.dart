import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/Pages/chatPage.dart';
import 'package:schoolapp/Pages/perantsDriver.dart';
import 'package:schoolapp/widgets/DesginHomePE.dart';
import 'package:schoolapp/widgets/DrawerDriverE.dart';
import 'package:schoolapp/widgets/DrawerParentE.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:schoolapp/Pages/drivercontacttest.dart';

class contactDriverE  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return contactDriverEState();
  }

}


class contactDriverEState extends State<contactDriverE>{




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
      drawer: DrawerDriverE(Id:id ,),

      body:

      Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          ParentHomeDesginE(
            text: "Contact Parent",
            press: () =>
            /*{
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => perantsDriver()),
              ),},*/
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => perantsDrivertest()),
              ),},
          ),
          ParentHomeDesginE(
            text: "Contact School",
            press: () => {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => chat(index: 3,)),
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


  }

  @override
  void initState() {
    getId();
    super.initState();
  }
}