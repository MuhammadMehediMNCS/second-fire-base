import 'package:fire_data/Google%20Authentication/google_sign_in.dart';
import 'package:fire_data/Google%20Authentication/home_page_provider.dart';
import 'package:fire_data/Google%20Authentication/sign_up_widget.dart';
import 'package:fire_data/widgets/sign_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailLogIn extends StatelessWidget {
  static final String title = 'MainPage';

  const EmailLogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData.dark().copyWith(accentColor: Colors.indigo),
        home: const HomePageProvider(),
      ),
    );
  }
}