import 'package:fire_data/UI%20Authentication/page_auth.dart';
import 'package:fire_data/UI%20Authentication/page_varify_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  final String title;
  
  const SignInPage({super.key, required this.title});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if(snapshot.hasError) {
            return const Center(child: Text('Something went wrong!'));
          } else if(snapshot.hasData) {
            return const VerifyEmailPage();
          } else{
            return const AuthPage();
          }
        }
      ),
    );
  }
}