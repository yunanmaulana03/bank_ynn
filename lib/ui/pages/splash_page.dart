import 'dart:async';

import 'package:bank_ynn/shared/theme.dart';
import 'package:bank_ynn/ui/pages/onboarding_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/onboarding');
    });
    ;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBgColor,
      body: Center(
        child: Container(
          width: 155,
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/img_logo_dark.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
