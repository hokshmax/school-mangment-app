import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:schoolapp/Pages/id.dart';
import 'package:schoolapp/firebase.dart';
import 'package:schoolapp/widgets/DrawerDriverE.dart';
import 'package:schoolapp/widgets/DrawerParentE.dart';



class editpassDE extends StatefulWidget{
  int index;
  editpassDE({this.index});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return editpassDEState(index: this.index);
  }

}

class editpassDEState extends State<editpassDE>{
  int index;
  TextEditingController getText=TextEditingController();
  TextEditingController reapetPass=TextEditingController();
  var _formKey = GlobalKey<FormState>();

  editpassDEState({this.index});






  String myid;
  @override
  void initState() {
    super.initState();

    getid().get().then((value) {
      setState(() {
        myid=value;




      });
    }
    );

  }
  @override
  void dispose() {
    reapetPass.dispose();
    getText.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar:
        AppBar(
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
        drawer: DrawerDriverE(Id: myid,),
        body:  StreamBuilder(
          stream:  FirebaseFirestore.instance.collection("driverAccount").where("nationalId",isEqualTo: myid).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snap) {
            // FutureBuilder(builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            // getText.text=snapshot.data.get("parnterName");
            //  getText.text==0? snap.data.get("parnterName"): snap.data.get("driverName") ;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:50.0,horizontal: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 80,horizontal:40 ),
                    child: Column(
                      children:[
                    Center(child: Text('Update Password',style: TextStyle(fontSize: 24, color: Colors.amber,fontWeight: FontWeight.w600))),
                  SizedBox(height: 20,),

                  Text('Please enter your new Password',style: TextStyle(fontSize: 18, color: Colors.black,)),
                  SizedBox(height: 20,),
                  Form(
                      key: _formKey,
                      child:Column(
                          children:[
                            TextFormField(
                              controller: getText,

                              decoration: InputDecoration(
                                hintText: "Password",

                              ),
                              obscureText: true,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: " Repeat Password",
                              ),
                              obscureText: true,
                              controller: reapetPass,

                            ),])),
                  Padding(
                    padding: const EdgeInsets.all(35),
                    child: ElevatedButton(onPressed: () async {
                      if(getText.text==reapetPass.text) {
                        server().driverchangePassword(newPassord: getText.value.text);
                      }
                      else{

                        setState(() {

                          Fluttertoast.showToast(
                              msg:'Password dose not match',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 5,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        });

                      }



                    },

                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),
                                child:
                                Text("UPDATE", textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.1,
                                    color: Colors.white,
                                  ),)


                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                    color: Colors.amberAccent
                                    , width: 2.5, style: BorderStyle.solid
                                ),
                              ),
                              primary: Colors.lightBlue[100], // background
                            ),
                          ),
                        )


                      ],
                    ),
                  ),
                ),
              ),
            );},
          //future:FirebaseFirestore.instance.collection("pernatsAccount").doc(myid).get())
        ));
    //)));
  }
//  ),
//    ],
//   ),
//   );
}
//));


//},
//future:FirebaseFirestore.instance.collection("pernatsAccount").doc(myid).get()
//index!=0? FirebaseFirestore.instance.collection("driverAccount").doc(myid).get():



// )
//  )
// );
//  }}
