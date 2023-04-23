import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_info.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: password,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: signIn,
              child: const Text('Sign In'),
            )
          ],
        ),
      ),
    );
  }

  void signIn() {
    String emailString = email.text.trim();
    String passwordString = password.text.trim();
    if (emailString.isEmpty || passwordString.isEmpty) {
      debugPrint('Input required fields');
      return;
    }
    context.read<LoginInfo>().login(emailString, passwordString);
  }
}
