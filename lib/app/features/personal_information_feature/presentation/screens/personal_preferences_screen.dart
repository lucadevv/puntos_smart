import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/widgets/custom_button_widget.dart';

import '../../../../core/constants/app_text.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_arrow_back.dart';

class PersonalPreferencesScreen extends StatefulWidget {
  const PersonalPreferencesScreen({super.key});

  @override
  State<PersonalPreferencesScreen> createState() =>
      _PersonalPreferencesScreenState();
}

class _PersonalPreferencesScreenState extends State<PersonalPreferencesScreen> {
  final List<String> preferencias = [
    'Sushi',
    'Tecnología',
    'Comida rápida',
    'Deportes',
    'Gadgets',
    'Viajes',
    'Música',
    'Películas',
    'Salud',
    'Fitness',
    'Libros',
    'Videojuegos'
  ];

  // Set para guardar las preferencias seleccionadas
  Set<String> seleccionadas = {};

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    backgroundColor: Colors.white,
                    // leading: InkWell(
                    //   onTap: () {
                    //     context.pop();
                    //   },
                    //   child: const Icon(
                    //     Icons.arrow_back_ios_new,
                    //     color: Colors.black54,
                    //   ),
                    // ),
                    leadingWidth: 70,
                    leading: const Padding(
                      padding: EdgeInsets.only(left: 16, bottom: 4),
                      child: CustomButtonArrowBack(),
                    ),
                    centerTitle: true,
                    title: Text(
                      AppText.personalPreferences,
                      style: textTheme.bodyLarge!.copyWith(
                        color: AppColors.blacknew,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Text(
                        "Tus Preferencias, Tu Estilo: Selecciona lo que Amas",
                        style: textTheme.titleLarge!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody:
                        false, // Evita que el contenido sea desplazable
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 10.0,
                            runSpacing: 8.0,
                            children: preferencias.map((preferencia) {
                              final isSelected =
                                  seleccionadas.contains(preferencia);
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (isSelected) {
                                      seleccionadas
                                          .remove(preferencia); // Deseleccionar
                                    } else {
                                      seleccionadas
                                          .add(preferencia); // Seleccionar
                                    }
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.black
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      width: 1,
                                      color: isSelected
                                          ? Colors.black
                                          : Colors.grey.shade400,
                                    ),
                                  ),
                                  child: Text(
                                    preferencia,
                                    style: textTheme.bodyMedium!.copyWith(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: kToolbarHeight * 0.5,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomButtonWidget(
                  title: "Guardar",
                  width: size.width,
                  onTap: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
