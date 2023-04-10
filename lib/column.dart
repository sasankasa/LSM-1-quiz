import 'package:flutter/material.dart';

int score = 0;

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({Key? key}) : super(key: key);
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  var questionId = 0;
  var questions = [
    {
      'question': '2 + 2 = ?',
      'answer1': '3',
      'answer2': '4',
      'answer3': '5',
      'correct': '2',
    },
    {
      'question': 'What is the capital of France?',
      'answer1': 'London',
      'answer2': 'Berlin',
      'answer3': 'Paris',
      'correct': '3',
    },
    {
      'question': 'What color is the sky on a clear day?',
      'answer1': 'Green',
      'answer2': 'Blue',
      'answer3': 'Yellow',
      'correct': '2',
    },
    {
      'question': '64 / 16 = ?',
      'answer1': '4',
      'answer2': '2',
      'answer3': '5',
      'correct': '1',
    },
    {
      'question': 'Which animal is known for its long neck?',
      'answer1': 'Giraffe',
      'answer2': 'Elephant',
      'answer3': 'Hippopotamus',
      'correct': '1',
    },
    {
      'question': '7 * 8 = ?',
      'answer1': '54',
      'answer2': '56',
      'answer3': '57',
      'correct': '2',
    },
    {
      'question': 'What is the largest planet in our solar system?',
      'answer1': 'Venus',
      'answer2': 'Mars',
      'answer3': 'Jupiter',
      'correct': '3',
    },
  ];

  void answer(String answerId) {
    if (answerId == questions[questionId]['correct']) {
      score++;
    } else {
      
    }
    if (questionId >= questions.length - 1) {
      setState(() {
        questionId = questions.length;
      });
    } else {
      setState(() {
        questionId = (questionId + 1) % questions.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (questionId >= questions.length) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 80,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: Text(
                    "Your score is: \n$score / $questionId",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: Size(250, 50),
              ),
              onPressed: () {
                setState(() {
                  questionId = 0;
                  score = 0;
                });
              },
              child: Text('Start from the beginning',
                  style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 50)
          ],
        ),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 80,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: Text(
                    questions[questionId]['question']!,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                minimumSize: Size(250, 50),
              ),
              onPressed: () {
                answer('1');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  questions[questionId]['answer1']!,
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                minimumSize: Size(250, 50),
              ),
              onPressed: () => {
                answer('2'),
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  questions[questionId]['answer2']!,
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                minimumSize: Size(250, 50),
              ),
              onPressed: () => {
                answer('3'),
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  questions[questionId]['answer3']!,
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Your points: $score',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
          ],
        ),
      );
    }
  }
}
