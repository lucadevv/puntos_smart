import '../../entities/response/module/flash_promotions_response_entity.dart';

abstract class FlashPromotionsResult {}

class FlashPromotionsSuccess implements FlashPromotionsResult {
  final List<FlashPromotionsResponseEntity> listFlashPromotions;

  FlashPromotionsSuccess({required this.listFlashPromotions});
}

class FlashPromotionsFailure implements FlashPromotionsResult {
  final FlashPromotionsFailureStatus flashPromotionsFailureStatus;

  FlashPromotionsFailure({required this.flashPromotionsFailureStatus});
}

enum FlashPromotionsFailureStatus {
  network,
  notFound,
  server,
  unknown,
}
