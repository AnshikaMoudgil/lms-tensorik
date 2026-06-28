import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'notification_service.dart';

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

class NotificationsEnabledNotifier extends Notifier<bool> {
  static const _prefsKey = 'notifications_enabled';

  @override
  bool build() {
    _loadState();
    return true; // default ON
  }

  Future<void> _loadState() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool(_prefsKey) ?? true; // default ON
  }

  Future<void> toggle(bool isEnabled) async {
    state = isEnabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefsKey, isEnabled);

    final service = ref.read(notificationServiceProvider);

    if (isEnabled) {
      await service.requestPermissions();
      await service.subscribeToTopics();
      await service.scheduleDailyReminder();
      await service.scheduleWeeklySummary();
    } else {
      await service.unsubscribeFromTopics();
      await service.cancelAllNotifications();
    }
  }
}

final notificationsEnabledProvider = NotifierProvider<NotificationsEnabledNotifier, bool>(() {
  return NotificationsEnabledNotifier();
});
