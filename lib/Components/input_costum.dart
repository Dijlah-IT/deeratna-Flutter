import 'package:deeratna/Constants/constants.dart';
import 'package:flutter/material.dart';

class TextFormFieldCostum extends StatelessWidget {
  final String isEmptyTitle;
  final int maxLength;
  final String lengthErrorTitle;
  final String labelTitle;
  final String helperTitle;
  final TextInputType inputType;
  final bool obscureText;
  final IconData inputIcon;

  const TextFormFieldCostum({
    super.key,
    required this.isEmptyTitle,
    required this.maxLength,
    required this.lengthErrorTitle,
    required this.labelTitle,
    required this.helperTitle,
    required this.inputType,
    required this.obscureText,
    required this.inputIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      cursorColor: Colors.black,
      obscureText: obscureText,
      obscuringCharacter: '*',
      validator: (String? value) {
        if (value!.isEmpty) {
          return isEmptyTitle;
        }
        if (value.length < maxLength) {
          return lengthErrorTitle;
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          borderSide: BorderSide(color: Constants.textColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          borderSide: BorderSide(color: Constants.headerColor),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          borderSide: BorderSide(color: Colors.red),
        ),
        icon: Icon(inputIcon),
        iconColor: Constants.headerColor,
        labelText: labelTitle,
        helperText: helperTitle,
        labelStyle: TextStyle(
          fontSize: 15,
          fontFamily: 'Jazeera-Regular',
          color: Constants.headerColor,
        ),
        helperStyle: const TextStyle(
          fontSize: 10,
          fontFamily: 'Jazeera-Regular',
        ),
      ),
    );
  }
}
