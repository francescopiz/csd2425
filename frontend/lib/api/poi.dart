class Poi {
  final String name;
  final String description;


  Poi({
    required this.name,
    required this.description,
  });

  factory Poi.fromJson(Map<String, dynamic> json){
    return Poi(
      name: json['name'],
      description: json['description'],
    );
  }
}