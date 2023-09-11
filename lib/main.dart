import 'package:fire_data/Phone%20Authentication/phone_loging.dart';
import 'package:fire_data/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'UI Authentication/page_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  static const String title = 'Firebase Practice';

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
        .copyWith(secondary: Colors.tealAccent)
      ),
      home: const SignInPage(title: title),
    );
  }
}