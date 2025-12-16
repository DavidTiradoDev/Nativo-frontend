import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nativo_front/core/theme/app_theme.dart';

class PasswordInput extends StatelessWidget {
  final String hint;
  final ValueNotifier<String> controller;
  final ValueNotifier<bool> obscure;
  final String? Function(String value)? validator;

  const PasswordInput({
    super.key,
    required this.hint,
    required this.controller,
    required this.obscure,
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
            ValueListenableBuilder(
              valueListenable: obscure,
              builder: (_, isObscure, __) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppTheme.p16.w,
                    vertical: AppTheme.p12.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppTheme.mediumRadius),
                    border: Border.all(color: Colors.grey.shade300, width: 1.w),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.lock, color: Colors.grey.shade500),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          obscureText: isObscure,
                          onChanged: (text) => controller.value = text,
                          decoration: InputDecoration(
                            hintText: hint,
                            border: InputBorder.none,
                            isCollapsed: true,
                          ),
                          style: GoogleFonts.poppins(
                            fontSize: AppTheme.fontBody,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => obscure.value = !isObscure,
                        child: Icon(
                          isObscure ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                );
              },
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
