import 'package:flutter/material.dart';

class CompradorRegisterProvider with ChangeNotifier {
  final ValueNotifier<String> name = ValueNotifier<String>('');
  final ValueNotifier<String> surname = ValueNotifier<String>('');
  final ValueNotifier<String> email = ValueNotifier<String>('');
  final ValueNotifier<String> docNumber = ValueNotifier<String>('');
  final ValueNotifier<String> password = ValueNotifier<String>('');
  final ValueNotifier<bool> obscurePassword = ValueNotifier<bool>(true);
  final ValueNotifier<String> phoneNumber = ValueNotifier<String>('');
  final ValueNotifier<String> countryCode = ValueNotifier<String>('+57');
}
