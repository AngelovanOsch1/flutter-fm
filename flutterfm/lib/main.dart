import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfm/auth/email_login.dart';
import 'package:flutterfm/auth/email_register.dart';
import 'package:flutterfm/screens/homescreen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homescreen(),
      routes: {
        '/email-register': (context) => const EmailRegister(),
        '/email-login': (context) => const EmailLogin(),
        '/homescreen': (context) => const Homescreen(),
      },
    );
  }
}
