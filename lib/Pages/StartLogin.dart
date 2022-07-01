import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:schoolapp/Pages/LogIn.dart';
//import 'package:schoolapp/Pages/LogInWithPhone.dart';
import 'package:schoolapp/Pages/LoginWithEmail.dart';
import 'package:schoolapp/Pages/LoginWithPhone.dart';

class Loginstart extends StatefulWidget {
  @override
  _LoginstartState createState() => _LoginstartState();
}

class _LoginstartState extends State<Loginstart> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  Image.asset('assets/imgs/screen.jpg', height: 290,),
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
            SizedBox(height: 20,),
            Expanded(
                child: ListView(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 350,
                            height: 80,
                            child: MaterialButton(
                              color: Colors.white,
                              onPressed: ()  {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LogInWithEmail())
                                );
                              },
                              shape: RoundedRectangleBorder(side: BorderSide(
                                  color: Colors.lightBlue[100],
                                  width: 1.5,
                                  style: BorderStyle.solid
                              ), borderRadius: BorderRadius.circular(15)),
                              child: Text('LOG IN WITH EMAIL',
                                  style: TextStyle(
                                    color: Colors.amberAccent[100],
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.1,
                                  )),
                            ),
                          ),
                          SizedBox(height: 20,),

                          Container(
                            width: 350,
                            height: 80,
                            child: MaterialButton(
                              color: Colors.amberAccent[100],
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LogInWithPhone())
                                );

                              },
                              shape: RoundedRectangleBorder(side: BorderSide(
                                  color: Colors.black54,
                                  width: 1,
                                  style: BorderStyle.solid
                              ), borderRadius: BorderRadius.circular(15)),
                              child: Text('LOG IN WITH PHONE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.1,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ]
                  ,)

            )]
      ),

    );
  }
}