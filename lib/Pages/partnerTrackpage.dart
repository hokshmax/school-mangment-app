import 'dart:async';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:schoolapp/Pages/setUPlocation.dart';

class partnertrack extends StatefulWidget{
  String busId;
  partnertrack({this.busId});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return partnertrackState(busId: this.busId);
  }
  
}

class partnertrackState extends State<partnertrack>
{
String busId;
partnertrackState({this.busId});
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

      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection("driverAccount").where("busid",isEqualTo:this.busId).get(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
    {
      return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("location").doc(snapshot.data.docs.first.id).snapshots() ,
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot2) {

          print(snapshot2.data["latitude"]);

          return GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
                bearing: 192.8334901395799,
                target:LatLng(snapshot2.data["latitude"], snapshot2.data["longitude"]),
                tilt: 59.440717697143555,
                zoom: 19.151926040649414),
            markers: {
          Marker(markerId: MarkerId(
          "1"
          ),
          position:LatLng( snapshot2.data["latitude"], snapshot2.data["longitude"])


          )
            },
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);

            },

          );
        },);
    })
    );
         


  }

 void setuplov()
  async {
    locationData=await  location().getLocation();

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
setuplov();

  }

}