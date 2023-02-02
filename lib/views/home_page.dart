import 'package:be_quizzy/views/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/quiz_controller.dart';
import '../utils/media_query_hw.dart';

QuizController quizController = Get.put(QuizController());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var cusH = SizedBox(
      height: GetHeightWidth.heightH(val: 0.08, context: context),
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to Be Quizzy',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              cusH,
              Center(
                child: Image.asset(
                  'assets/images/quiz.png',
                  width: 200,
                  height: 200,
                ),
              ),
              cusH,
              RichText(
                text: const TextSpan(
                  text:
                      'Here you are given three questions. The right one will be indicated with',
                  style: TextStyle(
                      fontSize: 18,
                      wordSpacing: 2.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Green ',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                    TextSpan(
                      text: 'and the wrong with ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Red.',
                      style: TextStyle(
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
              cusH,
              cusH,
              cusH,
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(70, 70),
                    shape: const CircleBorder(),
                    elevation: 0.0,
                  ),
                  onPressed: () {
                    Get.offAll(
                      () => const QuizPage(),
                    );
                  },
                  child: const Icon(
                    Icons.arrow_forward,
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
