import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:location/location.dart';

import 'id.dart';

class location{


  getLocation() async {

    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    getid().get().then((value) {
      FirebaseFirestore.instance.collection("location").doc(value).set({
        "latitude":_locationData.latitude,
        "longitude" :_locationData.longitude

      });

      location.onLocationChanged.listen((LocationData currentLocation) {
        FirebaseFirestore.instance.collection("location").doc(value).update({
          "latitude":currentLocation.latitude,
          "longitude" :currentLocation.longitude

        });
      });

    }
    );



return _locationData;
  }

}