import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prov/counter_provider.dart';
import 'package:prov/firebase_options.dart';
import 'package:prov/login/login_page.dart';
import 'package:prov/login/login_provider.dart';
import 'package:prov/login/signup_provider.dart';
import 'package:prov/task_app/tak_app_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CounterProvider()),
    ChangeNotifierProvider(create: (_) => TaskAppProvider()),
    ChangeNotifierProvider(create: (_) => LoginProvider()),
    ChangeNotifierProvider(create: (_) => SignupProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
    );
  }
}
