import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nativo_front/modules/campesino/campesino_home/domain/campesino_home_provider.dart';
import 'package:nativo_front/modules/campesino/campesino_home/interface/campesino_home_screen.dart';

class CampesinoHomeInjection {
  CampesinoHomeInjection._();

  static Widget injection() {
    return ListenableProvider(
      create: (context) => CampesinoHomeProvider(),
      child: CampesinoHomeScreen(),
    );
  }
}
