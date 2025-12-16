import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nativo_front/modules/comprador/comprador_register/domain/comprador_register_provider.dart';
import 'package:nativo_front/modules/comprador/comprador_register/interface/comprador_register_screen.dart';

class CompradorRegisterInjection {
  CompradorRegisterInjection._();

  static Widget injection() {
    return ListenableProvider(
      create: (context) => CompradorRegisterProvider(),
      child: CompradorRegisterScreen(),
    );
  }
}
