import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:i_can/widgets/custom_bottom_app_bar.dart';
import 'package:i_can/widgets/custom_on_boarding_card.dart';
import 'package:i_can/controllers/user_controller.dart';

//first onboarding screen
class OnBoardingOne extends StatelessWidget {
  OnBoardingOne({Key? key}) : super(key: key);

  UserController userController = Get.find<UserController>();

  //callback function that will be called whenever value in the text field is changed
  //for ex - it will be called whenever the user inputs his/her name
  void onChanged(String? val) {
    userController.setName(val as String);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomOnBoardingCard(
            title: 'What should I call you?', cb: onChanged),
      ),
      bottomNavigationBar: CustomBottomAppBar(title: 'Next'),
    );
  }
}
