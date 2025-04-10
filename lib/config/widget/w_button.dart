import 'package:flutter/material.dart';

enum WButtonType { white, orange, outline }

class WButton extends StatelessWidget {
  final String text;
  final WButtonType buttonType;
  final GestureTapCallback onTap;
  const WButton(
      {super.key,
      required this.text,
      this.buttonType = WButtonType.orange,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
            color: buttonType == WButtonType.white
                ? Colors.white
                : Color(0xFFFF6600),
            borderRadius: BorderRadius.circular(13)),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: buttonType == WButtonType.white
                  ? Color(0xFFFF6600)
                  : Colors.white),
        ),
      ),
    );
  }
}
