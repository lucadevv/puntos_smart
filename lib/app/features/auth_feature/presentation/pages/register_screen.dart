import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

import 'package:puntos_smart_user/app/core/widgets/custom_arrow_back.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/bloc/signup_bloc/signup_bloc.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/widgets/custom_button_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/store_detail/presentation/widgets/customt_extformfield_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final listLabel = [
    AppText.name,
    AppText.mail,
    AppText.password,
    AppText.confirmPassword,
    AppText.referenceCode,
  ];
  final listIcon = [
    Icons.person,
    Icons.mail,
    Icons.private_connectivity,
    Icons.private_connectivity,
    Icons.code,
  ];
  final List<FocusNode> _focusNodes = [];
  final List<bool> _isFocused = [];
  final List<TextEditingController> _controllers = [];
  late ScrollController scrollController;

  // Variables booleanas separadas para cada campo de contraseña
  bool _isPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    focusNodeListners();
  }

  void focusNodeListners() {
    for (int i = 0; i < listLabel.length; i++) {
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
                physics: const ClampingScrollPhysics(),
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
                        AppText.registerSubTitle,
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
                            child: BlocBuilder<SignupBloc, SignupState>(
                              buildWhen: (previous, current) {
                                switch (index) {
                                  case 0:
                                    return previous.userName !=
                                            current.userName ||
                                        previous.userNameError !=
                                            current.userNameError;
                                  case 1:
                                    return previous.mail != current.mail ||
                                        previous.mailError != current.mailError;
                                  case 2:
                                    return previous.password !=
                                            current.password ||
                                        previous.passwordError !=
                                            current.passwordError;
                                  case 3:
                                    return previous.confirmPassword !=
                                            current.confirmPassword ||
                                        previous.confirmPasswordError !=
                                            current.confirmPasswordError;
                                  case 4:
                                    return previous.referenceCode !=
                                        current.referenceCode;
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
                                            UserNameChangedSignUp(
                                                userName: value));
                                        break;
                                      case 1:
                                        context.read<SignupBloc>().add(
                                            MailChangedSignUp(mail: value));
                                        break;
                                      case 2:
                                        context.read<SignupBloc>().add(
                                            PasswordChangedSignUp(
                                                password: value));
                                        break;
                                      case 3:
                                        context.read<SignupBloc>().add(
                                            ConfirmPasswordChangedSignUp(
                                                confirmPassword: value));
                                        break;
                                      case 4:
                                        context
                                            .read<SignupBloc>()
                                            .add(ReferCodeChangedSignUp(value));
                                        break;
                                      default:
                                    }
                                  },
                                  unFocus: focusNode,
                                  isFocused: isFocus,
                                  isPassword: index == 2
                                      ? _isPasswordVisible
                                      : index == 3
                                          ? _isConfirmPasswordVisible
                                          : false,
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
                                  errorText: _getErrorText(index, state) == ""
                                      ? null
                                      : _getErrorText(index, state),
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
                                );
                              },
                            ),
                          );
                        }),
                      ),
                      Row(
                        children: [
                          BlocSelector<SignupBloc, SignupState, bool>(
                            selector: (state) => state.termnsAndConditions,
                            builder: (context, state) {
                              return Checkbox(
                                activeColor: AppColors.onPrimary,
                                checkColor: Colors.white,
                                value: state,
                                onChanged: (value) {
                                  context.read<SignupBloc>().add(
                                      TermsCondsChangedSignUp(terms: value!));
                                },
                              );
                            },
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
                      BlocConsumer<SignupBloc, SignupState>(
                        listener: (context, state) {
                          switch (state.signUpStatus) {
                            case SignUpStatus.success:
                              context.go(NameRoutes.login);
                              break;
                            case SignUpStatus.termsNotAccepted:
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                  'Acepte terminos y condiciciones',
                                )),
                              );
                              break;
                            case SignUpStatus.passwordNotEqual:
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                  'Contraseñas no son iguales',
                                )),
                              );
                              break;
                            case SignUpStatus.network:
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(AppText.networkError)),
                              );
                              break;
                            case SignUpStatus.userExist:
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Nombre de usuario ya existe"),
                                ),
                              );
                              break;
                            case SignUpStatus.emailAlreadyInUse:
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("El correo ya esta registrado")),
                              );
                              break;
                            case SignUpStatus.userRegister:
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Registro invalido")),
                              );
                              Future.delayed(const Duration(seconds: 1))
                                  .then((_) {
                                context.go(NameRoutes.login);
                              });
                              break;
                            default:
                          }
                        },
                        builder: (BuildContext context, SignupState state) {
                          switch (state.signUpStatus) {
                            case SignUpStatus.loading:
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
                                  .add(const SignUpResquest());
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
        return state.userNameError;
      case 1:
        return state.mailError;
      case 2:
        return state.passwordError;
      case 3:
        return state.confirmPasswordError;
      default:
        return null;
    }
  }
}
