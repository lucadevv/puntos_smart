part of 'module_bloc.dart';

class ModuleState extends Equatable {
  final List<GeoPromotionsResponseEntity> listGeoPromotiosns;
  final GeoPromotionsStatus geoPromotionsStatus;
  final List<CategoryResponseEntity> listCategories;
  final CategoriesStatus categoriesStatus;
  final List<FlashPromotionsResponseEntity> listFlashPromotions;
  final FlashPromotionsStatus flashPromotionsStatus;
  final List<SurveryResponseEntity> listSurvey;
  final SurveysStatus surveysStatus;
  const ModuleState({
    required this.listGeoPromotiosns,
    required this.geoPromotionsStatus,
    required this.categoriesStatus,
    required this.listCategories,
    required this.flashPromotionsStatus,
    required this.listFlashPromotions,
    required this.listSurvey,
    required this.surveysStatus,
  });

  ModuleState copyWith({
    List<GeoPromotionsResponseEntity>? listGeoPromotiosns,
    GeoPromotionsStatus? geoPromotionsStatus,
    List<CategoryResponseEntity>? listCategories,
    CategoriesStatus? categoriesStatus,
    List<FlashPromotionsResponseEntity>? listFlashPromotions,
    FlashPromotionsStatus? flashPromotionsStatus,
    List<SurveryResponseEntity>? listSurvey,
    SurveysStatus? surveysStatus,
  }) =>
      ModuleState(
        listGeoPromotiosns: listGeoPromotiosns ?? this.listGeoPromotiosns,
        geoPromotionsStatus: geoPromotionsStatus ?? this.geoPromotionsStatus,
        listCategories: listCategories ?? this.listCategories,
        categoriesStatus: categoriesStatus ?? this.categoriesStatus,
        flashPromotionsStatus:
            flashPromotionsStatus ?? this.flashPromotionsStatus,
        listFlashPromotions: listFlashPromotions ?? this.listFlashPromotions,
        listSurvey: listSurvey ?? this.listSurvey,
        surveysStatus: surveysStatus ?? this.surveysStatus,
      );

  factory ModuleState.initial() => const ModuleState(
        listGeoPromotiosns: [],
        geoPromotionsStatus: GeoPromotionsStatus.inital,
        categoriesStatus: CategoriesStatus.inital,
        listCategories: [],
        flashPromotionsStatus: FlashPromotionsStatus.inital,
        listFlashPromotions: [],
        listSurvey: [],
        surveysStatus: SurveysStatus.inital,
      );
  @override
  List<Object> get props => [
        listGeoPromotiosns,
        geoPromotionsStatus,
        categoriesStatus,
        listCategories,
        flashPromotionsStatus,
        listFlashPromotions,
        listSurvey,
        surveysStatus
      ];
}

enum GeoPromotionsStatus {
  inital,
  loading,
  success,
  notFound,
  network,
  server,
  unknown,
}

enum CategoriesStatus {
  inital,
  loading,
  success,
  notFound,
  network,
  server,
  unknown,
}

enum FlashPromotionsStatus {
  inital,
  loading,
  success,
  notFound,
  network,
  server,
  unknown,
}

enum SurveysStatus {
  inital,
  loading,
  success,
  notFound,
  network,
  server,
  unknown,
}
