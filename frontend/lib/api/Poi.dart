import 'dart:typed_data';

import 'package:frontend/api/Mediafile.dart';

class Poi {
  final int id;
  final String name;
  final String description;
  final double? latitude;
  final double? longitude;
  final Uint8List? audioDescription;
  final List<Mediafile> mediafiles;

  Poi({
    required this.id,
    required this.name,
    required this.description,
    this.latitude,
    this.longitude,
    this.audioDescription,
    required this.mediafiles,
  });

  factory Poi.fromJson(Map<String, dynamic> json) {
    return Poi(
      id: json['poiId'],
      name: json['name'],
      description: json['description'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      audioDescription: json['audioDescription']?.cast<int>(),
      mediafiles: (json['mediaFileDTOs'] as List)
          .map((mediafile) => Mediafile.fromJson(mediafile))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'poiId': id,
      'name': name,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'audioDescription': audioDescription,
      'mediaFileDTOs': mediafiles.map((mediafile) => mediafile.toJson()).toList(),
    };
  }
}
