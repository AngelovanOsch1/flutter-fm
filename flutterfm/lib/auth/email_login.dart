import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin({super.key});

  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          right: 40.0,
          bottom: 20.0,
          left: 40.0,
        ),
        child: Form(
          child: Column(
            children: [
              const Text('Email'),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              TextFormField(
                controller: _emailController,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              const Text('Password'),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40.0),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) => const Color.fromARGB(255, 51, 127, 147)),
                  padding: MaterialStateProperty.resolveWith(
                    (states) => const EdgeInsets.all(20.0),
                  ),
                ),
                onPressed: () async {
                  try {
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    );
                    Navigator.pushNamed(context, '/homescreen');
                  } catch (error) {
                    error.toString();
                  }
                },
                child: const Text(
                  'Login account',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
