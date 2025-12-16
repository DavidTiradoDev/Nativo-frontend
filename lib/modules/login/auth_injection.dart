import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nativo_front/modules/login/domain/auth_provider.dart';
import 'package:nativo_front/modules/login/interface/auth_screen.dart';

class AuthInjection {
  AuthInjection._();

  static Widget injection() {
    return ListenableProvider(
      create: (context) => AuthProvider(),
      child: AuthScreen(),
    );
  }
}
