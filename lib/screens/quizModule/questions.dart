import 'package:first_app/screens/quizModule/option.dart';

class Question {
  final String text;
  final List<Option> options;
  final String Soluttion;
  Option? SelectedOption;

  Question({
    required this.text,
    required this.options,
    required this.Soluttion,
    this.SelectedOption,
  });
}

final questions = [
  Question(
      text: 'what is your name?',
      options: [
        Option(code: '1.', text: 'Hamada', isCorrect: false),
        Option(code: '2.', text: 'Hamada', isCorrect: true),
        Option(code: '3.', text: 'Hamada', isCorrect: false),
        Option(code: '4.', text: 'Hamada', isCorrect: false),
      ],
      Soluttion: 'Answer 1 is correct'),
  Question(
      text: 'what is your Country?',
      options: [
        Option(code: '1.', text: 'Hamada', isCorrect: false),
        Option(code: '2.', text: 'Hamada', isCorrect: true),
        Option(code: '3.', text: 'Hamada', isCorrect: false),
        Option(code: '4.', text: 'Hamada', isCorrect: false),
      ],
      Soluttion: 'Answer 1 is correct'),
  Question(
      text: 'what is your Age?',
      options: [
        Option(code: '1.', text: 'Hamada', isCorrect: false),
        Option(code: '2.', text: 'Hamada', isCorrect: true),
        Option(code: '3.', text: 'Hamada', isCorrect: false),
        Option(code: '4.', text: 'Hamada', isCorrect: false),
      ],
      Soluttion: 'Answer 1 is correct'),
  Question(
      text: 'what is your Gender?',
      options: [
        Option(code: '1.', text: 'Hamada', isCorrect: false),
        Option(code: '2.', text: 'Hamada', isCorrect: true),
        Option(code: '3.', text: 'Hamada', isCorrect: false),
        Option(code: '4.', text: 'Hamada', isCorrect: false),
      ],
      Soluttion: 'Answer 1 is correct'),
  Question(
      text: 'what is your Favourite sport?',
      options: [
        Option(code: '1.', text: 'Hamada', isCorrect: false),
        Option(code: '2.', text: 'Hamada', isCorrect: true),
        Option(code: '3.', text: 'Hamada', isCorrect: false),
        Option(code: '4.', text: 'Hamada', isCorrect: false),
      ],
      Soluttion: 'Answer 1 is correct'),
];
