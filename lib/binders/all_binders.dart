import 'package:be_quizzy/controllers/quiz_controller.dart';
import 'package:get/get.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizController(), fenix: true);
  }
}
