import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:i_can/screens/on_boarding_2.dart';
import 'package:i_can/widgets/custom_bottom_app_bar.dart';
import 'package:i_can/widgets/custom_on_boarding_card.dart';
import 'package:i_can/controllers/user_controller.dart';
import 'package:i_can/widgets/custom_text_field.dart';

//first onboarding screen
class OnBoardingThree extends StatelessWidget {
  OnBoardingThree({Key? key}) : super(key: key);
  static const routeName = '/third-on-boarding';

  UserController userController = Get.find<UserController>();

  //callback function that will be called whenever value in the text field is changed
  void onChanged(String? val) {
    userController.setNumberOfCigPerPack(int.parse(val.toString()));
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: CustomOnBoardingCard(
          title: 'How many cigarettes are there in one pack?',
          bottomWidget: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: (mediaQuery.size.height / 4.5) / 4,
            decoration: BoxDecoration(
              color: theme.focusColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: CustomTextField(
              cb: onChanged,
              textInputType: TextInputType.number,
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        title: 'Next',
        cb: () {
          Get.toNamed(OnBoardingTwo.routeName);
        },
      ),
    );
  }
}
