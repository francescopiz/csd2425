import 'dart:convert';
import 'package:http/http.dart' as http;

import '../api/Poi.dart';
import '../api/Tour.dart';

class TourService {
  String url;

  TourService(this.url);

  static String controllerTour = 'api/v1/Mocktour/Tour';
  static String controllerPoi = 'api/v1/MockPoi/Poi';

  /*static Future<List<Tour>> getAllTours() async {
    final response = await http.get(Uri.http(url, "$controllerTour/GetAll"));
    if (response.statusCode == 200) {
      return compute(parseTours, response.bodyBytes);
    } else {
      throw Exception('Failed to load tours: ${response.statusCode}');
    }
  }

  static List<Tour> parseTours(Uint8List responseBody) {
    final parsed = jsonDecode(Utf8Decoder().convert(responseBody))
        .cast<Map<String, dynamic>>();
    return parsed.map<Tour>((json) => Tour.fromJson(json)).toList();
  }

  Future<List<Poi>> getAllPois() async {
    final response = await http.get(Uri.https(url, "$controllerPoi/GetPois"));
    if (response.statusCode == 200) {
      return compute(parsePois, response.bodyBytes);
    } else {
      throw Exception('Failed to load pois: ${response.statusCode}');
    }
  }

  static List<Poi> parsePois(Uint8List responseBody) {
    final parsed = jsonDecode(Utf8Decoder().convert(responseBody))
        .cast<Map<String, dynamic>>();
    return parsed.map<Poi>((json) => Poi.fromJson(json)).toList();
  }
}*/

  Future<List<Tour>> getAllTours() async {
    try {
      final response = await http.get(Uri.parse('$url/$controllerTour/GetAll'));
      if (response.statusCode == 200) {
        List<Tour> tours = [];
        jsonDecode(Utf8Decoder().convert(response.bodyBytes))
            .forEach((element) {
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

  Future<List<Poi>> getAllPois() async {
    try {
      final response = await http.get(Uri.parse('$url/$controllerPoi/GetPois'));
      if (response.statusCode == 200) {
        List<Poi> pois = [];
        jsonDecode(Utf8Decoder().convert(response.bodyBytes))
            .forEach((element) {
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
