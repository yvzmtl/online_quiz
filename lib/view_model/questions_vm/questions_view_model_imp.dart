import 'package:online_quiz/firebase/questions_reference.dart';
import 'package:online_quiz/model/questions_model.dart';
import 'package:online_quiz/view_model/questions_vm/questions_view_model.dart';

class QuestionViewModelImp implements QuestionsByCategoryIdViewModel {
  @override
  Future<List<QuestionModel>> displayQuestionsList(String categoryid) {
    return getQuestions(categoryid);
  }
}
