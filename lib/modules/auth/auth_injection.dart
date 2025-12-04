import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nativo_front/modules/auth/domain/auth_provider.dart';
import 'package:nativo_front/modules/auth/interface/auth_screen.dart';

class AuthInjection {
  AuthInjection._();

  static Widget injection() {
    return ListenableProvider(
      create: (context) => AuthProvider(),
      child: AuthScreen(),
    );
  }
}
