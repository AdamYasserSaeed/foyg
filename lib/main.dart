import 'package:flutter/material.dart';
import 'package:foyg/core/providers/time_provider.dart';
import 'package:foyg/welcom/welcom_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TimeProvider()),
      ],
      child: const MaterialApp(
        home: WelcomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
