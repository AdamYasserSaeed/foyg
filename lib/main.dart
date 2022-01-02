import 'package:firedart/auth/firebase_auth.dart';
import 'package:firedart/auth/token_store.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/material.dart';
import 'package:foyg/core/providers/theme_provider.dart';
import 'package:foyg/core/providers/time_provider.dart';
import 'package:foyg/core/providers/auth_provider.dart';
import 'package:foyg/welcom/welcom_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  const apiKey = 'AIzaSyDwf-AzZFJsa_VCuFhxWEQy1pLfvB3Ny4E';
  const projectId = 'foyg-cdac0';

  FirebaseAuth.initialize(apiKey, VolatileStore());
  Firestore.initialize(projectId);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TimeProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => SignUpProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => Themeprovider()),
      ],
      child: const MaterialApp(
        home: WelcomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
