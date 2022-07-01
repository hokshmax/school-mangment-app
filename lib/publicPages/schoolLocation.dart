import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:schoolapp/Pages/driverStudentsLocationMap.dart';

class SchoolLocationMap extends StatefulWidget{
  String schoolid;
  SchoolLocationMap({this.schoolid});


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SchoolLocationMapState(schoolid: this.schoolid);
  }

}

class SchoolLocationMapState extends State<SchoolLocationMap>
{

  String schoolid;
  SchoolLocationMapState({this.schoolid});

  LocationData locationData;


  Completer<GoogleMapController> _controller = Completer();
  static  CameraPosition locCamera = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Marker user=Marker(markerId: MarkerId(
      "1"
  ),
      position: LatLng(37.43296265331129, -122.08832357078792)


  );



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body:FutureBuilder(
        future: FirebaseFirestore.instance.collection("location").doc(this.schoolid).get(),
        builder:

            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {


          if(!snapshot.hasData){

            return

              Center(child:  CircularProgressIndicator());
          }

          print(snapshot.data.toString());



          locCamera = CameraPosition(
              bearing: 192.8334901395799,
              target: LatLng((snapshot.data.get('latitude')as double),(snapshot.data.get('longitude')as double)),
              tilt: 59.440717697143555,
              zoom: 19.151926040649414);


          user=Marker(markerId: MarkerId(
              "1"
          ),
              position: LatLng(snapshot.data.get('latitude'),snapshot.data.get('longitude'))


          );



          return  GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition:locCamera ,
            markers: {
              user

            },
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          );

        },)

      ,


    );
  }

  void setuplov()
  async {


    setState(() {
      locCamera = CameraPosition(
          bearing: 192.8334901395799,
          target: LatLng(locationData.latitude, locationData.longitude),
          tilt: 59.440717697143555,
          zoom: 19.151926040649414);


      user=Marker(markerId: MarkerId(
          "1"
      ),
          position: LatLng(locationData.latitude, locationData.longitude)


      );
    });

  }

  @override
  initState()  {
    super.initState();
    //  setuplov();

  }

}