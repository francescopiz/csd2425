class Quiz{
  final String description;
  final String answer1;
  final String answer2;
  final String? answer3;
  final String? answer4;
  final int correctAnswer;

  Quiz({
    required this.description,
    required this.answer1,
    required this.answer2,
    this.answer3,
    this.answer4,
    required this.correctAnswer});

  factory Quiz.fromJson(Map<String, dynamic> json){
    return Quiz(
      description: json['description'],
      answer1: json['answer1'],
      answer2: json['answer2'],
      answer3: json['answer3'],
      answer4: json['answer4'],
      correctAnswer: json['correctAnswer']
    );
  }
  Map<String, dynamic> toJson(){
    return {
      'description': description,
      'answer1': answer1,
      'answer2': answer2,
      'answer3': answer3,
      'answer4': answer4,
      'correctAnswer': correctAnswer
    };
  }
}