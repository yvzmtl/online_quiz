import 'package:online_quiz/model/questions_model.dart';

abstract class QuestionsByCategoryIdViewModel {
  Future<List<QuestionModel>> displayQuestionsList(String categoryid);
}
