import 'package:flutter/foundation.dart';

import 'Mediafile.dart';

class Poi {
  final int id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;
  final List<int> audioDescription;
  final List <Mediafile> mediafiles;
  Poi({required this.id, required this.name, required this.description, required this.latitude, required this.longitude, required this.audioDescription, required this.mediafiles});
  factory Poi.fromJson(Map<String, dynamic> json) {
    return Poi(
      id: json['Id'],
      name: json['Name'],
      description: json['Description'],
      latitude: json['Latitude'],
      longitude: json['Longitude'],
      audioDescription: json['AudioDescription'],
      mediafiles: json['Mediafiles'].map<Mediafile>((mediafile) => Mediafile.fromJson(mediafile)).toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Description': description,
      'Latitude': latitude,
      'Longitude': longitude,
      'AudioDescription': audioDescription,
      'Mediafiles': mediafiles.map((mediafile) => mediafile.toJson()).toList(),
    };
  }
  factory Poi.defaultPoi() {
    return Poi(
      id: 0,
      name: '',
      description: '',
      latitude: 0.0,
      longitude: 0.0,
      audioDescription: [],
      mediafiles: [],
    );
  }
}