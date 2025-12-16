import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class CustomInput extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextInputType keyboard;
  final ValueNotifier<String> controller;
  final String? Function(String value)? validator;

  const CustomInput({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
    this.keyboard = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (_, value, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppTheme.p16,
                vertical: AppTheme.p12,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppTheme.mediumRadius),
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
              child: Row(
                children: [
                  Icon(icon, color: Colors.grey.shade500),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      keyboardType: keyboard,
                      onChanged: (text) => controller.value = text,
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: GoogleFonts.poppins(
                          fontSize: AppTheme.fontBody,
                          color: Colors.grey.shade600,
                        ),
                        border: InputBorder.none,
                        isCollapsed: true,
                      ),
                      style: GoogleFonts.poppins(
                        fontSize: AppTheme.fontBody,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            if (validator != null)
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 4),
                child: Text(
                  validator!(value) ?? "",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: AppTheme.fontSmall,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
