import 'package:flutter/material.dart';
import 'toast_widget.dart';
import 'toast_config.dart';

class ToastService {
  static OverlayEntry? _entry;

  static void show(
    BuildContext context, {
    required String message,
    required ToastConfig config,
  }) {
    _entry?.remove();

    _entry = OverlayEntry(
      builder: (_) => Positioned(
        top: 60,
        left: 16,
        right: 16,
        child: ToastWidget(
          message: message,
          config: config,
          onDismiss: () {
            _entry?.remove();
            _entry = null;
          },
        ),
      ),
    );

    Overlay.of(context).insert(_entry!);
  }
}
