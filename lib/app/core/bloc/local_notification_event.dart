part of 'local_notification_bloc.dart';

class LocalNotificationEvent extends Equatable {
  const LocalNotificationEvent();

  @override
  List<Object> get props => [];
}

class RequestNotificationPermissions extends LocalNotificationEvent {}

class SendLocalNotification extends LocalNotificationEvent {
  final String id;
  final String title;
  final String body;

  const SendLocalNotification({
    required this.title,
    required this.body,
    required this.id,
  });

  @override
  List<Object> get props => [title, body, id];
}
