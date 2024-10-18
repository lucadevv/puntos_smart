import '../../entities/response/module/survey_response_entity.dart';

abstract class SurveyResult {}

class SurveySuccess implements SurveyResult {
  final List<SurveryResponseEntity> listSurvey;

  SurveySuccess({required this.listSurvey});
}

class SurveyFailure implements SurveyResult {
  final SurveyFailureStatus failureStatus;

  SurveyFailure({required this.failureStatus});
}

enum SurveyFailureStatus {
  network,
  notFound,
  server,
  unknown,
}
