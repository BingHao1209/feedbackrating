import 'package:feedback_and_rating_1/pages/home.dart';
import 'package:flutter/material.dart';
import '../data.dart';

class Feedback1 extends StatefulWidget {
  const Feedback1({super.key});

  @override
  State<Feedback1> createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback1> {
  int _rating = 0;
  final List<String> categories = [
    'Feedback',
    'IT Department',
    'Error',
    'Customer Service',
    'Design',
    'Response Time'
  ];
  late List<bool> selected;
  final commentsController = TextEditingController();

  void _showPrompt(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thank you!'),
          content:
          const Text('Thanks for you feedback!!'),
          actions: [
            TextButton(
              // style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen),),
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Return to home page'),
            ),
          ],
        );
      },
    ).then((result) {
        Navigator.pop(context);
    });
  }


  @override
  void initState() {
    super.initState();
    selected = List.generate(categories.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    final max_width = MediaQuery.of(context).size.width;
    final max_height = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        title: const Text("Feedback"),
        backgroundColor: Colors.white54,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                  children: List.generate(categories.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = List.filled(categories.length, false);
                          selected[index] = !selected[index];
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: selected[index] ? Colors.cyanAccent : null,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black,
                            width: 1.5,
                          ),
                        ),
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        child: Text(categories[index]),
                      ),
                    );
                  }),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text("Please tell us what we should improve",
                    textScaleFactor: 1.5),
              ),
              Container(
                width: max_width - 50,
                height: max_height / 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 1.5,
                  ),
                ),
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Write comment here...',
                    border: InputBorder.none,
                  ),
                  controller: commentsController,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  feedbackLibraryInstance.addFeedback(stars: _rating, category: categories[selected.indexWhere((element) => true)], comment: commentsController.text);
                  _showPrompt(context);
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
