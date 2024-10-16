import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:puntos_smart_user/app/core/constants/app_images.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/bloc/sigin_bloc/sign_in_bloc.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/widgets/custom_button_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/store_detail/presentation/widgets/customt_extformfield_widget.dart';
import 'widgets/custom_button_widget_social.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _listLabe = [
    AppText.numberPhone,
    AppText.password,
  ];

  final _listIcon = [Icons.phone, Iconsax.check];
  final List<FocusNode> _focusNodes = [];
  final List<bool> _isFocused = [];

  final List<TextEditingController> _controllers = [];
  bool _isPasswordVisible = true;

  @override
  void initState() {
    super.initState();
    generateTextEditingController();
    context.read<SignInBloc>().add(LoadSavedCredentials());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = context.read<SignInBloc>().state;
      _controllers[0].text = state.phone;
      _controllers[1].text = state.password;
    });
  }

  void generateTextEditingController() {
    for (int i = 0; i < _listLabe.length; i++) {
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

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.unfocus();
          }
        },
        behavior: HitTestBehavior.opaque,
        child: Scaffold(
          backgroundColor: AppColors.onPrimary,
          body: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: size.height,
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: size.height * 0.8,
                        width: size.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 24),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              AppText.welcome,
                              style: textTheme.titleMedium!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              AppText.puntosSmart,
                              style: textTheme.headlineLarge!.copyWith(
                                color: AppColors.onSecondary,
                                fontFamily: 'Bungee',
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              AppText.loginIntoToContinue,
                              style: textTheme.titleMedium!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: List.generate(
                                  _listLabe.length,
                                  (index) {
                                    final focusNode = _focusNodes[index];
                                    final isFocus = _isFocused[index];
                                    final label = _listLabe[index];
                                    final icon = _listIcon[index];
                                    final controller = _controllers[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                              horizontal: 0)
                                          .copyWith(
                                        bottom: 16,
                                      ),
                                      child:
                                          BlocBuilder<SignInBloc, SignInState>(
                                        buildWhen: (previous, current) {
                                          switch (index) {
                                            case 0:
                                              return previous.phone !=
                                                      current.phone ||
                                                  previous.errorPhone !=
                                                      current.errorPhone;
                                            case 1:
                                              return previous.password !=
                                                  current.password;
                                            default:
                                              return false;
                                          }
                                        },
                                        builder: (context, state) {
                                          return CustomTextFormFielWidget(
                                            unFocus: focusNode,
                                            isFocused: isFocus,
                                            controller: controller,
                                            label: label,
                                            isPhone: index == 0 ? true : false,
                                            isPassword: index == 1
                                                ? _isPasswordVisible
                                                : false,
                                            iconDataPrefix: Icon(
                                              icon,
                                              color: AppColors.onPrimary,
                                            ),
                                            isPasswordVisible: index == 1
                                                ? _isPasswordVisible
                                                : null,
                                            isTapPrefixIcon: index == 1
                                                ? _togglePasswordVisibility
                                                : null,
                                            iconDataSufix: index == 1
                                                ? _isPasswordVisible
                                                    ? Icons.visibility
                                                    : Icons.visibility_off
                                                : null,
                                            errorText: _getErrorText(
                                                        index, state) ==
                                                    ""
                                                ? null
                                                : _getErrorText(index, state),
                                            onChanged: (value) {
                                              if (index == 0) {
                                                context.read<SignInBloc>().add(
                                                    SignInPhoneNumberChanged(
                                                        number: value));
                                              } else if (index == 1) {
                                                context.read<SignInBloc>().add(
                                                    SignInPasswordChanged(
                                                        password: value));
                                              }
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                BlocBuilder<SignInBloc, SignInState>(
                                  builder: (context, state) {
                                    return Checkbox(
                                      value: state.rememberCheck,
                                      onChanged: (value) {
                                        context.read<SignInBloc>().add(
                                            SignInTermsChanged(
                                                rememberCheck: value!));
                                      },
                                    );
                                  },
                                ),
                                Text(
                                  AppText.remember,
                                  style: textTheme.bodySmall!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Material(
                                  color: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  surfaceTintColor: Colors.amber,
                                  child: InkWell(
                                    onTap: () {
                                      context.push(
                                          NameRoutes.resetScreenWithNumber);
                                    },
                                    splashColor:
                                        AppColors.onPrimary.withOpacity(0.2),
                                    child: Text(
                                      AppText.youForgotYourPassword,
                                      style: textTheme.bodySmall!.copyWith(
                                        color: AppColors.onPrimary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            BlocConsumer<SignInBloc, SignInState>(
                              listener: (context, state) {
                                if (state.signInStatus ==
                                    SignInStatus.success) {
                                  context.go(NameRoutes.homeScreen);
                                } else if (state.signInStatus ==
                                    SignInStatus.invalidCredentials) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text(AppText.invalidCredentials)),
                                  );
                                } else if (state.signInStatus ==
                                    SignInStatus.networkError) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(AppText.networkError)),
                                  );
                                } else if (state.signInStatus ==
                                    SignInStatus.failure) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(AppText.serverError)),
                                  );
                                }
                              },
                              builder: (context, state) {
                                if (state.signInStatus ==
                                    SignInStatus.loading) {
                                  return CustomButtonWidget(
                                    onTap: () {},
                                    title: 'Cargando ...',
                                    width: size.width,
                                  );
                                }

                                return CustomButtonWidget(
                                  onTap: () {
                                    context
                                        .read<SignInBloc>()
                                        .add(const SignInRequested());
                                  },
                                  title: AppText.login,
                                  width: size.width,
                                );
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomButtonWidgetSocial(
                              onTap: () {
                                //AppImages.apple,
                              },
                              title: 'Inicia sesión con Google',
                              width: size.width,
                              image: AppImages.google,
                            ),
                            const SizedBox(height: 8),
                            CustomButtonWidgetSocial(
                              onTap: () {
                                //AppImages.apple,
                              },
                              title: 'Inicia sesión con Apple',
                              width: size.width,
                              image: AppImages.apple,
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppText.youDontHaveAnAccountYet,
                                  style: textTheme.bodySmall!.copyWith(
                                    color: AppColors.ligthcolort, //surface
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Material(
                                  color: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  surfaceTintColor: Colors.amber,
                                  child: InkWell(
                                    onTap: () {
                                      context
                                          .push(NameRoutes.registerWithNumber);
                                    },
                                    splashColor:
                                        AppColors.onPrimary.withOpacity(0.2),
                                    child: Text(
                                      AppText.register,
                                      style: textTheme.bodySmall!.copyWith(
                                        color: AppColors.onPrimary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  String? _getErrorText(int index, SignInState state) {
    switch (index) {
      case 0:
        return state.errorPhone;
      default:
        return null;
    }
  }
}
