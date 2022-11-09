import 'package:bank_ynn/shared/theme.dart';
import 'package:bank_ynn/ui/widgets/button.dart';
import 'package:flutter/material.dart';

class SignupSuccessPage extends StatelessWidget {
  const SignupSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBgColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Akun Berhasil\nTerdaftar',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 26,
          ),
          Text(
            'Grow your finance start\ntogether with us',
            style: greyTextStyle.copyWith(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
          ),
          CustomFilledButton(
            width: 183,
            title: 'Get Started',
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/home-page',
                (route) => false,
              );
            },
          ),
        ],
      )),
    );
  }
}
