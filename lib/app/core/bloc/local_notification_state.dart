part of 'local_notification_bloc.dart';

class LocalNotificationState extends Equatable {
  final LocalNotificationStatus localNotificationStatus;
  const LocalNotificationState({required this.localNotificationStatus});

  LocalNotificationState copyWith({
    LocalNotificationStatus? localNotificationStatus,
  }) =>
      LocalNotificationState(
        localNotificationStatus:
            localNotificationStatus ?? this.localNotificationStatus,
      );
  factory LocalNotificationState.initial() => const LocalNotificationState(
        localNotificationStatus: LocalNotificationStatus.initial,
      );

  @override
  List<Object> get props => [localNotificationStatus];
}

enum LocalNotificationStatus {
  initial,
  success,
  notificationPermissionGranted,
  notificationSent,
  notGranted,
  error,
}
