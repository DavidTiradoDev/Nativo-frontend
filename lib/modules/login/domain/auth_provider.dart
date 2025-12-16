import 'package:flutter/material.dart';

enum UserRole { campesino, usuario }

class AuthProvider with ChangeNotifier {
  final ValueNotifier<UserRole?> selectedRole = ValueNotifier<UserRole?>(null);
  final ValueNotifier<String> email = ValueNotifier<String>('');
  final ValueNotifier<String> password = ValueNotifier<String>('');

  void selectUser(UserRole role) {
    selectedRole.value = role;
    notifyListeners();
  }
}
