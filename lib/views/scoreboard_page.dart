import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../utils/media_query_hw.dart';

class ScoreBoardPage extends StatelessWidget {
  final int highScore;
  final int currentScore;
  const ScoreBoardPage(
      {required this.highScore, required this.currentScore, super.key});

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
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back),
              ),
              SizedBox(
                height: GetHeightWidth.heightH(val: 0.03, context: context),
              ),
              const Text(
                'Score Board',
                style: TextStyle(
                    fontSize: 40,
                    wordSpacing: 10.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              SizedBox(
                height: GetHeightWidth.heightH(val: 0.02, context: context),
              ),
              Center(
                child: Image.asset(
                  'assets/images/quiz.png',
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(
                height: GetHeightWidth.heightH(val: 0.02, context: context),
              ),
              cusH,
              Center(
                child: Text(
                  'High Score - $highScore',
                  style: const TextStyle(
                    fontSize: 30,
                    wordSpacing: 2.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              cusH,
              cusH,
              Center(
                child: Text(
                  'Your Score - $currentScore',
                  style: const TextStyle(
                    fontSize: 30,
                    wordSpacing: 2.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              cusH,
              // cusH,
            ],
          ),
        ),
      ),
    );
  }
}
