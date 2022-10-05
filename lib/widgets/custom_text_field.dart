import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.cb,
    this.label = "",
    this.textInputType = TextInputType.name,
  }) : super(key: key);

  Function(String?) cb;

  TextInputType textInputType;

  String label;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return TextField(
      onChanged: cb,
      decoration: InputDecoration(
        label: Text(
          label,
          style: const TextStyle(
            color: Color(0xffa8a8a8),
            fontSize: 25,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.symmetric(
            vertical: ((mediaQuery.size.height / 4.5) / 4) / 4, horizontal: 20),
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),
      keyboardType: textInputType,
      cursorHeight: 25,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 25,
      ),
    );
  }
}
