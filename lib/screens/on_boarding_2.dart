import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:i_can/screens/on_boarding_3.dart';

import 'package:i_can/widgets/custom_bottom_app_bar.dart';
import 'package:i_can/widgets/custom_on_boarding_card.dart';
import 'package:i_can/controllers/user_controller.dart';

//second onboarding screen
class OnBoardingTwo extends StatelessWidget {
  OnBoardingTwo({Key? key}) : super(key: key);
  static const routeName = '/second-on-boarding';

  UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: CustomOnBoardingCard(
          title: 'Since when are you smoking?',
          bottomWidget: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: (mediaQuery.size.height / 4.5) / 4,
            decoration: BoxDecoration(
              color: theme.focusColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: InkWell(
              onTap: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now())
                    .then((value) {
                  if (value != null) userController.setDate(value as DateTime);
                });
              },
              child: const Center(
                child: Text(
                  'Choose Date',
                  style: TextStyle(
                    color: Color(0xffa8a8a8),
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
          title: 'Next',
          cb: () {
            Get.toNamed(OnBoardingThree.routeName);
          }),
    );
  }
}
