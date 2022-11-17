import 'package:bank_ynn/shared/theme.dart';
import 'package:bank_ynn/ui/widgets/bank_item.dart';
import 'package:bank_ynn/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Top Up',
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return Row(
                  children: [
                    Image.asset(
                      'assets/img_wallet.png',
                      width: 80,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.cardNumber!.replaceAllMapped(
                              RegExp(r".{4}"), (match) => "${match.group(0)} "),
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          state.user.name.toString(),
                          style: greyTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          BankItem(
            imgUrl: 'assets/img_bank_bca.png',
            title: 'Bank BCA',
            isSelected: true,
          ),
          BankItem(
            imgUrl: 'assets/img_bank_bni.png',
            title: 'Bank BNI',
          ),
          BankItem(
            imgUrl: 'assets/img_bank_mandiri.png',
            title: 'Bank Mandiri',
          ),
          BankItem(
            imgUrl: 'assets/img_bank_ocbc.png',
            title: 'Bank OCBC',
          ),
          SizedBox(
            height: 12,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/top-up-amount');
            },
          ),
          SizedBox(
            height: 57,
          ),
        ],
      ),
    );
  }
}
