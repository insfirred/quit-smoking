import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  CustomBottomAppBar({Key? key, required this.title}) : super(key: key);

  String? title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      child: BottomAppBar(
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              color: theme.cardColor,
            ),
            child: Center(
              child: Text(
                title.toString(),
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
