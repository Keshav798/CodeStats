import 'package:flutter/material.dart';
import 'package:leetcodestats/Utils/notification_helper.dart';
import 'package:leetcodestats/screens/splash_screen.dart';

void main() async{
	WidgetsFlutterBinding.ensureInitialized();
	await LocalNotifications.init();
	//tz.initializeTimeZones();
	runApp(MyApp());             
}

class MyApp extends StatefulWidget {
	const MyApp({super.key});

	@override
	State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
	// This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			theme: ThemeData(
				brightness: Brightness.dark,
				primarySwatch: Colors.blue,
				),
			// A widget which will be started on application startup
			home: SplashScreen(),
			);
	}
}
