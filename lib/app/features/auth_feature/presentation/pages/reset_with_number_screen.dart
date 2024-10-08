import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:puntos_smart_user/app/core/constants/app_images.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/core/physics/custom_scroll_physics.dart';

import 'package:puntos_smart_user/app/core/widgets/custom_arrow_back.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/widgets/custom_button_widget.dart';
import 'package:puntos_smart_user/app/features/store_feature/presentation/widgets/customt_extformfield_widget.dart';

class ResetWithNumberScreen extends StatefulWidget {
  const ResetWithNumberScreen({super.key});

  @override
  State<ResetWithNumberScreen> createState() => _ResetWithNumberScreenState();
}

class _ResetWithNumberScreenState extends State<ResetWithNumberScreen> {
  final listLabel = [AppText.numberPhone];
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
    for (int i = 0; i < listLabel.length; i++) {
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
                        AppImages.resetScreen1,
                      ),
                      Text(
                        AppText.youForgotYourPassword,
                        style: textTheme.titleLarge!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        AppText.resetWithNumberSubtitle,
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
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: CustomTextFormFielWidget(
                            unFocus: focusNode,
                            isFocused: isFocus,
                            isPhone: true,
                            controller: controller,
                            iconDataPrefix: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CountryFlag.fromCountryCode(
                                    'PE',
                                    height: 30,
                                    width: 30,
                                    shape: const RoundedRectangle(3),
                                  ),
                                ],
                              ),
                            ),
                            // iconDataPrefix: Icon(Icons.phone),
                            label: label,
                          ),
                        );
                      })),
                      CustomButtonWidget(
                        onTap: () {
                          context.push(NameRoutes.resetScreen);
                          focusNodeUnFocus();
                        },
                        title: AppText.next,
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
