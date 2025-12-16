import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nativo_front/core/theme/app_theme.dart';

class ExpandableDescriptionInput extends StatelessWidget {
  final String hint;
  final int maxLength;
  final ValueNotifier<String> controller;
  final int minLines;
  final int maxLines;
  final String title;

  const ExpandableDescriptionInput({
    super.key,
    required this.hint,
    required this.controller,
    this.maxLength = 300,
    this.minLines = 3,
    this.maxLines = 8,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (_, value, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppTheme.p16,
                vertical: AppTheme.p12,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppTheme.mediumRadius),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: TextField(
                keyboardType: TextInputType.multiline,
                minLines: minLines,
                maxLines: maxLines,
                maxLength: maxLength,
                onChanged: (text) => controller.value = text,
                decoration: InputDecoration(
                  hintText: hint,
                  counterText: '', // ocultamos el default
                  border: InputBorder.none,
                ),
                style: GoogleFonts.poppins(fontSize: AppTheme.fontBody),
              ),
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${value.length} / $maxLength',
                style: GoogleFonts.poppins(
                  fontSize: AppTheme.fontSmall,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
