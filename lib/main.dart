import 'package:flutter/material.dart';
import 'package:future_code_test/view/screens/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('ar')],
      theme: ThemeData(
        androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
      ),
      home: LoginScreen(),
    );
  }
}
