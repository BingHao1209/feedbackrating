import 'feedback_record.dart';

class FeedbackLibrary{
  final List<FeedbackRecord> feedbacks = [];

  void addFeedback({
    required String name,
    required int stars,
    required List<String> category,
    required String comment,
  }){
    FeedbackRecord feedbackRecord = FeedbackRecord(feedbacks.length, name, stars, category, comment);
    feedbacks.add(feedbackRecord);
  }

  List<FeedbackRecord> get allRecord => [...feedbacks];
  FeedbackRecord getRecordAtIndex (index) => feedbacks[index];
}