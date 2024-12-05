import 'dart:typed_data';

class Mediafile{
  final String id;
  final String name;
  final String size;
  final List<ByteData> data;
  Mediafile({required this.id, required this.name, required this.size, required this.data});
  factory Mediafile.fromJson(Map<String, dynamic> json) {
    return Mediafile(
      id: json['Id'],
      name: json['Name'],
      size: json['Size'],
      data: json['Content'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Size': size,
      'Content': data,
    };
  }
  factory Mediafile.defaultMediafile() {
    return Mediafile(
      id: '',
      name: '',
      size: '',
      data: [],
    );
  }
}