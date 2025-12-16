import 'package:flutter/material.dart';
import 'package:nativo_front/core/data/colombia_locations.dart';

class CampesinoRegisterProvider with ChangeNotifier {
  final ValueNotifier<String> name = ValueNotifier<String>('');
  final ValueNotifier<String> surname = ValueNotifier<String>('');
  final ValueNotifier<String> email = ValueNotifier<String>('');
  final ValueNotifier<String> docNumber = ValueNotifier<String>('');
  final ValueNotifier<String> password = ValueNotifier<String>('');
  final ValueNotifier<bool> obscurePassword = ValueNotifier<bool>(true);
  final ValueNotifier<String> phoneNumber = ValueNotifier<String>('');
  final ValueNotifier<String> countryCode = ValueNotifier<String>('+57');
  final ValueNotifier<String> description = ValueNotifier<String>('');

  final selectedDepartment = ValueNotifier<String?>(null);
  final selectedCity = ValueNotifier<String?>(null);

  List<String> get departments => colombiaLocations.keys.toList();

  List<String> get cities {
    final dept = selectedDepartment.value;
    if (dept == null) return [];
    return colombiaLocations[dept] ?? [];
  }

  void selectDepartment(String department) {
    selectedDepartment.value = department;
    selectedCity.value = null; // reset municipio
  }

  void selectCity(String city) {
    selectedCity.value = city;
  }
}
