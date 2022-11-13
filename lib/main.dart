import 'package:bank_ynn/shared/theme.dart';
import 'package:bank_ynn/ui/pages/home_page.dart';
import 'package:bank_ynn/ui/pages/onboarding_page.dart';
import 'package:bank_ynn/ui/pages/pin_page.dart';
import 'package:bank_ynn/ui/pages/profile_edit_page.dart';
import 'package:bank_ynn/ui/pages/profile_edit_pin_page.dart';
import 'package:bank_ynn/ui/pages/profile_edit_success.dart';
import 'package:bank_ynn/ui/pages/profile_page.dart';
import 'package:bank_ynn/ui/pages/sign_in_page.dart';
import 'package:bank_ynn/ui/pages/sign_up_page.dart';
import 'package:bank_ynn/ui/pages/sign_up_set_ktp_page.dart';
import 'package:bank_ynn/ui/pages/sign_up_set_profile_page.dart';
import 'package:bank_ynn/ui/pages/sign_up_success_page.dart';
import 'package:bank_ynn/ui/pages/splash_page.dart';
import 'package:bank_ynn/ui/pages/top_up_amount_page.dart';
import 'package:bank_ynn/ui/pages/top_up_page.dart';
import 'package:bank_ynn/ui/pages/top_up_success.dart';
import 'package:bank_ynn/ui/pages/transfer_amount_page.dart';
import 'package:bank_ynn/ui/pages/transfer_page.dart';
import 'package:bank_ynn/ui/pages/transfer_success_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: lightBgColor,
        appBarTheme: AppBarTheme(
          backgroundColor: lightBgColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: blackColor,
          ),
          titleTextStyle: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      // home: SplashPage(),
      routes: {
        '/': (context) => SplashPage(),
        '/onboarding': (context) => OnBoardingPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/sign-up-set-profile': (context) => SignUpSetProfilePage(),
        '/sign-up-set-ktp': (context) => SignUpSetKtpPage(),
        '/sign-up-success': (context) => SignupSuccessPage(),
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/pin': (context) => PinPage(),
        '/profile-edit': (context) => ProfileEditPage(),
        '/profile-edit-pin': (context) => ProfileEditPinPage(),
        '/profile-edit-success': (context) => ProfileEditSuccess(),
        '/top-up': (context) => TopUpPage(),
        '/top-up-amount': (context) => TopUpAmountPage(),
        '/top-up-success': (context) => TopUpSuccessPage(),
        '/transfer-page': (context) => TransferPage(),
        '/transfer-amount': (context) => TransferAmountPage(),
        '/transfer-success': (context) => TransferSuccessPage(),
      },
    );
  }
}
