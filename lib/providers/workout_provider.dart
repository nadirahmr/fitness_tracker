import 'package:fitness_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class WorkoutProvider with ChangeNotifier {
  List<String> _workouts = [];

  List<String> get workouts => _workouts;

  void addWorkout(String workout) {
    _workouts.add(workout);
    notifyListeners();
    _showNotification(workout);
  }

  void _showNotification(String workout) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'fitness_tracker_channel_id', 'Fitness Tracker',
            importance: Importance.max, priority: Priority.high);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'New Workout Added',
      workout,
      platformChannelSpecifics,
    );
  }

  void removeWorkout(int index) {
    _workouts.removeAt(index);
    notifyListeners();
  }
}
