import 'package:flutter/material.dart';

import '../colors/app colors.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    super.key,
    required this.text,
    this.color = AppColors.primaryColor,
    this.textColor = AppColors.secondaryColor,
    this.height = 50,
    this.width = 100,
    this.borderRadius = 10,
    this.isLoading = false,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double height, width;
  final double borderRadius;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: Text(text, style: TextStyle(color: textColor)),
              ),
      ),
    );
  }
}