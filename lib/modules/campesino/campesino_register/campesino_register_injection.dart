import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nativo_front/modules/campesino/campesino_register/domain/campesino_register_provider.dart';
import 'package:nativo_front/modules/campesino/campesino_register/interface/campesino_register_screen.dart';

class CampesinoRegisterInjection {
  CampesinoRegisterInjection._();

  static Widget injection() {
    return ListenableProvider(
      create: (context) => CampesinoRegisterProvider(),
      child: CampesinoRegisterScreen(),
    );
  }
}
