
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/codePage.dart';

class server {

  void perantchangeemail({String newemail}) {
    SharedPreferences.getInstance().then((value1) {
      String id = value1.get("id");

      FirebaseFirestore.instance.collection("pernatsAccount").doc(id)
          .get()
          .then((value) {
        FirebaseAuth.instance.signInWithEmailAndPassword(
            email: value.get('email'), password: value.get('password')).then((
            value1) {
          FirebaseAuth.instance.currentUser.updateEmail(newemail).then((
              value2) {
            FirebaseFirestore.instance.collection("pernatsAccount")
                .doc(id)
                .update({
              "email": newemail
            })
                .then((value) {
              Fluttertoast.showToast(
                  msg: "Your Email Updated",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            });
          }, onError: (err) {
            Fluttertoast.showToast(
                msg: (err as FirebaseAuthException).message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }).then((value3) {

          });
        });
      });
    });
  }

  void perantchangePassword({String newPassord}) {
    SharedPreferences.getInstance().then((value1) {
      String id = value1.get("id");

      FirebaseFirestore.instance.collection("pernatsAccount").doc(id)
          .get()
          .then((value) {
        FirebaseAuth.instance.signInWithEmailAndPassword(
            email: value.get('email'), password: value.get('password')).then((
            value1) {
          FirebaseAuth.instance.currentUser.updatePassword(newPassord).then((
              value2) {
            FirebaseFirestore.instance.collection("pernatsAccount")
                .doc(id)
                .update({
              "password": newPassord
            })
                .then((value) {
              Fluttertoast.showToast(
                  msg: "Your Password Updated",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            });
          }, onError: (err) {
            Fluttertoast.showToast(
                msg: (err as FirebaseAuthException).message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }).then((value3) {

          });
        });
      });
    });
  }

  void perantChangePhone({String newphone}) {
    SharedPreferences.getInstance().then((value1) {
      String id = value1.get("id");
      FirebaseFirestore.instance.collection("pernatsAccount").doc(id).update({

        "phone": newphone
      }).then((value) {
        Fluttertoast.showToast(
            msg: "Your Mobile Number Updated",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      });
    });
  }

  void driverchangeemail({String newemail}) {
    SharedPreferences.getInstance().then((value1) {
      String id = value1.get("id");

      FirebaseFirestore.instance.collection("driverAccount").doc(id)
          .get()
          .then((value) {
        FirebaseAuth.instance.signInWithEmailAndPassword(
            email: value.get('email'), password: value.get('password')).then((
            value1) {
          FirebaseAuth.instance.currentUser.updateEmail(newemail).then((
              value2) {
            FirebaseFirestore.instance.collection("driverAccount")
                .doc(id)
                .update({
              "email": newemail
            })
                .then((value) {
              Fluttertoast.showToast(
                  msg: "Your Email Updated",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            });
          }, onError: (err) {
            Fluttertoast.showToast(
                msg: (err as FirebaseAuthException).message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }).then((value3) {

          });
        });
      });
    });
  }

  void driverchangePassword({String newPassord}) {
    SharedPreferences.getInstance().then((value1) {
      String id = value1.get("id");

      FirebaseFirestore.instance.collection("driverAccount").doc(id)
          .get()
          .then((value) {
        FirebaseAuth.instance.signInWithEmailAndPassword(
            email: value.get('email'), password: value.get('password')).then((
            value1) {
          FirebaseAuth.instance.currentUser.updatePassword(newPassord).then((
              value2) {
            FirebaseFirestore.instance.collection("driverAccount")
                .doc(id)
                .update({
              "password": newPassord
            })
                .then((value) {
              Fluttertoast.showToast(
                  msg: "Your Password Updated",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            });
          }, onError: (err) {
            Fluttertoast.showToast(
                msg: (err as FirebaseAuthException).message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }).then((value3) {

          });
        });
      });
    });
  }

  void driverChangePhone({String newphone}) {
    SharedPreferences.getInstance().then((value1) {
      String id = value1.get("id");
      FirebaseFirestore.instance.collection("driverAccount").doc(id).update({

        "phone": newphone
      }).then((value) {
        Fluttertoast.showToast(
            msg: "Your Mobile Number Updated",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      });
    });
  }


  Future<String> LoginpartnerPhone(BuildContext context,
      String phoneNumber) async {
    String result;
    await FirebaseAuth.instance.verifyPhoneNumber(phoneNumber: phoneNumber,
        codeSent: (String verificationId, int forceResendingToken) {
          result = verificationId;

          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              codepage(result: result, phone: phoneNumber, index: 0,)));
        },
        verificationFailed: (FirebaseAuthException error) {
          Fluttertoast.showToast(
              msg: error.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        },
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {


        },
        codeAutoRetrievalTimeout: (String verificationId) {});


    return result;
  }

  Future<String> LoginPhonedriver(BuildContext context,
      String phoneNumber) async {
    print('maxx${phoneNumber}');
    String result;
    await FirebaseAuth.instance.verifyPhoneNumber(phoneNumber: phoneNumber,
        codeSent: (String verificationId, int forceResendingToken) {
          result = verificationId;


          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              codepage(result: result, phone: phoneNumber, index: 1,)));
        },
        verificationFailed: (FirebaseAuthException error) {
          Fluttertoast.showToast(
              msg: error.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        },
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {


        },
        codeAutoRetrievalTimeout: (String verificationId) {});


    return result;
  }

  logInperante(BuildContext context, {String email, String password}) async {
    var data;

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password).then((value) async {
      await FirebaseFirestore.instance.collection("pernatsAccount").doc(
          value.user.uid).get().then((value) {
        if (value.exists) {
          Navigator.popAndPushNamed(context, "parentPage");
        }
        else {
          Fluttertoast.showToast(
              msg: "Parent Data not Exist",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      });
    }, onError: (err) {
      Fluttertoast.showToast(
          msg: (err as FirebaseAuthException).message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    });

    return data;
  }

  logIn(BuildContext context, {String email, String password}) async {
    var data;

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password).then((value) async {
      //await FirebaseFirestore.instance.collection("pernatsAccount").doc(
      //  value.user.uid).get().then((value) {
      FirebaseFirestore.instance.collection("pernatsAccount").where(
          "email", isEqualTo: email).get().then((value1) async {
        print(value1.docs.first.id);

        if (value1.docs.first.exists) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("id", value1.docs.first.id).then((value) {
            Navigator.popAndPushNamed(context, "parentPage");
          });
        }
        /* if(value.exists)
              {
                Navigator.popAndPushNamed(context, "parentPage");
              }*/
        else {
          Fluttertoast.showToast(
              msg: "Parent Data not Exist",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      });
    }, onError: (err) {
      Fluttertoast.showToast(
          msg: (err as FirebaseAuthException).message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    });

    return data;
  }

  logInDriver(BuildContext context, {String email, String password}) async {
    var data;

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password).then((value) async {
      await SharedPreferences.getInstance().then((value1) {
        FirebaseFirestore.instance.collection("driverAccount").where(
            "email", isEqualTo: email).get().then((value1) async {
          print(value1.docs.first.id);

          if (value1.docs.first.exists) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("id", value1.docs.first.id).then((value) {
              Navigator.popAndPushNamed(context, "driverPage");
            });
          } else {
            Fluttertoast.showToast(
                msg: "your data not exist",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
        });
      });
    });
  }

  /* FirebaseFirestore.instance.collection("driverAccount").where("email",isEqualTo:email ).get().then((value1) async {
        print(value1.docs.first.id);

        if(value1.docs.first.exists)
        {

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("id", value1.docs.first.id).then((value) {
            Navigator.popAndPushNamed(context, "driverPage");
          });
        }
     /* await FirebaseFirestore.instance.collection("driverAccount").doc(
          value.user.uid).get().then((value) {
        if(value.exists)
        {
          Navigator.popAndPushNamed(context, "driverPage");
        }*/
        else{
          Fluttertoast.showToast(
              msg: "driverAccount Data not Exist",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }

      });
    },onError: (err){
      Fluttertoast.showToast(
          msg: (err as FirebaseAuthException).message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    });

    return data;
  }*/
  logInParent(BuildContext context, {String email, String password}) async {
    var data;

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password).then((value) async {
      await SharedPreferences.getInstance().then((value1) {
        FirebaseFirestore.instance.collection("pernatsAccount").where(
            "email", isEqualTo: email).get().then((value1) async {
          print(value1.docs.first.id);

          if (value1.docs.first.exists) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("id", value1.docs.first.id).then((value) {
              Navigator.popAndPushNamed(context, "driverPage");
            });
          } else {
            Fluttertoast.showToast(
                msg: "your data not exist",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
        });
      });
    });
  }

/* FirebaseFirestore.instance.collection("driverAccount").where("email",isEqualTo:email ).get().then((value1) async {
        print(value1.docs.first.id);

        if(value1.docs.first.exists)
        {

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("id", value1.docs.first.id).then((value) {
            Navigator.popAndPushNamed(context, "driverPage");
          });
        }
     /* await FirebaseFirestore.instance.collection("driverAccount").doc(
          value.user.uid).get().then((value) {
        if(value.exists)
        {
          Navigator.popAndPushNamed(context, "driverPage");
        }*/
        else{
          Fluttertoast.showToast(
              msg: "driverAccount Data not Exist",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }

      });
    },onError: (err){
      Fluttertoast.showToast(
          msg: (err as FirebaseAuthException).message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    });

    return data;
  }*/


  loginAll(BuildContext context,{String email, String password}) async
  {

    var data;

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password).then((value) async {
      //await FirebaseFirestore.instance.collection("pernatsAccount").doc(
      //  value.user.uid).get().then((value) {
     FirebaseFirestore.instance.collection("pernatsAccount").where("email",isEqualTo:email).get().then((value1) async {
        print(value1.docs.first.id);

        if(value1.docs.first.exists)
        {

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("id", value1.docs.first.id).then((value) {



            Navigator.popAndPushNamed(context, "parentPage");});}
        /* if(value.exists)
              {
                Navigator.popAndPushNamed(context, "parentPage");
              }*/
        else{
          Fluttertoast.showToast(
              msg: "Parent Data not Exist",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }

      });
    },onError: (err){
      Fluttertoast.showToast(
          msg: (err as FirebaseAuthException).message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    });



    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password).then((value) async {
      await SharedPreferences.getInstance().then((value1)  {
        FirebaseFirestore.instance.collection("driverAccount").where("email",isEqualTo:email).get().then((value1) async {
          print(value1.docs.first.id);

          if(value1.docs.first.exists)
          {

            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("id", value1.docs.first.id).then((value) {



              Navigator.popAndPushNamed(context, "driverPage");


            });
          }else{

            Fluttertoast.showToast(
                msg: "your data not exist",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );

          }




        });

      });});}
}