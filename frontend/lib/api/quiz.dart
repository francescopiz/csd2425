class Quiz{
  final String? description;
  final String? answer1;
  final String? answer2;
  final String? answer3;
  final String? answer4;
  final int? answer;

  Quiz({
    required this.description,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.answer4,
    required this.answer});

  factory Quiz.fromJson(Map<String, dynamic> json){
    return Quiz(
      description: json['Description'],
      answer1: json['Answer1'],
      answer2: json['Answer2'],
      answer3: json['Answer3'],
      answer4: json['Answer4'],
      answer: json['CorrectAnswer']
    );
  }
  Map<String, dynamic> toJson(){
    return {
      'Description': description,
      'Answer1': answer1,
      'Answer2': answer2,
      'Answer3': answer3,
      'Answer4': answer4,
      'CorrectAnswer': answer
    };
  }
}