import 'package:flutter/material.dart';
import 'feedback1.dart';
import 'feedback_history.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        title: const Text("Feedback & Rating"),
        backgroundColor: Colors.white12,
        foregroundColor: Colors.white,
      ),
      body: ListView(
          children: [
            const Padding(padding: EdgeInsets.only(top: 24)),
            ListTile(
              title: const Text('Show all feedbacks'),
              trailing: TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const FeedbackHistory()));},
                  child: const Text('show')),
            ),
            ListTile(
              title: const Text("Prompt Feedback"),
              trailing: TextButton(onPressed: (){_showPrompt(context);},
                  child: const Text('show')),
            ),
          ],
      ),
    );
  }

  void _showPrompt(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Please rate our app!'),
          content:
          const Text('Thanks for using our app, would you like to rate us?'),
          actions: [
            TextButton(
              // style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen),),
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              // style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),),
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    ).then((result) {
      if (result != null && result) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Feedback1()),
          );
      }
    });
  }

}