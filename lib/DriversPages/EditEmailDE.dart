import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:schoolapp/Pages/id.dart';
import 'package:schoolapp/firebase.dart';
import 'package:schoolapp/widgets/DrawerDriverE.dart';
import 'package:schoolapp/widgets/DrawerParentE.dart';


class editemailDE extends StatefulWidget{
  int index;
  editemailDE({this.index});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return editemailDEState(index: this.index);
  }

}

class editemailDEState extends State<editemailDE>{
  int index;
  TextEditingController getText=TextEditingController();

  editemailDEState({this.index});


  String nationalId;
  String myid;


  @override
  void initState() {
    super.initState();
    getid().get().then((value) {
      setState(() {
        myid = value;
        getNationalID();
      });
    }
    );
  }

  getNationalID() async {
    await FirebaseFirestore.instance.collection("driverAccount").doc(myid)
        .get()
        .then((value) {
      setState(() {
        nationalId = value.get("nationalId").toString();
      });
    });
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
          stream:  FirebaseFirestore.instance.collection("driverAccount").where("nationalId",isEqualTo:nationalId).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snap) {
            // FutureBuilder(builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            // getText.text=snapshot.data.get("parnterName");
            //  getText.text==0? snap.data.get("parnterName"): snap.data.get("driverName") ;
            if (!snap.hasData) {
    return Center(
    child: CircularProgressIndicator(),
    );
    }

    return Center(

    child: Column(
    children: [

    Flexible(child: ListView.builder(
    itemCount: 1,

    itemBuilder: (BuildContext context, int index) {
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
    children: [
    Center(child: Text('Update Email',style: TextStyle(fontSize: 24, color: Colors.amber,fontWeight: FontWeight.w600))),
    SizedBox(height: 20,),

    Text('Please enter your new Email',style: TextStyle(fontSize: 18, color: Colors.black,)),
    SizedBox(height: 20,),
    TextField(
    controller: getText,

    decoration: InputDecoration(
    hintText: snap.data.docs.elementAt(index)
        .data()['email'].toString(),

    ),
    ),
    Padding(
    padding: const EdgeInsets.all(30),
    child: ElevatedButton(onPressed: () async {
                          //   server().logIn(context,email: email.value.text,password: password.value.text);
                          // FirebaseFirestore.instance.collection(
                          //     "driverAccount").doc(
                          //     myid).update({
                          //   "email": getText.value.text});
                          /*  if(index!=0)
                                     {
                                       FirebaseFirestore.instance.collection("driverAccount").doc(myid).update({
                                         "driverName":getText.value.text

                                       });



                                     }else{
                                     FirebaseFirestore.instance.collection("pernatsAccount").doc(myid).update({
                                     "parnterName":getText.value.text

                                     });


                                      }*/
server().driverchangeemail(newemail: getText.value.text);

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
            ));},
          //future:FirebaseFirestore.instance.collection("pernatsAccount").doc(myid).get())
        ))]));
    //)));
  }));
//  ),
//    ],
//   ),
//   );
}}
//));


//},
//future:FirebaseFirestore.instance.collection("pernatsAccount").doc(myid).get()
//index!=0? FirebaseFirestore.instance.collection("driverAccount").doc(myid).get():



// )
//  )
// );
//  }}
