import 'package:flutter/material.dart';
import 'package:feedback_and_rating_1/data.dart';
import 'feedbackshow.dart';

class FeedbackHistory extends StatefulWidget {
  const FeedbackHistory({super.key});

  @override
  State<FeedbackHistory> createState() => _FeedbackHistoryState();
}

class _FeedbackHistoryState extends State<FeedbackHistory> {
  final List<FeedbackRecord> feedbacks = feedbackLibraryInstance.allRecord;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Feedbacks"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: feedbackLibraryInstance.allRecord.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            feedbacks[index].id.toString(),
          ),
          subtitle: Text(
            feedbacks[index].category,
          ),
          trailing: Text(
            '${feedbacks[index].stars}/5',
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackShow(index: index)));
          },
        ),
      ),
    );
  }
}
