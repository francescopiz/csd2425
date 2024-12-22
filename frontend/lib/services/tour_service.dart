import 'dart:convert';
import 'package:http/http.dart' as http;

import '../api/poi.dart';
import '../api/tour.dart';

class TourService {
  String url;

  TourService(this.url);

  static String controllerTour = 'api/v1/Mocktour/Tour';
  static String controllerPoi = 'api/v1/MockPoi/Poi';

  Future<List<Tour>> getAllTours() async {
    try {
      final response = await http.get(Uri.parse('$url/$controllerTour/GetAll'));
      if (response.statusCode == 200) {
        List<Tour> tours = [];
        jsonDecode(const Utf8Decoder().convert(response.bodyBytes))
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
        jsonDecode(const Utf8Decoder().convert(response.bodyBytes))
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
