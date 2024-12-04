import 'package:frontend/api/Poi.dart';
class Tour {
  final int id;
  final String name;
  final String description;
  final List<Poi> pois;
  Tour({required this.id, required this.name, required this.description, required this.pois});
  factory Tour.fromJson(Map<String, dynamic> json) {
    return Tour(
      id: json['Id'],
      name: json['Name'],
      description: json['Description'],
      pois: json['Pois'].map<Poi>((poi) => Poi.fromJson(poi)).toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Description': description,
      'Pois': pois.map((poi) => poi.toJson()).toList(),
    };
  }
  factory Tour.defaultTour() {
    return Tour(
      id: 0,
      name: '',
      description: '',
      pois: [],
    );
  }
}