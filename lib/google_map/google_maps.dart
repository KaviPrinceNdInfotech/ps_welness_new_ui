import 'dart:convert' as convert;

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;

class LocationService {
  final String key = 'AIzaSyBrbWFXlOYpaq51wteSyFS2UjdMPOWBlQw';
  Future<String> getPlacedId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?input=$input&inputtype=textquery&key=$key';
    var response = await http.get(Uri.parse(url));

    var json = convert.json.decode(response.body);
    //var json = convert.json.Decode(response.body);
    var placeId = json['condidates'][0]['place_id'] as String;
    print(placeId);
    return placeId;
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlacedId(input);
    final String url =
        'https://maps.googleapis.com/maps/api/place/detail/json?place_id=$placeId&key=$key';
    var response = await http.get(Uri.parse(url));

    var json = convert.json.decode(response.body);

    var results = json['result'] as Map<String, dynamic>;
    print(results);

    return results;
  }

  ///

  Future<Map<String, dynamic>> getDirections(
      String origin, String destination) async {
    //final placeId = await getPlacedId(input);
    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin?=$origin&destination=$destination&key=$key';
    //'/place/detail/json?place_id=$placeId&key=$key';
    var response = await http.get(Uri.parse(url));

    var json = convert.json.decode(response.body);

    var results = {
      'bounds_ne': json['routes'][0]['bounds']['northeast'],
      'bounds_sw': json['routes'][0]['bounds']['southwest'],
      'start_location': json['routes'][0]['legs'][0]['start_location'],
      'end_location': json['routes'][0]['legs'][0]['end_location'],
      'polyline': json['routes'][0]['overview_polyline']['points'],
      'polyline_decoded': PolylinePoints()
          .decodePolyline(json['routes'][0]['overview_polyline']['points']),

      // 'bounds_ne': json['routes'][0]['bounds']['northeast'],
      //
      // 'bounds_ne': json['routes'][0]['bounds']['northeast'],
    };
    print(results);

    // var results = json['result'] as Map<String, dynamic>;
    print(json);

    return results;
  }
}
