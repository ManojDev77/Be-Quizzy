import 'package:be_quizzy/views/home_page.dart';

import '../services/quiz_data.dart';

getOptionsData(int val, int index) {
  switch (val) {
    case 2:
      return quizOptionsForQ2.entries
          .firstWhere((element) => element.key == index)
          .value;
    case 3:
      return quizOptionsForQ3.entries
          .firstWhere((element) => element.key == index)
          .value;
    default:
      return quizOptionsForQ1.entries
          .firstWhere((element) => element.key == index)
          .value;
  }
}

getOptionsAnswerData(int val, int index) {
  switch (val) {
    case 2:
      return quizOptionsForQ2Answer.entries
          .firstWhere((element) => element.key == index)
          .value;
    case 3:
      return quizOptionsForQ3Answer.entries
          .firstWhere((element) => element.key == index)
          .value;
    default:
      return quizOptionsForQ1Answer.entries
          .firstWhere((element) => element.key == index)
          .value;
  }
}
