import 'package:get_it/get_it.dart';
import 'package:puntos_smart_user/app/api/network/api_client.dart';
import 'package:puntos_smart_user/app/api/services_token/token_storage_services.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/datasource/auth_datasource_ntw.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/repositories/auth_repository_impl.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/repositories/auth_repository.dart';
import 'package:puntos_smart_user/app/features/home_feature/data/datasource/home_datasource_ntw.dart';
import 'package:puntos_smart_user/app/features/home_feature/data/repository/home_repository_impl.dart';
import 'package:puntos_smart_user/app/features/home_feature/domain/repository/home_repository.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/data/datasource/location_datasource_ntw.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/data/repository/location_respository_impl.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/domain/repository/location_repository.dart';

final getIt = GetIt.instance;

void setUpInyection(
    {required String baseUrl, required String baseUrlAutocomplete}) {
  /*
  ------------------------API CLIENT---------------------
   */
  getIt.registerLazySingleton<TokenStorageServices>(
      () => TokenStorageServices());
  getIt.registerLazySingleton<ApiClient>(
    () => ApiClient(
      baseUrl: baseUrl,
      tokenStorageService: getIt<TokenStorageServices>(),
    ),
  );

  getIt.registerLazySingleton<ApiClient>(
    instanceName: 'placesClient', // Nombre único para esta instancia
    () => ApiClient(
      baseUrl: baseUrlAutocomplete, // Otro baseUrl
      tokenStorageService: getIt<TokenStorageServices>(),
    ),
  );

  /*
  ------------------------AUTH---------------------
   */

  getIt.registerLazySingleton<AuthDatasourceNtw>(
      () => AuthDatasourceNtw(apiClient: getIt<ApiClient>()));
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(datasourceNtw: getIt<AuthDatasourceNtw>()));

  /*
  ------------------------LOCATION---------------------
   */

  getIt.registerLazySingleton<LocationDatasourceNtw>(() =>
      LocationDatasourceNtw(
          apiClient: getIt<ApiClient>(instanceName: "placesClient")));
  getIt.registerLazySingleton<LocationRepository>(() => LocationRespositoryImpl(
      locationDatasourceNtw: getIt<LocationDatasourceNtw>()));

  /*
  ------------------------HOME ---------------------
   */

  getIt.registerLazySingleton<HomeDatasourceNtw>(
      () => HomeDatasourceNtw(apiClient: getIt<ApiClient>()));
  getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(homeDatasourceNtw: getIt<HomeDatasourceNtw>()));
}
