import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/bloc/sigin_bloc/sign_in_bloc.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/widgets/custom_button_widget.dart';

class SliverHeaderHomeWidget extends StatefulWidget {
  const SliverHeaderHomeWidget({
    super.key,
    this.index = 1,
  });
  final int? index;
  @override
  State<SliverHeaderHomeWidget> createState() => _SliverHeaderHomeWidgetState();
}

class _SliverHeaderHomeWidgetState extends State<SliverHeaderHomeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> _leftImageAnimation;
  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 450),
      vsync: this,
    );
    super.initState();
    _leftImageAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );
    Future.delayed(const Duration(milliseconds: 450), () {
      if (mounted) {
        animationController.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return SliverToBoxAdapter(
      child: SlideTransition(
        position: _leftImageAnimation,
        child: Container(
          height: 80,
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppText.welcomeSmarter,
                    style: textTheme.titleLarge!.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    AppText.welcomeSmarter2,
                    style: textTheme.headlineLarge!.copyWith(
                      color: AppColors.onPrimary,
                      fontFamily: 'Bungee',
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CustomButtonWidget(
                onTap: () {
                  context.read<SignInBloc>().add(LoadSavedCredentials());
                  context.push(NameRoutes.login);
                },
                title: AppText.login,
                width: 140,
              )
            ],
          ),
        ),
      ),
    );
  }
}
