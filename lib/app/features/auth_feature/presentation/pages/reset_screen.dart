import 'package:flutter/material.dart';

import 'package:puntos_smart_user/app/core/constants/app_images.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/physics/custom_scroll_physics.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

import 'package:puntos_smart_user/app/core/widgets/custom_arrow_back.dart';
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
                              child: CustomTextFormFielWidget(
                                unFocus: focusNode,
                                isFocused: isFocus,
                                isOtp: false,
                                controller: controller,
                                iconDataPrefix: const Icon(
                                  Icons.private_connectivity,
                                  color: AppColors.onPrimary,
                                ),
                                label: label,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomButtonWidget(
                        onTap: () {
                          focusNodeUnFocus();
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
