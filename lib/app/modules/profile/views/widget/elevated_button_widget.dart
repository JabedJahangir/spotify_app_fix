import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final String text;
  final Color? textColor;
  final VoidCallback? onPressed;
  final double? fontSize;

  const ElevatedButtonWidget({
    super.key,
    this.height=24,
    this.width =81,
    this.backgroundColor,
    this.textColor,
    required this.text,
    required this.onPressed,
    this.fontSize=12,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed:onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize:fontSize,
              fontWeight: FontWeight.w300,
              color: textColor,
              letterSpacing: 0.01,
            ),
          ),
        ),
      ),
    );
  }
}
