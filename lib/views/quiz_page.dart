import 'package:be_quizzy/utils/media_query_hw.dart';
import 'package:be_quizzy/views/home_page.dart';
import 'package:be_quizzy/views/scoreboard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/quiz_data.dart';
import '../utils/quiz_filter_data.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaW = GetHeightWidth.widgetW(val: 0.8, context: context);
    var mediaH = GetHeightWidth.heightH(val: 0.07, context: context);
    var cusH = SizedBox(
      height: GetHeightWidth.heightH(val: 0.08, context: context),
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  '${quizController.pageCount.value}.',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              cusH,
              Obx(
                () => Text(
                  quizQuestions.entries
                      .firstWhere((element) =>
                          element.key == quizController.pageCount.value)
                      .value,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              cusH,
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Obx(
                    () => RectContainer(
                      mediaH: mediaH,
                      mediaW: mediaW,
                      option:
                          getOptionsData(quizController.pageCount.value, index),
                      isCorrect: getOptionsAnswerData(
                          quizController.pageCount.value, index),
                      indexVal: index,
                      onTap: () {
                        quizController.correctAns.add(getOptionsAnswerData(
                            quizController.pageCount.value, index));

                        // quizController.correctVal(index);
                        quizController.prevoiusPageData.update(
                          quizController.pageCount.value,
                          (value) => index,
                        );
                      },
                    ),
                  );
                },
              ),
              cusH,
              cusH,
              cusH,
              Center(
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (quizController.pageCount.value > 1)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            minimumSize: const Size(50, 50),
                            shape: const CircleBorder(),
                            elevation: 0.0,
                          ),
                          onPressed: () {
                            // Get.offAll(
                            //   () => QuizPage(),
                            // );
                            quizController.pageCount.value =
                                quizController.pageCount.value - 1;
                          },
                          child: const Icon(
                            Icons.arrow_back,
                          ),
                        ),
                      if (quizController.pageCount.value < 3)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            minimumSize: const Size(50, 50),
                            shape: const CircleBorder(),
                            elevation: 0.0,
                          ),
                          onPressed: () {
                            quizController.pageCount.value =
                                quizController.pageCount.value + 1;

                            // quizController.correctVal(-1);
                            // Get.offAll(
                            //   () => QuizPage(),
                            // );
                          },
                          child: const Icon(
                            Icons.arrow_forward,
                          ),
                        ),
                      if (quizController.pageCount.value == 3)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            minimumSize: const Size(50, 50),
                            shape: const CircleBorder(),
                            elevation: 0.0,
                          ),
                          onPressed: () async {
                            int highScore = await quizController.getHighScore();
                            int currentHighScore = quizController.correctAns
                                .where((element) => element == true)
                                .length;
                            if (highScore < currentHighScore) {
                              quizController.setHighScore(currentHighScore);
                              highScore = await quizController.getHighScore();
                            }

                            Get.to(
                              () => ScoreBoardPage(
                                highScore: highScore,
                                currentScore: currentHighScore,
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.leaderboard,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RectContainer extends StatelessWidget {
  final Function() onTap;
  final int indexVal;
  final String option;
  final bool isCorrect;
  final double mediaH;
  final double mediaW;
  const RectContainer(
      {required this.onTap,
      required this.indexVal,
      required this.option,
      required this.isCorrect,
      required this.mediaH,
      required this.mediaW,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () => quizController.prevoiusPageData.entries
                    .firstWhere((element) =>
                        element.key == quizController.pageCount.value)
                    .value ==
                -1
            ? onTap()
            : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          width: mediaW,
          height: mediaH,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            color: (quizController.prevoiusPageData.entries
                            .firstWhere((element) =>
                                element.key == quizController.pageCount.value)
                            .value !=
                        -1 &&
                    quizController.prevoiusPageData.entries
                            .firstWhere((element) =>
                                element.key == quizController.pageCount.value)
                            .value ==
                        indexVal)
                ? const Color.fromARGB(255, 122, 122, 122)
                : const Color(0xff28282B),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                option,
                style: const TextStyle(color: Colors.white),
              ),
              if (isCorrect &&
                  quizController.prevoiusPageData.entries
                          .firstWhere((element) =>
                              element.key == quizController.pageCount.value)
                          .value ==
                      indexVal)
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
              if (!isCorrect &&
                  quizController.prevoiusPageData.entries
                          .firstWhere((element) =>
                              element.key == quizController.pageCount.value)
                          .value ==
                      indexVal)
                const Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
