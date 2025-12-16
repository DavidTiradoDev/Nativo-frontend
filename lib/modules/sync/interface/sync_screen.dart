import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:nativo_front/modules/sync/domain/sync_provider.dart';
import 'package:provider/provider.dart';

class SyncScreen extends StatelessWidget {
  const SyncScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final syncProvider = Provider.of<SyncProvider>(context);

    return Scaffold(
      body: Center(
        child: ValueListenableBuilder<bool>(
          valueListenable: syncProvider.isLoading,
          builder: (context, isLoading, _) {
            if (isLoading) {
              return Lottie.asset(
                "assets/animations/farmer_01.json",
                width: 180,
                repeat: true,
              );
            }

            return ValueListenableBuilder<bool>(
              valueListenable: syncProvider.status,
              builder: (context, status, _) {
                if (status) {
                  return Lottie.asset(
                    "assets/animations/farmer_01.json",
                    width: 350,
                    repeat: false,
                    onLoaded: (composition) {
                      Future.delayed(const Duration(seconds: 2), () {
                        if (context.mounted) {
                          context.go('/auth');
                        }
                      });
                    },
                  );
                } else {
                  return const Text("Sin conexión a internet");
                }
              },
            );
          },
        ),
      ),
    );
  }
}
