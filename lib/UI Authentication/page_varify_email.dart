import 'dart:async';

import 'package:fire_data/UI%20Authentication/page_home.dart';
import 'package:fire_data/widgets/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResentEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    // User needs to be created before!
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if(!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future checkEmailVerified() async {
    // Call after email verification!
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if(isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResentEmail = false);
      await Future.delayed(const Duration(seconds: 5));
      setState(() => canResentEmail = true);
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
    ? const HomePage()
    : Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'The email verification has been sent a link to your email',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                maximumSize:const Size.fromHeight(50)
              ),
              onPressed: canResentEmail ? sendVerificationEmail : null,
              icon: const Icon(Icons.email, size: 32),
              label: const Text(
                'Resent Link',
                style: TextStyle(fontSize: 24),
              )
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 24),
              )
            )
          ],
        ),
      ),
    );
}