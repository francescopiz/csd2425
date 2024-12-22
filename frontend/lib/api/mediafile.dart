class Mediafile {
  final String data;

  Mediafile({
    required this.data,
  });

  factory Mediafile.fromJson(Map<String, dynamic> json) {
    return Mediafile(
      data: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': data,
    };
  }

  factory Mediafile.defaultMediafile() {
    return Mediafile(
      data: '',
    );
  }
}
