import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:puntos_smart_user/app/api/services_token/token_storage_services.dart';
import 'package:puntos_smart_user/app/core/bloc/location/location_bloc.dart';
import 'package:puntos_smart_user/app/core/router/app_route.dart';
import 'package:puntos_smart_user/app/core/theme/app_theme.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/repositories/auth_repository.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/bloc/sigin_bloc/sign_in_bloc.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/cubit/cubit/send_number_cubit.dart';
import 'package:puntos_smart_user/app/injection.dart';

void main() async {
  const baseUrl = String.fromEnvironment('base_url');
  setUpInyection(baseUrl: baseUrl);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
              tokenStorageService: GetIt.instance<TokenStorageServices>())
            ..add(CheckAuthStatus()),
        ),
        BlocProvider(
          lazy: false,
          create: (_) => LocationBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(
            authRepository: GetIt.instance<AuthRepository>(),
            tokenStorageServices: GetIt.instance<TokenStorageServices>(),
            authBloc: BlocProvider.of<AuthBloc>(context),
          ),
        ),
        BlocProvider(
          create: (context) => SendNumberCubit(
            authRepository: GetIt.instance<AuthRepository>(),
          ),
          lazy: false,
        ),
      ],
      child: MaterialApp.router(
        routerConfig: appRoute,
        title: 'Puntos Smart',
        theme: AppTheme.lighTheme(),
      ),
    );
  }
}
