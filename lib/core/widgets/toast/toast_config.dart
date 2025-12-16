enum ToastType { success, error, warning, info }

class ToastConfig {
  final ToastType type;
  final Duration duration;
  final bool dismissOnTap;
  final bool dismissOnSwipe;

  const ToastConfig({
    required this.type,
    this.duration = const Duration(seconds: 3),
    this.dismissOnTap = true,
    this.dismissOnSwipe = false,
  });
}
