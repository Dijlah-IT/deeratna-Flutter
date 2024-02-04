import 'package:deeratna/Constants/constants.dart';
import 'package:flutter/material.dart';

class CustomHeadLine extends StatelessWidget {
  const CustomHeadLine({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Row(
        children: [
          RotationTransition(
            turns: const AlwaysStoppedAnimation(45 / 360),
            child: Icon(
              Icons.square,
              color: Constants.textColor,
              size: 6,
            ),
          ),
          Flexible(
            child: Divider(
              color: Constants.textColor,
              thickness: 0.8,
              height: 0,
            ),
          ),
          RotationTransition(
            turns: const AlwaysStoppedAnimation(45 / 360),
            child: Icon(
              Icons.square,
              color: Constants.textColor,
              size: 6,
            ),
          ),
        ],
      ),
    );
  }
}
