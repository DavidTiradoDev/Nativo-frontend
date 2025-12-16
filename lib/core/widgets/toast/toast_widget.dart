import 'dart:async';

import 'package:flutter/material.dart';
import 'toast_config.dart';

class ToastWidget extends StatefulWidget {
  final String message;
  final ToastConfig config;
  final VoidCallback onDismiss;

  const ToastWidget({
    super.key,
    required this.message,
    required this.config,
    required this.onDismiss,
  });

  @override
  State<ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slide;

  bool _isDismissing = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer(widget.config.duration, dismiss);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _slide = Tween(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    Future.delayed(widget.config.duration, dismiss);
  }

  Future<void> dismiss() async {
    if (_isDismissing) return;
    _isDismissing = true;

    if (_controller.isAnimating || !_controller.isCompleted) {
      await _controller.reverse();
    }

    if (mounted) {
      widget.onDismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = SlideTransition(
      position: _slide,
      child: Material(
        color: _backgroundColor(),
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: widget.config.dismissOnTap ? dismiss : null,
          splashColor: widget.config.dismissOnTap ? null : Colors.transparent,
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              widget.message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );

    if (widget.config.dismissOnSwipe) {
      content = Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.up,
        onDismissed: (_) => dismiss(),
        child: content,
      );
    }

    return content;
  }

  Color _backgroundColor() {
    switch (widget.config.type) {
      case ToastType.success:
        return Colors.green;
      case ToastType.error:
        return Colors.red;
      case ToastType.warning:
        return Colors.orange;
      case ToastType.info:
        return Colors.blue;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }
}
