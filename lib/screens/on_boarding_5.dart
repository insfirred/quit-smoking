import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:i_can/screens/on_boarding_2.dart';
import 'package:i_can/widgets/custom_bottom_app_bar.dart';
import 'package:i_can/widgets/custom_on_boarding_card.dart';
import 'package:i_can/controllers/user_controller.dart';
import 'package:i_can/widgets/custom_text_field.dart';

//first onboarding screen
class OnBoardingFive extends StatelessWidget {
  OnBoardingFive({Key? key}) : super(key: key);
  static const routeName = '/fifth-on-boarding';

  UserController userController = Get.find<UserController>();

  //callback function that will be called whenever value in the text field is changed
  void onChanged(String? val) {
    userController.setPricePack(double.parse(val.toString()));
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: CustomOnBoardingCard(
          title: 'How much a pack of cigarette costs (in rupee)?',
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
        title: 'I Can and I Will',
        cb: () {},
      ),
    );
  }
}
