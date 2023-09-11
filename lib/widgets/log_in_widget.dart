import 'package:fire_data/UI%20Authentication/page_forgot_password.dart';
import 'package:fire_data/widgets/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginWidget({
    super.key,
    required this.onClickedSignUp
  });

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        const Text(
          'My First Database Practice',
          style: TextStyle(
            color: Color.fromARGB(255, 19, 185, 19),
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 60),
        ClipOval(
          child: Image.asset(
            'images/Developer.jpg',
            height: 130,
            width: 130,
            fit: BoxFit.cover,
          ),
        ),
        TextField(
          controller: emailController,
          cursorColor: Colors.white,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Email' 
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: passwordController,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        const SizedBox(height: 16),
        Container(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 16,
              )
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ForgotPasswordPage()
            )),
          ),
        ),
        const SizedBox(height: 18),
        ElevatedButton.icon(
          onPressed: signIn,
          icon: const Icon(Icons.lock_open, size: 32,),
          label: const Text(
            'Sign In',
            style: TextStyle(fontSize: 24),
          )
        ),
        const SizedBox(height: 16),
        // For Sign Up
        RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.white, fontSize: 20),
            text: 'No account? ',
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = widget.onClickedSignUp,
                text: 'Sign Up',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Theme.of(context).colorScheme.secondary
                )
              )
            ]
          )
        ),
        const SizedBox(height: 80),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {},
              child: buttoWidget(
                const FaIcon(        //package : google_sign_in, font_awesome_flutter
                  FontAwesomeIcons.google,
                  color: Colors.red,
                  size: 40,
                )
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: buttoWidget(
                const Icon(
                  Icons.facebook,
                  color: Colors.blue,
                  size: 60,
                )
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: buttoWidget(
                const Icon(
                  Icons.call,
                  color: Colors.greenAccent,
                  size: 40,
                )
              ),
            )
          ],
        )
      ],
    ),
  );

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator())
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim()
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message); // Never SignUp Email uses.
    }

    // Navigator.of(context) not working!
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Widget buttoWidget(Widget child) {
    return ClipOval(
        child: Container(
          height: 70,
          width: 70,
          color: Colors.white,
          alignment: Alignment.center,
          child: child
      ),
    );
  }
}