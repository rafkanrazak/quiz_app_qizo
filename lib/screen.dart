import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Questions> quizzes = [
    Questions(
      question: 'Vaikom Satyagraha was started in the year?',
      options: ['1924', '1934', '1926', '1936'],
      correctAnswer: '1924',
    ),
    Questions(
      question: 'Who is considered as the father of Malayalam cinema?',
      options: ['K C Daniel', 'Thakazhi', 'Sukumaran', 'Swarnalatha'],
      correctAnswer: 'K C Daniel',
    ),
    Questions(
      question: 'How many districts of Kerala have coastline?',
      options: ['10', '9', '8', '7'],
      correctAnswer: '9',
    ),
    Questions(
      question:
          'In which year, Mahatma Gandhi visited Kerala for the first time?',
      options: ['1930', '1940', '1920', '1925'],
      correctAnswer: '1920',
    ),
    Questions(
      question: 'Which district have longest coastline?',
      options: ['Kannur', 'Kozhikode', 'Malappuram', 'Kasargode'],
      correctAnswer: 'Kannur',
    ),
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  void checkAnswer(String selectedOption) {
    if (selectedOption == quizzes[currentQuestionIndex].correctAnswer) {
      setState(() {
        score++;
      });
    }

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Qizo Questions App',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: (currentQuestionIndex < quizzes.length)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  quizzes[currentQuestionIndex].question,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                ...quizzes[currentQuestionIndex].options.map((option) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: ElevatedButton(
                          onPressed: () => checkAnswer(option),
                          child: Text(
                            option,
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ],
            )
          : Text(
              'Your score: $score out of ${quizzes.length}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
    );
  }
}

class Questions {
  String question;
  List<String> options;
  String correctAnswer;

  Questions(
      {required this.question,
      required this.options,
      required this.correctAnswer});
}
