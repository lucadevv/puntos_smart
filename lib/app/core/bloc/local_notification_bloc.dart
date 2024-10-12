import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:puntos_smart_user/app/api/local_notification_services/local_notification_services.dart';

part 'local_notification_event.dart';
part 'local_notification_state.dart';

class LocalNotificationBloc
    extends Bloc<LocalNotificationEvent, LocalNotificationState> {
  final LocalNotificationServices _localNotificationServices;
  LocalNotificationBloc(
      {required LocalNotificationServices localNotificationServices})
      : _localNotificationServices = localNotificationServices,
        super(LocalNotificationState.initial()) {
    on<RequestNotificationPermissions>(_requestNotificationPermissions);

    on<SendLocalNotification>(_sendLocalNotification);
  }

  Future<void> _requestNotificationPermissions(
      RequestNotificationPermissions event,
      Emitter<LocalNotificationState> emit) async {
    await _localNotificationServices.initialize();

    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }

    final iosDetails = _localNotificationServices
        .flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>();

    if (iosDetails != null) {
      await iosDetails.requestPermissions(
          alert: true, badge: true, sound: true);
    }
    if (await Permission.notification.isGranted) {
      emit(
        state.copyWith(
          localNotificationStatus:
              LocalNotificationStatus.notificationPermissionGranted,
        ),
      );
    } else {
      emit(
        state.copyWith(
            localNotificationStatus: LocalNotificationStatus.notGranted),
      );
    }
  }

  Future<void> _sendLocalNotification(
      SendLocalNotification event, Emitter<LocalNotificationState> emit) async {
    try {
      await _localNotificationServices.showNotification(
        id: int.parse(event.id),
        title: event.title,
        body: event.body,
      );
      emit(state.copyWith(
          localNotificationStatus: LocalNotificationStatus.success));
    } catch (e) {
      emit(state.copyWith(
          localNotificationStatus: LocalNotificationStatus.error));
    }
  }
}
