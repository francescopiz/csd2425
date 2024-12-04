
import 'dart:convert';

import '../api/Tour.dart';

class tour_service{
  static String url = '10.0.2.2:5073';
  static String controllerTour = 'api/v1/Tour';
  static String controllerPoi = 'api/v1/Poi';
  Future<List<Tour>> getAllTours() async {
    return http
        .get(Uri.http(url, "$controller/GetAllTours"))
        .then((response) {
      if (response.statusCode == 200) {
        List<Tour> tours = [];
        jsonDecode(Utf8Decoder().convert(response.bodyBytes))
            .forEach((element) {
          tours.add(Tour.fromJson(element));
        });
        return tours;
      } else {
        throw Exception('Failed to load tours');
      }
    });
  }
  Future <List<Poi>> getAllPois() async {

  }
}