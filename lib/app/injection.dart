import 'package:get_it/get_it.dart';
import 'package:puntos_smart_user/app/api/network/api_client.dart';
import 'package:puntos_smart_user/app/api/services_token/token_storage_services.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/datasource/auth_datasource_ntw.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/repositories/auth_repository_impl.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/repositories/auth_repository.dart';

final getIt = GetIt.instance;

void setUpInyection({required String baseUrl}) {
  getIt.registerLazySingleton<TokenStorageServices>(
      () => TokenStorageServices());
  getIt.registerLazySingleton<ApiClient>(
    () => ApiClient(
      baseUrl: baseUrl,
      tokenStorageService: getIt<TokenStorageServices>(),
    ),
  );

  //AUTH

  getIt.registerLazySingleton<AuthDatasourceNtw>(
      () => AuthDatasourceNtw(apiClient: getIt<ApiClient>()));
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(datasourceNtw: getIt<AuthDatasourceNtw>()));
}
