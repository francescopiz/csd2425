import 'package:frontend/api/poi.dart';

class Tour {
  final int? id;
  final String name;
  final String description;
  final List<Poi> pois;

  Tour({
    this.id,
    required this.name,
    required this.description,
    required this.pois,
  });

  factory Tour.fromJson(Map<String, dynamic> json) {
    return Tour(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pois: (json['pois'] as List).map((poi) => Poi.fromJson(poi)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'pois': pois.map((poi) => poi.toJson()).toList(),
    };
  }
}
