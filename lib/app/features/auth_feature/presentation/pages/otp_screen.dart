import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puntos_smart_user/app/core/constants/app_images.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_arrow_back.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/cubit/cubit/send_number_cubit.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/widgets/custom_button_widget.dart';
import 'package:puntos_smart_user/app/features/store_feature/presentation/widgets/customt_extformfield_widget.dart';
import 'package:sms_autofill/sms_autofill.dart';

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

  String code = '';

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    focusNodeListners();
    _listenForCode();
    // Future.delayed(const Duration(seconds: 2)).then((_) {
    //   populateOtpFields('4053');
    // });
  }

  void _listenForCode() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  void codeUpdated(String code) {
    setState(() {
      code = code;

      populateOtpFields(code);
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
        });
      });
    }
  }

  void populateOtpFields(String otp) {
    if (otp.isNotEmpty) {
      if (otp.length == 4) {
        for (int i = 0; i < 4; i++) {
          Future.delayed(Duration(milliseconds: i * 200), () {
            setState(() {
              _controllers[i].text = otp[i];
              if (i == 0) {
                context
                    .read<SendNumberCubit>()
                    .changedNumberOne(number: otp[i]);
              } else if (i == 1) {
                context
                    .read<SendNumberCubit>()
                    .changedNumberTwo(number: otp[i]);
              } else if (i == 2) {
                context
                    .read<SendNumberCubit>()
                    .changedNumberThree(number: otp[i]);
              } else if (i == 3) {
                context
                    .read<SendNumberCubit>()
                    .changedNumberFour(number: otp[i]);
              }
            });
          });
        }
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

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}'; // mm:ss
  }

  @override
  void dispose() {
    focusNodeDisposes();
    focusNodeUnFocus();
    SmsAutoFill().unregisterListener();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final phoneNumber = context.read<SendNumberCubit>().state.phoneNumber;

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
                physics: const ClampingScrollPhysics(),
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
                        '${AppText.codeOtp} +51 $phoneNumber',
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
                                      if (index == 0) {
                                        context
                                            .read<SendNumberCubit>()
                                            .changedNumberOne(number: value);
                                      } else if (index == 1) {
                                        context
                                            .read<SendNumberCubit>()
                                            .changedNumberTwo(number: value);
                                      } else if (index == 2) {
                                        context
                                            .read<SendNumberCubit>()
                                            .changedNumberThree(number: value);
                                      } else if (index == 3) {
                                        context
                                            .read<SendNumberCubit>()
                                            .changedNumberFour(number: value);
                                      }
                                      if (index < 3) {
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
                                      FocusScope.of(context)
                                          .requestFocus(_focusNodes[index - 1]);
                                      if (index == 0) {
                                        context
                                            .read<SendNumberCubit>()
                                            .changedNumberOne(number: '');
                                      } else if (index == 1) {
                                        context
                                            .read<SendNumberCubit>()
                                            .changedNumberTwo(number: '');
                                      } else if (index == 2) {
                                        context
                                            .read<SendNumberCubit>()
                                            .changedNumberThree(number: '');
                                      } else if (index == 3) {
                                        context
                                            .read<SendNumberCubit>()
                                            .changedNumberFour(number: '');
                                      }
                                    }
                                  },
                                ),
                              );
                            })),
                      ),
                      CustomButtonWidget(
                        onTap: () {
                          focusNodeUnFocus();
                          context
                              .read<SendNumberCubit>()
                              .requestCodeVerification();
                          // context.push(NameRoutes.registerScreen);
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
