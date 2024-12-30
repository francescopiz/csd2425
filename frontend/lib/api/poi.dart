import 'package:frontend/api/mediafile.dart';
import 'package:frontend/api/quiz.dart';

class Poi {
  final int? id;
  final String name;
  final String description;
  final int? latitude;
  final int? longitude;
  final String? audioDescription;
  final List<Mediafile> mediafiles;
  final List<Quiz> quiz;

  Poi({
    this.id,
    required this.name,
    required this.description,
    this.latitude,
    this.longitude,
    this.audioDescription,
    required this.mediafiles,
    required this.quiz,
  });

  factory Poi.fromJson(Map<String, dynamic> json) {
    return Poi(
      id: json['poiId'],
      name: json['name'],
      description: json['description'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      audioDescription: json['audioDescription'] as String,
      mediafiles: (json['mediaFileDTOs'] as List)
          .map((mediafile) => Mediafile.fromJson(mediafile))
          .toList(),
      quiz: (json['quizDTOs'] as List)
          .map((quiz) => Quiz.fromJson(quiz))
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
      'quizDTOs': quiz.map((quiz) => quiz.toJson()).toList(),
    };
  }
}
