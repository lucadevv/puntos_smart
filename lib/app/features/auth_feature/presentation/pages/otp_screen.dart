import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:puntos_smart_user/app/core/constants/app_images.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/core/physics/custom_scroll_physics.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_arrow_back.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/widgets/custom_button_widget.dart';
import 'package:puntos_smart_user/app/features/store_feature/presentation/widgets/customt_extformfield_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<FocusNode> _focusNodes = [];
  final List<bool> _isFocused = [];
  final List<TextEditingController> _controllers = [];
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    focusNodeListners();
    Future.delayed(const Duration(seconds: 2)).then((_) {
      populateOtpFields('4325');
    });
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
                if (objectPosition > screenHeight * 0.7 || objectPosition < 0) {
                  double scrollOffset = objectPosition - (screenHeight * 0.3);
                  _scrollController.animateTo(
                    _scrollController.offset + scrollOffset,
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

  void populateOtpFields(String otp) {
    if (otp.length == 4) {
      for (int i = 0; i < 4; i++) {
        Future.delayed(Duration(milliseconds: i * 200), () {
          setState(() {
            _controllers[i].text = otp[i];
          });
        });
      }
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
    _scrollController.dispose();
    super.dispose();
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
                controller: _scrollController,
                physics: const NoUserBouncingScrollPhysics(),
                child: Container(
                  height: size.height,
                  width: size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        AppImages.otpScreen,
                      ),
                      Text(
                        AppText.verifyNumber,
                        style: textTheme.titleLarge!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${AppText.codeOtp} +51 930453423',
                        style: textTheme.bodyLarge!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        AppText.enterCodeOtp,
                        style: textTheme.bodyMedium!.copyWith(
                          color: AppColors.surface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        width: size.width,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(4, (index) {
                              final focusNode = _focusNodes[index];
                              final isFocus = _isFocused[index];
                              final controller = _controllers[index];
                              return SizedBox(
                                height: 65,
                                width: 65,
                                child: CustomTextFormFielWidget(
                                  unFocus: focusNode,
                                  isFocused: isFocus,
                                  isOtp: true,
                                  controller: controller,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      if (index < 3) {
                                        // Establece el foco en el siguiente campo
                                        FocusScope.of(context).requestFocus(
                                            _focusNodes[index + 1]);
                                      } else {
                                        // Si es el último campo, quita el foco
                                        FocusScope.of(context).unfocus();
                                      }

                                      // Asegura que el cursor esté siempre al final del texto
                                      _controllers[index].selection =
                                          TextSelection.fromPosition(
                                        TextPosition(
                                            offset: _controllers[index]
                                                .text
                                                .length),
                                      );
                                    } else if (value.isEmpty && index > 0) {
                                      // Mueve el foco al campo anterior si se borra el contenido
                                      FocusScope.of(context)
                                          .requestFocus(_focusNodes[index - 1]);
                                    }
                                  },
                                ),
                              );
                            })),
                      ),
                      CustomButtonWidget(
                        onTap: () {
                          focusNodeUnFocus();
                          context.push(NameRoutes.registerScreen);
                        },
                        title: AppText.validate,
                        width: size.width,
                      )
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
