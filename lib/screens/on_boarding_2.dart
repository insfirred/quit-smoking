import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_can/controllers/user_controller.dart';
import 'package:i_can/l10n/localization.dart';
import 'package:i_can/screens/on_boarding_3.dart';
import 'package:i_can/widgets/custom_bottom_app_bar.dart';
import 'package:i_can/widgets/custom_on_boarding_card.dart';

//second onboarding screen
class OnBoardingTwo extends StatefulWidget {
  OnBoardingTwo({Key? key}) : super(key: key);
  static const routeName = '/second-on-boarding';

  @override
  State<OnBoardingTwo> createState() => _OnBoardingTwoState();
}

class _OnBoardingTwoState extends State<OnBoardingTwo> {
  UserController userController = Get.find<UserController>();

  String smokingDate = "";

  String intToMonth(String monthInteger) {
    String month = "";
    if (monthInteger == "01")
      month = Localization.of(context)!.january;
    else if (monthInteger == "02")
      month = Localization.of(context)!.february;
    else if (monthInteger == "03")
      month = Localization.of(context)!.march;
    else if (monthInteger == "04")
      month = Localization.of(context)!.april;
    else if (monthInteger == "05")
      month = Localization.of(context)!.may;
    else if (monthInteger == "06")
      month = Localization.of(context)!.june;
    else if (monthInteger == "07")
      month = Localization.of(context)!.july;
    else if (monthInteger == "08")
      month = Localization.of(context)!.august;
    else if (monthInteger == "09")
      month = Localization.of(context)!.september;
    else if (monthInteger == "10")
      month = Localization.of(context)!.october;
    else if (monthInteger == "11")
      month = Localization.of(context)!.november;
    else if (monthInteger == "12") month = Localization.of(context)!.december;
    return month;
  }

  String dateToString(String date) {
    if (date == "") return "";
    String year = date.substring(0, 4);
    String day = date.substring(8, 10);
    int hello = int.parse(day);
    String month = date.substring(5, 7);
    month = intToMonth(month);

    return "$month ${hello.toString()}, $year";
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: CustomOnBoardingCard(
              title: Localization.of(context)!.since_when,
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
                      if (value != null) {
                        userController.setDate(value as DateTime);
                        smokingDate = value.toString();
                        setState(() {});
                      }
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
          Center(
            child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3),
                child: Text(dateToString(smokingDate),
                    style: const TextStyle(color: Colors.white, fontSize: 25))),
          )
        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(
          title: Localization.of(context)!.next,
          cb: () {
            Get.toNamed(OnBoardingThree.routeName);
          }),
    );
  }
}
