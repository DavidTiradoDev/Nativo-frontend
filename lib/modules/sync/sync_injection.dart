import 'package:flutter/material.dart';
import 'package:nativo_front/modules/sync/domain/sync_provider.dart';
import 'package:nativo_front/modules/sync/interface/sync_screen.dart';
import 'package:provider/provider.dart';

class SyncInjection {
  SyncInjection._();

  static Widget injection() {
    return ListenableProvider(
      create: (context) => SyncProvider()..validateConnection(),
      child: SyncScreen(),
    );
  }
}
