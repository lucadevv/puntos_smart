import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class LocalNotificationServices {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  LocalNotificationServices(this.flutterLocalNotificationsPlugin);

  Future<void> initialize() async {
    // Configuraciones para Android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
      "@mipmap/app_icon",
    ); // Nombre del ícono de notificación.

    // Configuraciones para iOS
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {
        print("Notificación recibida en primer plano: $title");
        // Aquí puedes manejar la lógica cuando se recibe una notificación local en iOS en primer plano.
      },
    );

    // Configuraciones para ambos sistemas operativos
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    // Inicialización del plugin
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {
        // Lógica para manejar la interacción del usuario con la notificación.
        print("Notificación interactuada: ${notificationResponse.payload}");
      },
    );

    // Solicitud de permisos para notificaciones en Android 13+ y iOS
    if (await Permission.notification.isDenied) {
      PermissionStatus status = await Permission.notification.request();
      if (status.isGranted) {
        print("Permiso de notificación concedido.");
      } else {
        print("Permiso de notificación denegado.");
      }
    }
  }

  // Método para mostrar una notificación instantánea
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    // Detalles específicos para Android
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'high_importance_channel', // Canal ID único
      'High Importance Notifications', // Nombre del canal
      channelDescription: 'This channel is used for important notifications.',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
      icon: "@mipmap/app_icon", // Ícono de la notificación
      channelShowBadge: true, // Muestra el ícono de la app con el badge
      largeIcon: DrawableResourceAndroidBitmap(
        "@mipmap/app_icon",
      ), // Ícono grande
    );

    // Detalles específicos para iOS
    const DarwinNotificationDetails iosPlatformChannelSpecifics =
        DarwinNotificationDetails(
      presentAlert: true, // Mostrar alerta
      presentBadge: true, // Mostrar badge
      presentSound: true, // Reproducir sonido
    );

    // Configuraciones de la notificación para ambas plataformas
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosPlatformChannelSpecifics,
    );

    // Envío de la notificación
    print(title);
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
    );
  }

  // Método para mostrar una notificación periódica
  Future<void> showPeriodicNotification({
    required int id,
    required String title,
    required String body,
    RepeatInterval repeatInterval = RepeatInterval.everyMinute,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      channelDescription: 'This channel is used for important notifications.',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
      icon: "app_icon",
    );

    const DarwinNotificationDetails iosPlatformChannelSpecifics =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosPlatformChannelSpecifics,
    );

    // Envío de la notificación periódica
    await flutterLocalNotificationsPlugin.periodicallyShow(
      id,
      title,
      body,
      repeatInterval,
      platformChannelSpecifics,
    );
  }

  // Método para cancelar una notificación periódica
  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
