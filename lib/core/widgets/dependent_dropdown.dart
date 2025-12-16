import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nativo_front/core/theme/app_theme.dart';

class DependentDropdown extends StatelessWidget {
  final String hint;
  final List<String> items;
  final ValueNotifier<String?> selected;
  final void Function(String value) onSelected;
  final String title;

  const DependentDropdown({
    super.key,
    required this.hint,
    required this.items,
    required this.selected,
    required this.onSelected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selected,
      builder: (_, value, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppTheme.spacingS,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppTheme.p16,
                vertical: AppTheme.p4,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppTheme.mediumRadius),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: DropdownButton<String>(
                value: value,
                hint: Text(hint),
                isExpanded: true,
                underline: const SizedBox(),
                items: items
                    .map(
                      (item) =>
                          DropdownMenuItem(value: item, child: Text(item)),
                    )
                    .toList(),
                onChanged: items.isEmpty
                    ? null
                    : (v) {
                        if (v != null) onSelected(v);
                      },
              ),
            ),
          ],
        );
      },
    );
  }
}
