import 'package:andrea/app/landing_page.dart';
import 'package:andrea/services/auth.dart';
import 'package:andrea/services/auth_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        title: 'Time Tracker',
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: LandingPage(),
      ),
    );
  }
}
