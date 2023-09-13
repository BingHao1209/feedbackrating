import 'feedback_record.dart';

FeedbackLibrary feedbackLibraryInstance = FeedbackLibrary();

class FeedbackLibrary{
  final List<FeedbackRecord> feedbacks = [];

  void addFeedback({
    required int stars,
    required String category,
    required String comment,
  }){
    FeedbackRecord feedbackRecord = FeedbackRecord(feedbacks.length, stars, category, comment);
    feedbacks.add(feedbackRecord);
  }

  List<FeedbackRecord> get allRecord => [...feedbacks];
  FeedbackRecord getRecordAtIndex (index) => feedbacks[index];
}