// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
//
// class MyLocation extends StatefulWidget {
//   @override
//   _MyLocationState createState() => _MyLocationState();
// }
//
// class _MyLocationState extends State<MyLocation> {
//   String location = 'Null, Press Button';
//   String Address = 'search';
//
//   //final double latitude = ; // Replace with your latitude
//
//   void getCurrentPosition() async {
//     //final  UserLiveLocationController _userlivelocation =
//     //Get.put(UserLiveLocationController());
//     //permission
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied ||
//         permission == LocationPermission.deniedForever) {
//       print("permission not given");
//       LocationPermission asked = await Geolocator.requestPermission();
//     } else {
//       Position currentPosition = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.best);
//
//       // Future<void> GetAddressFromLatLong(Position position) async {
//       //   List<Placemark> placemarks = await placemarkFromCoordinates(
//       //       position.latitude, position.longitude);
//       //   print(placemarks);
//       //   Placemark place = placemarks[0];
//       //   Address =
//       //       '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
//       //   setState(() {});
//       // }
//
//       var lang = "Longitude:${currentPosition.longitude.toDouble()}";
//       var lat = "Latitude:${currentPosition.latitude.toDouble()}";
//       print(lang);
//       print(lat);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //var userlocation = Provider.of<getCurrentPosition>(context);
//     //Position currentPosition =  Geolocator.getCurrentPosition(
//     // desiredAccuracy: LocationAccuracy.best) as Position;
//     //var lang = "Longitude:${currentPosition.longitude.toString()}";
//     //var lat = "Latitude:${currentPosition.latitude.toString()}";
//
//     return Scaffold(
//         body: SafeArea(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           //lang = "Longitude:${currentPosition.longitude.toString()}";
//           // lat = "Latitude:${currentPosition.latitude.toString()}";
//           SizedBox(
//             height: 00,
//           ),
//           Text(
//               //"Location: Lat:${userlocation.latitude}"
//               "Latitude:"),
//           Text("Longitude:"),
//           //Geolocator.distanceBetween(lang, startLongitude, endLatitude, endLongitude)
//           // Geolocator.getCurrentPosition();
//           // Text("Longitude${lat}"),
//           Align(
//             alignment: Alignment.center,
//             child: ElevatedButton(
//               onPressed: () async {
//                 getCurrentPosition();
//                 //Position position = await _getGeoLocationPosition();
//                 // GetAddressFromLatLong();
//               },
//               child: Text("Get current position"),
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }

///MyLocation
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({Key? key}) : super(key: key);

  @override
  State<MyLocation> createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location Page")),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('LAT: ${_currentPosition?.latitude ?? ""}'),
              Text('LNG: ${_currentPosition?.longitude ?? ""}'),
              Text('ADDRESS: ${_currentAddress ?? ""}'),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _getCurrentPosition,
                child: const Text("Get Current Location"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
