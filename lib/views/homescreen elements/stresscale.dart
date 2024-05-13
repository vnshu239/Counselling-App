import 'package:flutter/material.dart';

class PHQ9Screen extends StatefulWidget {
  @override
  _PHQ9ScreenState createState() => _PHQ9ScreenState();
}

class _PHQ9ScreenState extends State<PHQ9Screen> {
  int totalScore = 0;
  List<int> questionScores = List.filled(9, 0);

  void updateScore(int index, int score) {
    setState(() {
      questionScores[index] = score;
      totalScore = questionScores.reduce((a, b) => a + b);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PHQ-9 Questionnaire'),
      ),
      body: ListView.builder(
        itemCount: 9,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question ${index + 1}:',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Rate how often you have been bothered by each problem over the last two weeks:',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    RadioListTile<int>(
                      title: Text('Not at all'),
                      value: 0,
                      groupValue: questionScores[index],
                      onChanged: (value) => updateScore(index, value!),
                    ),
                    RadioListTile<int>(
                      title: Text('Several days'),
                      value: 1,
                      groupValue: questionScores[index],
                      onChanged: (value) => updateScore(index, value!),
                    ),
                    RadioListTile<int>(
                      title: Text('More than half the days'),
                      value: 2,
                      groupValue: questionScores[index],
                      onChanged: (value) => updateScore(index, value!),
                    ),
                    RadioListTile<int>(
                      title: Text('Nearly every day'),
                      value: 3,
                      groupValue: questionScores[index],
                      onChanged: (value) => updateScore(index, value!),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Here you can navigate to the next screen or perform any other action with the total score
          print('Total score: $totalScore');
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
