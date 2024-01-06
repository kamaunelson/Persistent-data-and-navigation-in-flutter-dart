import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                String savedEmail = prefs.getString('email') ?? '';
                String savedPassword = prefs.getString('password') ?? '';

                if (_emailController.text == savedEmail &&
                    _passwordController.text == savedPassword) {
                  // Navigate to the details page on successful login
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  // Show an error message or handle invalid credentials
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
