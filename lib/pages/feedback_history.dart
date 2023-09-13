import 'package:flutter/material.dart';


class FeedbackHistory extends StatefulWidget{
  const FeedbackHistory({super.key});

  @override
  State<FeedbackHistory> createState() => _FeedbackHistoryState();
}

class _FeedbackHistoryState extends State<FeedbackHistory> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        title: const Text("Feedbacks"),
        backgroundColor: Colors.white54,
        foregroundColor: Colors.black,
      ),
    );
  }

}