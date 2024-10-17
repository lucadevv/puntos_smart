import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:puntos_smart_user/app/api/local_notification_services/local_notification_services.dart';
import 'package:puntos_smart_user/app/api/services_token/token_storage_services.dart';
import 'package:puntos_smart_user/app/core/bloc/local_notification_bloc.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/bloc/signup_bloc/signup_bloc.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/repository/home_repository.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/bloc/home_bloc.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/pages/address_page/domain/repository/location_repository.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/pages/address_page/presentation/bloc/location/location_bloc.dart';
import 'package:puntos_smart_user/app/core/router/app_route.dart';
import 'package:puntos_smart_user/app/core/theme/app_theme.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/repositories/auth_repository.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/bloc/sigin_bloc/sign_in_bloc.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/cubit/cubit/send_number_cubit.dart';
import 'package:puntos_smart_user/app/injection.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final notificationService =
      LocalNotificationServices(flutterLocalNotificationsPlugin);
  await notificationService.initialize();
  const baseUrl = String.fromEnvironment('base_url');
  const baseUrlAutocomplete =
      String.fromEnvironment('base_url_place_autcomplete');
  setUpInyection(baseUrl: baseUrl, baseUrlAutocomplete: baseUrlAutocomplete);
  runApp(MyApp(
    localNotificationServices: notificationService,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key, required LocalNotificationServices localNotificationServices})
      : _localNotificationServices = localNotificationServices;
  final LocalNotificationServices _localNotificationServices;
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
          create: (_) => LocationBloc(
            locationRepository: GetIt.instance<LocationRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => SignInBloc(
            authRepository: GetIt.instance<AuthRepository>(),
            tokenStorageServices: GetIt.instance<TokenStorageServices>(),
            authBloc: BlocProvider.of<AuthBloc>(context),
          ),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => LocalNotificationBloc(
              localNotificationServices: _localNotificationServices)
            ..add(RequestNotificationPermissions()),
        ),
        BlocProvider(
          create: (context) => SendNumberCubit(
            authRepository: GetIt.instance<AuthRepository>(),
            localNotificationBloc:
                BlocProvider.of<LocalNotificationBloc>(context),
          ),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => SignupBloc(
            authRepository: GetIt.instance<AuthRepository>(),
            sendNumberCubit: BlocProvider.of<SendNumberCubit>(context),
          ),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => HomeBloc(
            homeRepository: GetIt.instance<HomeRepository>(),
          )
            ..add(GetAllModuleNoLoginEvent())
            ..add(GetAllBannersEvent())
            ..add(GetAllNewsEvent())
            ..add(GetAllFeaturedEvent()),
        )
      ],
      child: MaterialApp.router(
        routerConfig: appRoute,
        title: 'Puntos Smart',
        theme: AppTheme.lighTheme(),
      ),
    );
  }
}
