abstract class CurrentLocationResult {}

class CurrentLocationSuccess extends CurrentLocationResult {}

class CurrentLocationFailure extends CurrentLocationResult {}

enum CurrentLocationFailureStatus {
  notFound,
  network,
}
