import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foyg/core/providers/time_provider.dart';
import 'package:foyg/core/providers/user_provider.dart';
import 'package:foyg/welcom/welcom_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TimeProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const MaterialApp(
        home: WelcomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
