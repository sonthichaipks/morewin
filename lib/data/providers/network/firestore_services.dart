import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com.morepos.morewin/data/models/mngdata/login.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class GeoLocationService {
  // final _firestore = FirebaseFirestore.instance;
  late GeoPoint nowlocation;
  Future<void> updateUserLocation(String userId, LatLng location) async {
    try {
      // await _firestore.collection('users').doc(userId).update({
      //   'location': {'lat': location.latitude, 'lng': location.longitude},
      // });
      nowlocation = GeoPoint(location.latitude, location.longitude) ;
      // } on FirebaseException catch (f) {
    } catch (e) {}
  }

  // static Stream<List<User>> userCollectionStream() {
  //   return _firestore.collection('users').snapshots().map((snapshot) =>
  //       snapshot.docs.map((doc) => User.fromMap(doc.data())).toList());
  // }
}

class StreamLocationService {
  static const LocationSettings _locationSettings =
      LocationSettings(distanceFilter: 1);
  static bool _isLocationGranted = false;
 late Position curPoint;
  init() {
    if (askLocationPermission == true) {
      Geolocator.getPositionStream(locationSettings: _locationSettings);
    }
  }

  static Stream<Position>? get onLocationChanged {
    if (_isLocationGranted) {
      return Geolocator.getPositionStream(locationSettings: _locationSettings);
    }
    return null;
  }

  static Future<bool> askLocationPermission() async {
    _isLocationGranted = await Permission.location.request().isGranted;
    return _isLocationGranted;
  }

  Future<void> _getAddressFromLatLng(Position position) async {
  await placemarkFromCoordinates(
          curPoint!.latitude, curPoint!.longitude)
      .then((List<Placemark> placemarks) {
    Placemark place = placemarks[0];
    // setState(() {
      // _currentAddress =
      //    '${place.street}, ${place.subLocality},
      //     ${place.subAdministrativeArea}, ${place.postalCode}';
    // });
  }).catchError((e) {
    // debugPrint(e);
  });
 }
Future<void> getCurrentPosition() async {
  final hasPermission = await askLocationPermission();
  if (hasPermission) {
  await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high)
      .then((Position position) {
        curPoint=position;
        // return position;
    // setState(() => _currentPosition = position);
  });
  }else {

  }
}
}
