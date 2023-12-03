import 'package:deeratna/Constants/constants.dart';
import 'package:flutter/material.dart';

bool showPassword = true;

class TextFormFieldCostum extends StatefulWidget {
  final String isEmptyTitle;
  final int maxLength;
  final String lengthErrorTitle;
  final String labelTitle;
  final String helperTitle;
  final TextInputType inputType;
  final bool obscureText;
  final IconData inputIcon;
  final TextEditingController? controller;

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
    this.controller,
  });

  @override
  State<TextFormFieldCostum> createState() => _TextFormFieldCostumState();
}

class _TextFormFieldCostumState extends State<TextFormFieldCostum> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.inputType,
      cursorColor: Colors.black,
      obscureText:
          widget.obscureText == true ? showPassword : widget.obscureText,
      obscuringCharacter: '*',
      validator: (String? value) {
        if (value!.isEmpty) {
          return widget.isEmptyTitle;
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
        icon: Icon(
          widget.inputIcon,
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  !showPassword ? Icons.visibility : Icons.visibility_off,
                ),
                color: Constants.headerColor,
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
              )
            : const Text(""),
        iconColor: Constants.headerColor,
        labelText: widget.labelTitle,
        helperText: widget.helperTitle,
        labelStyle: TextStyle(
          fontSize: 15,
          fontFamily: 'Jazeera-Regular',
          color: Constants.headerColor,
        ),
        helperStyle: TextStyle(
          fontSize: 10,
          color:
              Constants.statusCode == 200 ? Constants.headerColor : Colors.red,
          fontFamily: 'Jazeera-Regular',
        ),
      ),
    );
  }
}
