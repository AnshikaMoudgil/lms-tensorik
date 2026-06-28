import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialization
  Future<void> init() async {
    // 1. Request permissions for iOS and Android 13+
    await requestPermissions();

    // 2. Initialize Local Notifications
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidInit);

    await _localNotificationsPlugin.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: (details) {
        debugPrint('Notification clicked: ${details.payload}');
      },
    );

    // 3. Setup Firebase Messaging Foreground Handler
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Got a message whilst in the foreground!');
      debugPrint('Message data: ${message.data}');

      if (message.notification != null) {
        _showForegroundNotification(message);
      }
    });
  }

  Future<void> requestPermissions() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // For Android 13+ Local Notifications permission
    await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  // --- Push Notifications (FCM) ---

  Future<void> subscribeToTopics() async {
    await _firebaseMessaging.subscribeToTopic('all_users');
    debugPrint('Subscribed to all_users topic');
  }

  Future<void> unsubscribeFromTopics() async {
    await _firebaseMessaging.unsubscribeFromTopic('all_users');
    debugPrint('Unsubscribed from all_users topic');
  }

  Future<void> _showForegroundNotification(RemoteMessage message) async {
    const androidDetails = AndroidNotificationDetails(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.max,
      priority: Priority.high,
    );
    const notificationDetails = NotificationDetails(android: androidDetails);

    await _localNotificationsPlugin.show(
      id: message.hashCode,
      title: message.notification?.title,
      body: message.notification?.body,
      notificationDetails: notificationDetails,
      payload: message.data.toString(),
    );
  }

  // --- Local Scheduled Notifications ---

  Future<void> scheduleDailyReminder() async {
    // Cancel first to avoid duplicates
    await _localNotificationsPlugin.cancel(id: 100);

    const androidDetails = AndroidNotificationDetails(
      'daily_reminders',
      'Daily Reminders',
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
    );

    final now = tz.TZDateTime.now(tz.local);
    // Schedule for 9:00 AM every day
    var scheduledDate = tz.TZDateTime(
      tz.local, now.year, now.month, now.day, 9, 0,
    );
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await _localNotificationsPlugin.zonedSchedule(
      id: 100,
      title: 'Daily Learning Reminder',
      body: 'Continue learning your course.',
      scheduledDate: scheduledDate,
      notificationDetails: const NotificationDetails(android: androidDetails),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
    debugPrint('Daily reminder scheduled for $scheduledDate');
  }

  Future<void> scheduleWeeklySummary() async {
    await _localNotificationsPlugin.cancel(id: 101);

    const androidDetails = AndroidNotificationDetails(
      'weekly_summary',
      'Weekly Summary',
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
    );

    final now = tz.TZDateTime.now(tz.local);
    // Schedule for Sunday 10:00 AM
    var scheduledDate = tz.TZDateTime(
      tz.local, now.year, now.month, now.day, 10, 0,
    );
    while (scheduledDate.weekday != DateTime.sunday) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 7));
    }

    await _localNotificationsPlugin.zonedSchedule(
      id: 101,
      title: 'Weekly Progress Summary',
      body: 'Check out how much you learned this week!',
      scheduledDate: scheduledDate,
      notificationDetails: const NotificationDetails(android: androidDetails),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );
    debugPrint('Weekly summary scheduled for $scheduledDate');
  }

  // --- Triggered Notifications ---

  Future<void> showQuizAvailableNotification(String courseName) async {
    const androidDetails = AndroidNotificationDetails(
      'quiz_channel',
      'Quiz Notifications',
      importance: Importance.high,
      priority: Priority.high,
    );

    await _localNotificationsPlugin.show(
      id: 200, // Unique ID for quizzes
      title: 'Quiz Available!',
      body: 'A new quiz is ready for $courseName. Test your knowledge now!',
      notificationDetails: const NotificationDetails(android: androidDetails),
    );
  }

  Future<void> cancelAllNotifications() async {
    await _localNotificationsPlugin.cancelAll();
    debugPrint('All local notifications canceled');
  }
}
