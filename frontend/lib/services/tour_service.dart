import 'dart:convert';
import 'package:http/http.dart' as http;

import '../api/Poi.dart';
import '../api/Tour.dart';

class TourService {
  static String url = '192.168.1.51:7281'; // Sostituisci con l'indirizzo IP del server
  static String controllerTour = 'api/v1/MockTour';
  static String controllerPoi = 'api/v1/MockPoi';

  /*Future<List<Tour>> getAllTours() async {
    try {
      final response = await http.get(Uri.https(url, "$controllerTour/GetAll"));
      if (response.statusCode == 200) {
        List<Tour> tours = [];
        jsonDecode(Utf8Decoder().convert(response.bodyBytes)).forEach((element) {
          tours.add(Tour.fromJson(element));
        });
        return tours;
      } else {
        throw Exception('Failed to load tours: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load tours: $e');
    }
  }
*/

  static Future<List<Tour>> getAllTours() async {
    return http
        .get(Uri.http(url, "$controllerTour/GetAll"))
        .then((response) {
      if (response.statusCode == 200) {
        List<Tour> tours = [];
        jsonDecode(Utf8Decoder().convert(response.bodyBytes)).forEach((element) {
          tours.add(Tour.fromJson(element));
        });
        return tours;
      } else {
        throw Exception('Failed to load tours: ${response.statusCode}');
      }
    });
  }



  Future<List<Poi>> getAllPois() async {
    try {
      final response = await http.get(Uri.https(url, "$controllerPoi/GetPois"));
      if (response.statusCode == 200) {
        List<Poi> pois = [];
        jsonDecode(Utf8Decoder().convert(response.bodyBytes)).forEach((element) {
          pois.add(Poi.fromJson(element));
        });
        return pois;
      } else {
        throw Exception('Failed to load pois: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load pois: $e');
    }
  }
}