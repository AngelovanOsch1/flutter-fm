import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) => const Color.fromARGB(255, 51, 127, 147)),
                padding: MaterialStateProperty.resolveWith(
                  (states) => const EdgeInsets.all(20.0),
                ),
              ),
              child: const Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/email-register');
              },
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) => const Color.fromARGB(255, 51, 127, 147)),
                padding: MaterialStateProperty.resolveWith(
                  (states) => const EdgeInsets.all(20.0),
                ),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                await _auth.signOut();
                setState(() {});
              },
            ),
            Text(user?.email ?? ''),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) => const Color.fromARGB(255, 51, 127, 147)),
                padding: MaterialStateProperty.resolveWith(
                  (states) => const EdgeInsets.all(20.0),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/email-login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
