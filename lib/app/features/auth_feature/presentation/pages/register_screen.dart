import 'package:flutter/material.dart';

import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/physics/custom_scroll_physics.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

import 'package:puntos_smart_user/app/core/widgets/custom_arrow_back.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/widgets/custom_button_widget.dart';
import 'package:puntos_smart_user/app/features/store_feature/presentation/widgets/customt_extformfield_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final listLabel = [
    AppText.user,
    AppText.numberPhone,
    AppText.password,
    AppText.confirmPassword
  ];
  final listIcon = [
    Icons.person,
    Icons.phone,
    Icons.private_connectivity,
    Icons.private_connectivity
  ];
  final List<FocusNode> _focusNodes = [];
  final List<bool> _isFocused = [];
  final List<TextEditingController> _controllers = [];
  late ScrollController scrollController;

  // Variables booleanas separadas para cada campo de contraseña
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    focusNodeListners();
  }

  void focusNodeListners() {
    for (int i = 0; i < 4; i++) {
      _focusNodes.add(FocusNode());
      _isFocused.add(false);
      _controllers.add(TextEditingController());

      _focusNodes[i].addListener(() {
        setState(() {
          _isFocused[i] = _focusNodes[i].hasFocus;

          if (_focusNodes[i].hasFocus) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              // Calculamos la posición del campo de texto
              RenderObject? object = _focusNodes[i].context?.findRenderObject();
              if (object is RenderBox) {
                double objectPosition = object.localToGlobal(Offset.zero).dy;
                double screenHeight = MediaQuery.of(context).size.height;

                // Calculamos si es necesario hacer scroll
                if (objectPosition > screenHeight * 0.5 || objectPosition < 0) {
                  double scrollOffset = objectPosition - (screenHeight * 0.3);
                  scrollController.animateTo(
                    scrollController.offset + scrollOffset,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              }
            });
          }
        });
      });
    }
  }

  focusNodeUnFocus() {
    for (var focusNode in _focusNodes) {
      focusNode.unfocus();
    }
  }

  focusNodeDisposes() {
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
  }

  @override
  void dispose() {
    focusNodeDisposes();
    focusNodeUnFocus();
    scrollController.dispose();
    super.dispose();
  }

  // Función para alternar la visibilidad de la contraseña
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  // Función para alternar la visibilidad de la confirmación de la contraseña
  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: scrollController,
                physics: const NoUserBouncingScrollPhysics(),
                child: Container(
                  height: size.height,
                  width: size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        AppText.registerTitle,
                        style: textTheme.titleLarge!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        AppText.registerTitile,
                        style: textTheme.bodyLarge!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Column(
                        children: List.generate(listLabel.length, (index) {
                          final focusNode = _focusNodes[index];
                          final isFocus = _isFocused[index];
                          final controller = _controllers[index];
                          final label = listLabel[index];
                          final icon = listIcon[index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: CustomTextFormFielWidget(
                              unFocus: focusNode,
                              isFocused: isFocus,
                              isOtp: false,
                              isPhone: index == 1
                                  ? _isPasswordVisible
                                  : false, // Si es número de teléfono
                              isPassword: index == 2 ||
                                  index ==
                                      3, // Si es contraseña o confirmar contraseña
                              isPasswordVisible: index == 2
                                  ? _isPasswordVisible
                                  : index == 3
                                      ? _isConfirmPasswordVisible
                                      : false,
                              controller: controller,
                              iconDataPrefix: Icon(
                                icon,
                                color: AppColors.onPrimary,
                              ),
                              label: label,
                              isTapPrefixIcon: index == 2
                                  ? _togglePasswordVisibility // Alternar visibilidad para "password"
                                  : index == 3
                                      ? _toggleConfirmPasswordVisibility // Alternar visibilidad para "confirm password"
                                      : null,
                              iconDataSufix: index == 2
                                  ? _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off
                                  : index == 3
                                      ? _isConfirmPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off
                                      : null,
                            ),
                          );
                        }),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: AppColors.onPrimary,
                            checkColor: Colors.white,
                            value: true,
                            onChanged: (value) {},
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: AppText.termnsAndConditinos1,
                                    style: textTheme.labelSmall!.copyWith(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: AppText.termnsAndConditinos2,
                                    style: textTheme.labelSmall!.copyWith(
                                      color: AppColors.onPrimary,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.onPrimary,
                                    ),
                                  ),
                                  TextSpan(
                                    text: AppText.termnsAndConditinos3,
                                    style: textTheme.labelSmall!.copyWith(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: AppText.termnsAndConditinos4,
                                    style: textTheme.labelSmall!.copyWith(
                                      color: AppColors.onPrimary,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.onPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      CustomButtonWidget(
                        onTap: () {
                          // Acción del botón
                          focusNodeUnFocus();
                        },
                        title: AppText.validate,
                        width: size.width,
                      ),
                    ],
                  ),
                ),
              ),
              const SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: CustomButtonArrowBack(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
