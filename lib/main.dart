import 'package:flutter/material.dart';
import 'package:pet_pass/core/utiles/service_locator.dart';
import 'package:pet_pass/my_app.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // WidgetsFlutterBinding.ensureInitialized();
  // await NotificationService.init();

  // await NotificationService.scheduleDailyNotification();

  setupServiceLocator();

  runApp(const PetPass());
}
