import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizController extends GetxController {
  RxInt pageCount = (1).obs;

  RxMap<int, int> prevoiusPageData = <int, int>{
    1: -1,
    2: -1,
    3: -1,
  }.obs;

  RxList<bool> correctAns = <bool>[].obs;
  Future<int> getHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('highscore') ?? 0;
  }

  setHighScore(int score) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('highscore', score);
  }
}
