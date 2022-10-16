import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_can/controllers/user_controller.dart';
import 'package:i_can/l10n/localization.dart';
import 'package:i_can/screens/on_boarding_5.dart';
import 'package:i_can/widgets/custom_bottom_app_bar.dart';
import 'package:i_can/widgets/custom_on_boarding_card.dart';
import 'package:i_can/widgets/custom_text_field.dart';

//first onboarding screen
class OnBoardingFour extends StatelessWidget {
  OnBoardingFour({Key? key}) : super(key: key);
  static const routeName = '/Fourth-on-boarding';

  UserController userController = Get.find<UserController>();

  //callback function that will be called whenever value in the text field is changed
  void onChanged(String? val) {
    userController.setNumberOfCigPerDay(int.parse(val.toString()));
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: CustomOnBoardingCard(
          title: Localization.of(context)!.how_many_cigarettes_daily,
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
        title: Localization.of(context)!.next,
        cb: () {
          Get.toNamed(OnBoardingFive.routeName);
        },
      ),
    );
  }
}
