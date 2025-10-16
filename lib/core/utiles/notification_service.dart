import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future<bool> init() async {
    try {
      tz.initializeTimeZones();
      tz.setLocalLocation(tz.getLocation('Africa/Cairo'));

      const android = AndroidInitializationSettings('@mipmap/launcher_icon');
      const settings = InitializationSettings(android: android);

      await _notifications.initialize(
        settings,
        onDidReceiveNotificationResponse: _onNotificationTap,
      );

      final androidImpl =
          _notifications
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >();

      final notificationPermission =
          await androidImpl?.requestNotificationsPermission() ?? false;

      final alarmPermission =
          await androidImpl?.requestExactAlarmsPermission() ?? false;

      if (!notificationPermission) {
        debugPrint('⚠️ Notification permission denied');
        return false;
      }

      if (!alarmPermission) {
        debugPrint('⚠️ Exact alarm permission denied');
      }

      debugPrint('✅ Notifications initialized successfully');
      return true;
    } catch (e) {
      debugPrint('❌ Error initializing notifications: $e');
      return false;
    }
  }

  static void _onNotificationTap(NotificationResponse response) {
    debugPrint('Notification tapped: ${response.payload}');

    final payload = response.payload;

    if (payload == 'offers_page') {
      debugPrint('Navigate to offers page');
    } else if (payload == 'products_page') {
      debugPrint('Navigate to products page');
    }
  }

  static Future<void> scheduleDailyNotification() async {
    const androidDetails = AndroidNotificationDetails(
      'daily_reminder_channel',
      'تذكيرات يومية',
      channelDescription: 'إشعارات يومية للمنتجات والعروض',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
      // largeIcon: DrawableResourceAndroidBitmap(
      //   '@mipmap/launcher_icon',
      // ),
    );

    const details = NotificationDetails(android: androidDetails);

    final now = tz.TZDateTime.now(tz.local);

    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      22,
      0,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    try {
      await _notifications.zonedSchedule(
        1,
        '🛍️ عروض حصرية بتستناك!',
        'شوف أحدث المنتجات والعروض المميزة دلوقتي 🎁',
        scheduledDate,
        details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,

        matchDateTimeComponents: DateTimeComponents.time,
        payload: 'offers_page',
      );

      debugPrint('✅ Daily notification scheduled at 8:00 PM');
      debugPrint('📅 Next notification: $scheduledDate');
    } catch (e) {
      debugPrint('❌ Error scheduling daily notification: $e');
    }
  }

  static Future<void> scheduleTestNotification() async {
    const androidDetails = AndroidNotificationDetails(
      'test_channel_id',
      'إشعارات تجريبية',
      channelDescription: 'للاختبار فقط - كل دقيقة',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
      // largeIcon: DrawableResourceAndroidBitmap(
      //   '@mipmap/launcher_icon',
      // ),
    );

    const details = NotificationDetails(android: androidDetails);

    try {
      await _notifications.periodicallyShow(
        0,
        '🧪 اختبار - عروض حصرية!',
        'شوف أحدث المنتجات والعروض المميزة دلوقتي 🎁',
        RepeatInterval.hourly,
        details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: 'offers_page',
      );

      debugPrint('✅ Test notification scheduled (every minute)');
    } catch (e) {
      debugPrint('❌ Error scheduling test notification: $e');
    }
  }

  static Future<void> cancelTestNotification() async {
    await _notifications.cancel(0);
    debugPrint('🚫 Test notification cancelled');
  }

  static Future<void> cancelDailyNotification() async {
    await _notifications.cancel(1);
    debugPrint('🚫 Daily notification cancelled');
  }

  static Future<void> cancelAll() async {
    await _notifications.cancelAll();
    debugPrint('🚫 All notifications cancelled');
  }

  static Future<void> showInstantNotification() async {
    const androidDetails = AndroidNotificationDetails(
      'instant_channel',
      'إشعارات فورية',
      channelDescription: 'إشعارات فورية للاختبار',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
      // largeIcon: DrawableResourceAndroidBitmap(
      //   '@mipmap/launcher_icon',
      // ),
    );

    const details = NotificationDetails(android: androidDetails);

    await _notifications.show(
      99,
      '🎉 مرحباً بك!',
      'شوف أحدث المنتجات والعروض الحصرية 🛍️',
      details,
    );

    debugPrint('✅ Instant notification shown');
  }

  static Future<List<PendingNotificationRequest>>
  getPendingNotifications() async {
    final pending = await _notifications.pendingNotificationRequests();
    debugPrint('📋 Pending notifications: ${pending.length}');
    for (var notification in pending) {
      debugPrint('  - ID: ${notification.id}, Title: ${notification.title}');
    }
    return pending;
  }
}
