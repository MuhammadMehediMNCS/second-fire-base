import 'package:fire_data/Google%20Authentication/google_login.dart';
import 'package:fire_data/Google%20Authentication/sign_up_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePageProvider extends StatefulWidget {
  const HomePageProvider({super.key});

  @override
  State<HomePageProvider> createState() => _HomePageProviderState();
}

class _HomePageProviderState extends State<HomePageProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return const LogInProvider();
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something Went Wrong!'));
          } else {
            return const SignUpWithGoogleAccount();
          }
        },
      ),
    );
  }
}