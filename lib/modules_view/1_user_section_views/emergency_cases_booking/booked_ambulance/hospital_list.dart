import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/google_map/new_map/secrets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/my_theme.dart';
import '../controllerss/emergency_controllers.dart';

const API_KEY = Secrets.API_KEY; // Replace with your Google Maps API Key

class HospitalListScreen extends StatefulWidget {
  const HospitalListScreen({Key? key}) : super(key: key);

  @override
  _HospitalListScreenState createState() => _HospitalListScreenState();
}

class _HospitalListScreenState extends State<HospitalListScreen> {
  List<dynamic> _hospitals = [];
  Position? _currentPosition;
  AmbulanceEmergencygetController _ambulanceEmergencygetController =
      Get.put(AmbulanceEmergencygetController());

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = position;
      });
      _getNearbyHospitals();
    } catch (e) {
      print("Error getting current location: $e");
    }
  }

  Future<void> _getNearbyHospitals() async {
    if (_currentPosition != null) {
      final response = await http.get(
        Uri.parse(
            'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${_currentPosition!.latitude},${_currentPosition!.longitude}&radius=10000&type=hospital&key=$API_KEY'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'OK') {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          List<String> hospitalCoordinates = [];
          List<String> hospitalCoordinateslat = [];
          List<String> hospitalCoordinateslang = [];

          for (var hospital in data['results']) {
            String latLng =
                '${hospital['geometry']['location']['lat']},${hospital['geometry']['location']['lng']}';
            hospitalCoordinates.add(latLng);
            String latemg = '${hospital['geometry']['location']['lat']}';
            hospitalCoordinateslat.add(latemg);

            String Lngemg = '${hospital['geometry']['location']['lng']}';
            hospitalCoordinateslang.add(Lngemg);
            print("latemergency${latemg}");
            print("lngemergency${Lngemg}");
          }
          await prefs.setStringList('hospitalCoordinates', hospitalCoordinates);
          await prefs.setStringList(
              'hospitalCoordinateslat', hospitalCoordinateslat);
          await prefs.setStringList(
              'hospitalCoordinateslang', hospitalCoordinateslang);
          print("hospitalCoordinateslat${hospitalCoordinateslat}");
          print("hospitalCoordinateslang${hospitalCoordinateslang}");

          // Sorting hospitals by distance
          List<dynamic> sortedHospitals = List.from(data['results']);
          sortedHospitals.sort((a, b) {
            double distanceToA = double.parse(_calculateDistance(
                _currentPosition!,
                a['geometry']['location']['lat'],
                a['geometry']['location']['lng']));
            double distanceToB = double.parse(_calculateDistance(
                _currentPosition!,
                b['geometry']['location']['lat'],
                b['geometry']['location']['lng']));
            return distanceToA.compareTo(distanceToB);
          });

          setState(() {
            _hospitals = sortedHospitals;
          });
        }
      } else {
        throw Exception('Failed to load hospitals');
      }
    }
  }

  String _calculateDistance(Position currentPosition, double lat, double lng) {
    double distanceInMeters = Geolocator.distanceBetween(
      currentPosition.latitude!,
      currentPosition.longitude!,
      lat,
      lng,
    );
    double distanceInKm = distanceInMeters / 1000;
    return distanceInKm.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        elevation: 0,
        title: Text('Nearest Hospital List'),
      ),
      body: _currentPosition == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _hospitals.length,
              itemBuilder: (context, index) {
                var hospital = _hospitals[index];
                // Ensure 'place_id' exists in hospital data
                String placeId = hospital['place_id'] ?? '';

                double lat = hospital['geometry']['location']['lat'];
                double lng = hospital['geometry']['location']['lng'];
                String distance =
                    _calculateDistance(_currentPosition!, lat, lng);
                String photoReference = '';
                if (hospital.containsKey('photos')) {
                  photoReference = hospital['photos'][0]['photo_reference'];
                }

                // Retrieve latitude and longitude for the hospital from SharedPreferences
                //SharedPreferences prefs = await SharedPreferences.getInstance();
                //String lat2 = prefs.getString('hospital_lat_$placeId') ?? '';
                //String lng2 = prefs.getString('hospital_lng_$placeId') ?? '';

                // Convert latitude and longitude strings to double

                // Print converted values for debugging
                print('Converted Latitude: $lat, Converted Longitude: $lng');

                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: PhysicalModel(
                    color: MyTheme.ThemeColors,
                    shadowColor: MyTheme.containercolor1,
                    borderRadius: BorderRadius.circular(10),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        height: size.height * 0.13,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.cyanAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 55,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: photoReference.isNotEmpty
                                    ? NetworkImage(
                                        'https://maps.googleapis.com/maps/api/place/photo?maxwidth=1000&photoreference=$photoReference&key=$API_KEY')
                                    : AssetImage('lib/assets/image/noimage.jpg')
                                        as ImageProvider,
                              ),
                            ),
                          ),
                          trailing: InkWell(
                            onTap: () async {
                              // Pass the latitude and longitude to the method
                              if (lat != 0.0 && lng != 0.0) {
                                _ambulanceEmergencygetController
                                    .googlerequestemergencyambulance(lat, lng);
                              } else {
                                // Handle case where latitude or longitude is not available
                                print(
                                    'Latitude or longitude not available for this hospital.');
                              }
                              // Perform action on tap
                            },
                            child: Container(
                              width: 25,
                              height: 60,
                              child: Center(
                                child: Icon(
                                  Icons.arrow_circle_right_rounded,
                                  size: size.height * 0.045,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            hospital['name'],
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                hospital['vicinity'],
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: size.height * 0.016,
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.005,
                              ),
                              Text(
                                'Distance: $distance km',
                                style: TextStyle(
                                  fontSize: size.height * 0.016,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo,
                                ),
                              ),
                            ],
                          ),
                          // You can customize the list tile as needed
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

      ///
      // ListView.builder(
      //         itemCount: _hospitals.length,
      //         itemBuilder: (context, index) {
      //           var hospital = _hospitals[index];
      //           // Ensure 'place_id' exists in hospital data
      //           //String placeId = hospital['place_id'] ?? '';
      //
      //           //var hospital = _hospitals[index];
      //           double lat = hospital['geometry']['location']['lat'];
      //           double lng = hospital['geometry']['location']['lng'];
      //           String distance =
      //               _calculateDistance(_currentPosition!, lat, lng);
      //           String photoReference = '';
      //           if (hospital.containsKey('photos')) {
      //             photoReference = hospital['photos'][0]['photo_reference'];
      //           }
      //           return Padding(
      //             padding: const EdgeInsets.all(4.0),
      //             child: PhysicalModel(
      //               color: MyTheme.ThemeColors,
      //               shadowColor: MyTheme.containercolor1,
      //               borderRadius: BorderRadius.circular(10),
      //               elevation: 5,
      //               child: Padding(
      //                 padding: const EdgeInsets.all(0.0),
      //                 child: Container(
      //                   height: size.height * 0.13,
      //                   width: size.width,
      //                   decoration: BoxDecoration(
      //                     color: Colors.cyanAccent,
      //                     borderRadius: BorderRadius.circular(10),
      //                   ),
      //                   child: ListTile(
      //                     leading: Container(
      //                       width: 55,
      //                       height: 70,
      //                       decoration: BoxDecoration(
      //                         shape: BoxShape.circle,
      //                         image: DecorationImage(
      //                           fit: BoxFit.cover,
      //                           image: photoReference.isNotEmpty
      //                               ? NetworkImage(
      //                                   'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=$API_KEY')
      //                               : AssetImage('lib/assets/image/noimage.jpg')
      //                                   as ImageProvider,
      //                         ),
      //                       ),
      //                     ),
      //                     trailing: InkWell(
      //                       onTap: () async {
      //                         // Ensure 'place_id' exists in hospital data
      //                         String placeId = hospital['place_id'] ?? '';
      //
      //                         // Retrieve latitude and longitude for the hospital from SharedPreferences
      //                         SharedPreferences prefs =
      //                             await SharedPreferences.getInstance();
      //                         String lat2 =
      //                             prefs.getString('hospital_lat_$placeId') ??
      //                                 '';
      //                         String lng2 =
      //                             prefs.getString('hospital_lng_$placeId') ??
      //                                 '';
      //                         print('hospital_lng_$placeId');
      //
      //                         // Convert latitude and longitude strings to double
      //                         double lat = double.tryParse(lat2) ?? 0.0;
      //                         double lng = double.tryParse(lng2) ?? 0.0;
      //
      //                         // Print converted values for debugging
      //                         print(
      //                             'Converted Latitude: $lat, Converted Longitude: $lng');
      //
      //                         // Pass the latitude and longitude to the method
      //                         if (lat != 0.0 && lng != 0.0) {
      //                           _ambulanceEmergencygetController
      //                               .googlerequestemergencyambulance(lat, lng);
      //                         } else {
      //                           // Handle case where latitude or longitude is not available
      //                           print(
      //                               'Latitude or longitude not available for this hospital.');
      //                         }
      //                       },
      //                       child: Container(
      //                         width: 25,
      //                         height: 60,
      //                         child: Center(
      //                           child: Icon(
      //                             Icons.arrow_circle_right_rounded,
      //                             size: size.height * 0.045,
      //                             color: Colors.black,
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //
      //                     title: Text(
      //                       hospital['name'],
      //                       maxLines: 2,
      //                       style: TextStyle(
      //                         fontSize: size.height * 0.018,
      //                         fontWeight: FontWeight.w500,
      //                       ),
      //                     ),
      //                     subtitle: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Text(
      //                           hospital['vicinity'],
      //                           maxLines: 3,
      //                           style: TextStyle(
      //                             fontSize: size.height * 0.016,
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           height: size.height * 0.005,
      //                         ),
      //                         Text(
      //                           'Distance: $distance km',
      //                           style: TextStyle(
      //                             fontSize: size.height * 0.016,
      //                             fontWeight: FontWeight.bold,
      //                             color: Colors.indigo,
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                     // You can customize the list tile as needed
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //       ),
    );
  }
}
