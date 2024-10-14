import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:puntos_smart_user/app/core/constants/app_images.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/core/physics/custom_scroll_physics.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

import 'package:puntos_smart_user/app/core/widgets/custom_arrow_back.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/bloc/signup_bloc/signup_bloc.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/widgets/custom_button_widget.dart';
import 'package:puntos_smart_user/app/features/store_feature/presentation/widgets/customt_extformfield_widget.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key});

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final listLabel = [AppText.password, AppText.confirmPassword];
  final List<FocusNode> _focusNodes = [];
  final List<bool> _isFocused = [];
  final List<TextEditingController> _controllers = [];
  late ScrollController scrollController;

  bool _isPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;

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

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  focusNodeDisposes() {
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
  }

  @override
  void dispose() {
    focusNodeUnFocus();
    focusNodeDisposes();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        bool shouldUnfocus =
            !currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null;
        if (shouldUnfocus) {
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
                      Image.asset(
                        AppImages.resetScreen2,
                      ),
                      Text(
                        AppText.resetPassword,
                        style: textTheme.titleLarge!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        AppText.infoResetPassword,
                        style: textTheme.bodyLarge!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Column(
                        children: List.generate(
                          2,
                          (index) {
                            final focusNode = _focusNodes[index];
                            final isFocus = _isFocused[index];
                            final controller = _controllers[index];
                            final label = listLabel[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: BlocBuilder<SignupBloc, SignupState>(
                                buildWhen: (previous, current) {
                                  switch (index) {
                                    case 0:
                                      return previous.password !=
                                              current.password ||
                                          previous.passwordError !=
                                              current.passwordError;
                                    case 1:
                                      return previous.confirmPassword !=
                                              current.confirmPassword ||
                                          previous.confirmPasswordError !=
                                              current.confirmPasswordError;

                                    default:
                                      return false;
                                  }
                                },
                                builder: (context, state) {
                                  return CustomTextFormFielWidget(
                                    onChanged: (value) {
                                      switch (index) {
                                        case 0:
                                          context.read<SignupBloc>().add(
                                              PasswordChangedSignUp(
                                                  password: value));
                                          break;
                                        case 1:
                                          context.read<SignupBloc>().add(
                                              ConfirmPasswordChangedSignUp(
                                                  confirmPassword: value));
                                          break;

                                        default:
                                      }
                                    },
                                    unFocus: focusNode,
                                    isFocused: isFocus,
                                    isOtp: false,
                                    controller: controller,
                                    iconDataPrefix: const Icon(
                                      Icons.private_connectivity,
                                      color: AppColors.onPrimary,
                                    ),
                                    label: label,
                                    errorText: _getErrorText(index, state) == ""
                                        ? null
                                        : _getErrorText(index, state),
                                    isPassword: index == 0
                                        ? _isPasswordVisible
                                        : index == 1
                                            ? _isConfirmPasswordVisible
                                            : false,
                                    isPasswordVisible: index == 0
                                        ? _isPasswordVisible
                                        : index == 1
                                            ? _isConfirmPasswordVisible
                                            : false,
                                    isTapPrefixIcon: index == 0
                                        ? _togglePasswordVisibility // Alternar visibilidad para "password"
                                        : index == 1
                                            ? _toggleConfirmPasswordVisibility // Alternar visibilidad para "confirm password"
                                            : null,
                                    iconDataSufix: index == 0
                                        ? _isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off
                                        : index == 1
                                            ? _isConfirmPasswordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off
                                            : null,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      BlocConsumer<SignupBloc, SignupState>(
                        listener: (context, state) {
                          switch (state.resetPasswordStatus) {
                            case ResetPasswordStatus.success:
                              context.go(NameRoutes.login);
                              break;

                            case ResetPasswordStatus.network:
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(AppText.networkError)),
                              );
                              break;
                            case ResetPasswordStatus.server:
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Estamos trabajando para mejorar tu experiencia")),
                              );
                              break;
                            case ResetPasswordStatus.userNotFound:
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Usuario icorrecot o no existe")),
                              );
                              break;
                            case ResetPasswordStatus.passwordNotEqual:
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Contraseñas no son iguales")),
                              );
                              break;

                            default:
                          }
                        },
                        builder: (BuildContext context, SignupState state) {
                          switch (state.resetPasswordStatus) {
                            case ResetPasswordStatus.loading:
                              return CustomButtonWidget(
                                onTap: () {},
                                title: AppText.loading,
                                width: size.width,
                              );
                            default:
                          }
                          return CustomButtonWidget(
                            onTap: () {
                              focusNodeUnFocus();
                              context
                                  .read<SignupBloc>()
                                  .add(const ForgotResquest());
                            },
                            title: AppText.validate,
                            width: size.width,
                          );
                        },
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

  String? _getErrorText(int index, SignupState state) {
    switch (index) {
      case 0:
        return state.passwordError;
      case 1:
        return state.confirmPasswordError;
      default:
        return null;
    }
  }
}
