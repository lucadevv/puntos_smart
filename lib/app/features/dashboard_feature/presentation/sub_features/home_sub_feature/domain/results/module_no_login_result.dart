import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/entities/response/module_no_login_entity.dart';

abstract class ModuleNoLoginResult {}

class ModuleNoLoginSuccess implements ModuleNoLoginResult {
  final List<ModuleNoLoginEntity> moduleNoLoginEntity;

  ModuleNoLoginSuccess({required this.moduleNoLoginEntity});
}

class ModuleNoLoginFailure implements ModuleNoLoginResult {
  final ModuleNoLoginFailureStatus moduleNoLoginFailureStatus;

  ModuleNoLoginFailure({required this.moduleNoLoginFailureStatus});
}

enum ModuleNoLoginFailureStatus {
  network,
  notFound,
  server,
  unknown,
}
