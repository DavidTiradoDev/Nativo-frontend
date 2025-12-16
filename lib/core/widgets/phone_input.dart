import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class PhoneInput extends StatelessWidget {
  final ValueNotifier<String> countryCode;
  final ValueNotifier<String> phone;
  final String? Function(String code, String phone)? validator;

  const PhoneInput({
    super.key,
    required this.countryCode,
    required this.phone,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: phone,
      builder: (_, phoneValue, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppTheme.p12,
                vertical: AppTheme.p12,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppTheme.mediumRadius),
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
              child: Row(
                children: [
                  ValueListenableBuilder(
                    valueListenable: countryCode,
                    builder: (_, code, __) {
                      return DropdownButton<String>(
                        value: code,
                        underline: const SizedBox(),
                        items: const [
                          DropdownMenuItem(value: '+57', child: Text('+57')),
                          DropdownMenuItem(value: '+52', child: Text('+52')),
                          DropdownMenuItem(value: '+1', child: Text('+1')),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            countryCode.value = value;
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      onChanged: (value) => phone.value = value,
                      decoration: InputDecoration(
                        hintText: 'Número telefónico',
                        border: InputBorder.none,
                        isCollapsed: true,
                      ),
                      style: GoogleFonts.poppins(fontSize: AppTheme.fontBody),
                    ),
                  ),
                ],
              ),
            ),
            if (validator != null)
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 4),
                child: Text(
                  validator!(countryCode.value, phoneValue) ?? "",
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
