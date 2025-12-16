import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nativo_front/core/theme/app_theme.dart';
import 'package:nativo_front/core/widgets/widgets.dart';
import 'package:nativo_front/modules/campesino/campesino_register/domain/campesino_register_provider.dart';

class CampesinoRegisterScreen extends StatelessWidget {
  const CampesinoRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<CampesinoRegisterProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                spacing: AppTheme.spacingM,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 50,
                      color: AppTheme.background,
                    ),
                  ),
                  Text(
                    'Crea tu cuenta como Campesino y empieza a vender tus productos',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: AppTheme.fontTitleLarge,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    spacing: AppTheme.spacingS,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nombre',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                      CustomInput(
                        hint: 'Ingresa tu nombre',
                        icon: Icons.account_circle_rounded,
                        controller: registerProvider.name,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Apellidos',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                      CustomInput(
                        hint: 'Ingresa tus apellidos',
                        icon: Icons.account_circle_rounded,
                        controller: registerProvider.surname,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Correo eléctronico',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                      CustomInput(
                        hint: 'Ingresa tu correo',
                        icon: Icons.account_circle_rounded,
                        controller: registerProvider.email,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Número de documento',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                      CustomInput(
                        hint: 'Ingresa tu número de documento',
                        icon: Icons.picture_in_picture_rounded,
                        controller: registerProvider.docNumber,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Número telefónico',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                      PhoneInput(
                        countryCode: registerProvider.countryCode,
                        phone: registerProvider.phoneNumber,
                      ),
                      SizedBox(height: 5),
                      DependentDropdown(
                        title: 'Departamento',
                        hint: 'Seleccione el Departamento',
                        items: registerProvider.departments,
                        selected: registerProvider.selectedDepartment,
                        onSelected: registerProvider.selectDepartment,
                      ),
                      const SizedBox(height: 12),
                      ValueListenableBuilder(
                        valueListenable: registerProvider.selectedDepartment,
                        builder: (_, __, ___) {
                          return DependentDropdown(
                            title: 'Municipio',
                            hint: 'Seleccione el Municipio',
                            items: registerProvider.cities,
                            selected: registerProvider.selectedCity,
                            onSelected: registerProvider.selectCity,
                          );
                        },
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Dirección de residencia',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                      CustomInput(
                        hint: 'Ingresa tu dirección',
                        icon: Icons.house_rounded,
                        controller: registerProvider.docNumber,
                      ),
                      SizedBox(height: 5),
                      ExpandableDescriptionInput(
                        title: 'Descripción',
                        hint: 'Describe que produces...',
                        controller: registerProvider.description,
                        maxLength: 500,
                      ),
                      Text(
                        'Contraseña',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                      PasswordInput(
                        hint: 'Ingresa tu contraseña',
                        controller: registerProvider.password,
                        obscure: registerProvider.obscurePassword,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Confirmar contraseña',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                      PasswordInput(
                        hint: 'Confirma tu contraseña',
                        controller: registerProvider.password,
                        obscure: registerProvider.obscurePassword,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  CustomButton(
                    text: 'Registrarme',
                    onTap: () {
                      // TODO: Método para registrar
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      context.go('/auth');
                    },
                    child: RichText(
                      text: TextSpan(
                        text: '¿Ya tienes cuenta? ',
                        style: GoogleFonts.poppins(
                          color: AppTheme.textSecondary,
                        ),
                        children: [
                          TextSpan(
                            text: 'Inicia Sesión',
                            style: GoogleFonts.poppins(
                              color: AppTheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
