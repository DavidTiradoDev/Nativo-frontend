import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:nativo_front/modules/sync/external/sync_external.dart';

class SyncProvider with ChangeNotifier {
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<bool> status = ValueNotifier(false);

  Future<void> validateConnection() async {
    isLoading.value = true;

    final results = await SyncExternal().validateConnection();

    isLoading.value = false;

    status.value = results.any((r) => r != ConnectivityResult.none);
  }
}
