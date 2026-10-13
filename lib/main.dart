import 'package:flutter/material.dart';
import 'package:notification_app_practice/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              final granted = await NotificationService.instance
                  .requestPermission();
              if (granted) {
                await NotificationService.instance.showInstant(
                  id: 1,
                  title: 'Hello',
                  body: 'My first local Notification',
                  payload: 'test_payload',
                );
              }
            },
            child: Text('Show Notification'),
          ),
        ),
      ),
    );
  }
}
