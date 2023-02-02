import 'package:be_quizzy/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binders/all_binders.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllBindings(),
      title: 'Be Quizzy',
      home: const HomePage(),
    );
  }
}
