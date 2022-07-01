import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'id.dart';

class editpage extends StatefulWidget{
  int index;
  editpage({this.index});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return editpageState(index: this.index);
  }

}

class editpageState extends State<editpage>{
  int index;
  TextEditingController getText=TextEditingController();

  editpageState({this.index});






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
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar:  AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back,color: Colors.black,),
                  ),
                  SizedBox(width: 2,),

                  SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
        body:
        SafeArea(child:   FutureBuilder(builder:(context,AsyncSnapshot<DocumentSnapshot> snap){
          getText.text=index==0? snap.data.get("parnterName"): snap.data.get("driverName") ;
          return Column(
            children: [
              Flexible(child:   Flexible
                (
                child:TextField(
                  controller: getText,
                  
                  decoration:InputDecoration(
                    hintText: "Phone Number"
                    
                    ,
                    labelText:"name"

                  ),
                ) ,
              )),
              Padding(padding: EdgeInsets.symmetric(horizontal: 30),child:    ElevatedButton(onPressed: () async {
                //   server().logIn(context,email: email.value.text,password: password.value.text);

                if(index!=0)
                  {
                    FirebaseFirestore.instance.collection("driverAccount").doc(myid).update({
                      "driverName":getText.value.text

                    });



                  }else{
                  FirebaseFirestore.instance.collection("pernatsAccount").doc(myid).update({
                  "parnterName":getText.value.text

                  });


                }






              },
                child:Padding(padding: EdgeInsets.symmetric(vertical: 15),
                    child:
                    Text("update",style: TextStyle(
                        fontSize: 30
                    ) ,)


                ),
                style: ElevatedButton.styleFrom(
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
          );
              
              
        }, future:index!=0? FirebaseFirestore.instance.collection("driverAccount").doc(myid).get():

        FirebaseFirestore.instance.collection("pernatsAccount").doc(myid).get()

        )
        )
    );
  }


}