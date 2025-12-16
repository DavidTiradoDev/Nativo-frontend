import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nativo_front/core/theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  final Color? background;
  final Color? textColor;
  final Color? borderColor;
  final double? radius;
  final double height;
  final FontWeight textWeight;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.background,
    this.textColor,
    this.borderColor,
    this.radius,
    this.height = 50,
    this.textWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: background ?? AppTheme.primary,
          borderRadius: BorderRadius.circular(radius ?? AppTheme.mediumRadius),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              color: textColor ?? Colors.white,
              fontWeight: textWeight,
              fontSize: AppTheme.fontSubtitle,
            ),
          ),
        ),
      ),
    );
  }
}
