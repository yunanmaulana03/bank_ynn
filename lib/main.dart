import 'package:bank_ynn/ui/pages/onboarding_page.dart';
import 'package:bank_ynn/ui/pages/sign_in_page.dart';
import 'package:bank_ynn/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashPage(),
      routes: {
        '/': (context) => SplashPage(),
        '/onboarding': (context) => OnBoardingPage(),
        '/sign-in': (context) => SignInPage(),
      },
    );
  }
}
