import 'package:flutter/material.dart';
import 'package:alarm/alarm.dart';
import 'package:pillly/services/alarm_service.dart';
import 'package:pillly/theme/app_theme.dart';
import 'package:pillly/screens/home_screen.dart';
import 'package:pillly/screens/alarm_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AlarmService().requestPermissions();
  await Alarm.init();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _listenToAlarms();
  }

  void _listenToAlarms() {
    AlarmService().startListening(
      onAlarm: (alarmSettings) {
        _navigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (context) => AlarmRingScreen(alarmSettings: alarmSettings),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: 'pillly',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
