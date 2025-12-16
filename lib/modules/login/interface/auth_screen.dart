import 'package:flutter/material.dart';
import 'package:nativo_front/core/widgets/toast/toast_config.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nativo_front/core/widgets/toast/toast_service.dart';
import 'package:nativo_front/core/theme/app_theme.dart';
import 'package:nativo_front/core/widgets/widgets.dart';
import 'package:nativo_front/modules/login/domain/auth_provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              spacing: AppTheme.spacingM,
              children: [
                Column(
                  spacing: AppTheme.spacingM,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTheme.p12,
                        vertical: AppTheme.p12,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.primary,
                        borderRadius: BorderRadius.circular(
                          AppTheme.largeRadius,
                        ),
                      ),
                      child: Icon(
                        Icons.agriculture,
                        size: 40.h,
                        color: AppTheme.background,
                      ),
                    ),
                    Text(
                      'Bienvenido a Nativo',
                      style: GoogleFonts.poppins(
                        fontSize: AppTheme.fontTitleLarge,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    ValueListenableBuilder(
                      valueListenable: authProvider.selectedRole,
                      builder: (_, selectedRole, __) {
                        return ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 355),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppTheme.p4.w,
                              vertical: AppTheme.p4.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(20),
                              borderRadius: BorderRadius.circular(
                                AppTheme.mediumRadius,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _OptionItem(
                                  icon: Icons.agriculture,
                                  text: "Campesino",
                                  selected: selectedRole == UserRole.campesino,
                                  onTap: () => authProvider.selectUser(
                                    UserRole.campesino,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                _OptionItem(
                                  icon: Icons.storefront,
                                  text: "Usuario",
                                  selected: selectedRole == UserRole.usuario,
                                  onTap: () =>
                                      authProvider.selectUser(UserRole.usuario),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  spacing: AppTheme.spacingS,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email / Usuario',
                      style: GoogleFonts.poppins(
                        fontSize: AppTheme.fontSubtitle,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    CustomInput(
                      hint: 'Ingresa tu email o usuario',
                      icon: Icons.account_circle_rounded,
                      controller: authProvider.email,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Contraseña',
                      style: GoogleFonts.poppins(
                        fontSize: AppTheme.fontSubtitle,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    CustomInput(
                      hint: 'Ingresa tu contraseña',
                      icon: Icons.lock,
                      controller: authProvider.password,
                    ),
                    SizedBox(height: 5.h),
                    Align(
                      alignment: Alignment.centerRight,

                      child: GestureDetector(
                        onTap: () {
                          // TODO: Agregar a navegación de olvidaste tu contraseña.
                          debugPrint('¿Olvidaste tu contraseña?');
                        },
                        child: Text(
                          '¿Olvidaste tu contraseña?',
                          style: GoogleFonts.poppins(
                            color: AppTheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  text: 'Ingresar',
                  onTap: () {
                    // TODO: Eliminar, es prueba para observar datos del correo.
                    if (authProvider.selectedRole.value == UserRole.campesino) {
                      context.go('/campesino-home');
                    } else if (authProvider.selectedRole.value ==
                        UserRole.usuario) {
                      context.go('/comprador-home');
                    } else {
                      ToastService.show(
                        context,
                        message: 'Selecciona el tipo de usuario.',
                        config: const ToastConfig(
                          type: ToastType.info,
                          dismissOnSwipe: true,
                          dismissOnTap: true,
                        ),
                      );
                    }
                    debugPrint(authProvider.email.value);
                    debugPrint(authProvider.password.value);
                  },
                ),
                SizedBox(height: 10.h),
                Text(
                  '¿No tienes cuenta?',
                  style: GoogleFonts.poppins(color: AppTheme.textSecondary),
                ),
                CustomButton(
                  text: 'Crear cuenta',
                  background: Colors.transparent,
                  borderColor: AppTheme.primary,
                  textColor: AppTheme.primary,
                  onTap: () {
                    if (authProvider.selectedRole.value == UserRole.campesino) {
                      context.push('/campesino-register');
                    } else if (authProvider.selectedRole.value ==
                        UserRole.usuario) {
                      context.push('/comprador-register');
                    } else {
                      ToastService.show(
                        context,
                        message: 'Selecciona el tipo de usuario.',
                        config: const ToastConfig(
                          type: ToastType.info,
                          dismissOnSwipe: true,
                          dismissOnTap: true,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OptionItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const _OptionItem({
    required this.icon,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? Colors.white : const Color(0xffE5E8EC),
          borderRadius: BorderRadius.circular(AppTheme.mediumRadius),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.black.withAlpha(20),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Row(
          spacing: 5,
          children: [
            Icon(
              icon,
              color: selected ? AppTheme.primary : Colors.grey.shade700,
              size: 20,
            ),
            const SizedBox(width: 6),
            Text(
              text,
              style: GoogleFonts.poppins(
                color: selected ? AppTheme.primary : Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
