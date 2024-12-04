import 'package:flutter/foundation.dart';

class Poi {
  final int id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;
  final List<int> audioDescription;
  Poi({required this.id, required this.name, required this.description, required this.latitude, required this.longitude, required this.audioDescription});
  factory Poi.fromJson(Map<String, dynamic> json) {
    return Poi(
      id: json['Id'],
      name: json['Name'],
      description: json['Description'],
      latitude: json['Latitude'],
      longitude: json['Longitude'],
      audioDescription: json['AudioDescription'],
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
    );
  }
}