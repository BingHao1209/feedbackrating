import 'package:flutter/material.dart';
import '../data/feedback_library.dart';

class Feedback1 extends StatefulWidget {
  const Feedback1({super.key});

  @override
  State<Feedback1> createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback1> {
  int _rating = 0;
  List<String> categories = [
    'Feedback',
    'IT Department',
    'Error',
    'Customer Service',
    'Design',
    'Response Time'
  ];

  @override
  Widget build(BuildContext context) {
    final max_width = MediaQuery.of(context).size.width;
    final max_height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        title: const Text("Feedback"),
        backgroundColor: Colors.white54,
        foregroundColor: Colors.black,
      ),
      body: Container(
        width: max_width,
        height: max_height,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _rating = index + 1;
                      });
                    },
                    child: Icon(
                      index < _rating ? Icons.star : Icons.star_border,
                      color: Colors.yellowAccent,
                      size: max_width / 8,
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Wrap(
                children: categories.map((category) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                      ),
                    ),
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    child: TextButton(
                      child: Text(category),
                      onPressed: (){},
                    ),
                  );
                }).toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text("Please tell us what we should improve",
                  textScaleFactor: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
