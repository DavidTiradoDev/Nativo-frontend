import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nativo_front/modules/comprador/comprador_home/comprador_home_screen.dart';
import 'package:nativo_front/modules/comprador/comprador_home/domain/comprador_home_provider.dart';

class CompradorHomeInjection {
  CompradorHomeInjection._();

  static Widget injection() {
    return ListenableProvider(
      create: (context) => CompradorHomeProvider(),
      child: CompradorHomeScreen(),
    );
  }
}
