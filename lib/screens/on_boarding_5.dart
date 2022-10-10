import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:i_can/screens/home_screen.dart';

import 'package:i_can/widgets/custom_bottom_app_bar.dart';
import 'package:i_can/widgets/custom_on_boarding_card.dart';
import 'package:i_can/controllers/user_controller.dart';
import 'package:i_can/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

//first onboarding screen
class OnBoardingFive extends StatefulWidget {
  final SharedPreferences prefs;
  const OnBoardingFive({Key? key, required this.prefs}) : super(key: key);
  static const routeName = '/fifth-on-boarding';

  @override
  State<OnBoardingFive> createState() => _OnBoardingFiveState();
}

class _OnBoardingFiveState extends State<OnBoardingFive> {
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
        cb: () {
          widget.prefs.setBool('isOnboarded', true);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => false);
        },
      ),
    );
  }
}
