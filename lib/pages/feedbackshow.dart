import 'package:flutter/material.dart';
import 'package:feedback_and_rating_1/data.dart';

class FeedbackShow extends StatefulWidget {
  const FeedbackShow({super.key, required this.index});

  final int index;
  @override
  State<FeedbackShow> createState() => FeedbackShowState();
}

class FeedbackShowState extends State<FeedbackShow> {
  @override
  Widget build(BuildContext context) {
    final FeedbackRecord feedbackRecord =
        feedbackLibraryInstance.getRecordAtIndex(widget.index);
    final int _rating = feedbackRecord.stars;
    final String category = feedbackRecord.category;
    final String comment = feedbackRecord.comment;

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
                  children: List.generate(
                      5,
                      (index) => Icon(
                            index < _rating ? Icons.star : Icons.star_border,
                            color: Colors.yellowAccent,
                            size: max_width / 8,
                          )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  child: Text(category),
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
                child: Text(comment),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
