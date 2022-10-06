import 'package:flutter/material.dart';

import 'package:i_can/widgets/custom_text_field.dart';

class CustomOnBoardingCard extends StatelessWidget {
  CustomOnBoardingCard(
      {Key? key, required this.title, required this.bottomWidget})
      : super(key: key);

  String title;

  dynamic bottomWidget;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        height: mediaQuery.size.height / 4,
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: (mediaQuery.size.height / 4) / 8,
            ),
            bottomWidget,
          ],
        ),
      ),
    );
  }
}
