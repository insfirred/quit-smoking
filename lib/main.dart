import 'package:flutter/material.dart';

import 'package:get/get.dart';

import './screens/on_boarding_1.dart';
import './controllers/user_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var userController = Get.put(UserController());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'I Can',
      theme: ThemeData(
        fontFamily: 'Acme',
        scaffoldBackgroundColor: const Color(0xFF1F2120),
        cardColor: const Color(0xff313433),
        focusColor: const Color(0xff636866),
      ),
      home: OnBoardingOne(),
    );
  }
}
