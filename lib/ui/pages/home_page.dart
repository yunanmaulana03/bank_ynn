import 'package:bank_ynn/blocs/transaction/transaction_bloc.dart';
import 'package:bank_ynn/shared/shared_method.dart';
import 'package:bank_ynn/ui/pages/transfer_amount_page.dart';
import 'package:bank_ynn/ui/widgets/home_latest_transaction_item.dart';
import 'package:bank_ynn/ui/widgets/home_services.dart';
import 'package:bank_ynn/ui/widgets/home_tips_item.dart';
import 'package:bank_ynn/ui/widgets/home_user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/tip/tip_bloc.dart';
import '../../blocs/user/user_bloc.dart';
import '../../models/transfer_form_model.dart';
import '../../shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          elevation: 0,
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: blueTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_overview.png',
                width: 20,
                color: blueColor,
              ),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_history.png',
                width: 20,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_statistic.png',
                width: 20,
              ),
              label: 'Statistic',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_reward.png',
                width: 20,
              ),
              label: 'Reward',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: purpleColor,
        child: Image.asset(
          'assets/ic_plus_circle.png',
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          buildProfile(context),
          buildWalletCard(),
          buildLevel(),
          buildServices(context),
          buildLatestTrasaction(),
          buildSendAgain(),
          buildFriendlyTips(),
        ],
      ),
    );
  }

  Widget buildProfile(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: EdgeInsets.only(
              top: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Howdy,',
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      state.user.username.toString(),
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: state.user.profilePicture == null
                            ? AssetImage(
                                'assets/img_profile.png',
                              )
                            : NetworkImage(
                                state.user.profilePicture!,
                              ) as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: state.user.verified == 1
                        ? Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: whiteColor,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.check_circle,
                                  color: greenColor,
                                  size: 14,
                                ),
                              ),
                            ),
                          )
                        : null,
                  ),
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget buildWalletCard() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            width: double.infinity,
            height: 220,
            margin: EdgeInsets.only(
              top: 30,
            ),
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              image: DecorationImage(
                image: AssetImage(
                  'assets/img_bg_card.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.user.name.toString(),
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Text(
                  '**** **** **** ${state.user.cardNumber?.substring(12, 16)}',
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                    letterSpacing: 6,
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                Text(
                  'Balance',
                  style: whiteTextStyle,
                ),
                Text(
                  formatCurrency(state.user.balance ?? 0),
                  style: whiteTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget buildLevel() {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(children: [
        Row(
          children: [
            Text(
              'Level 1',
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            Spacer(),
            Text(
              '50% ',
              style: greenTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
            Text(
              'of ${formatCurrency(20000)}',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(55),
          child: LinearProgressIndicator(
            value: 0.55,
            minHeight: 5,
            valueColor: AlwaysStoppedAnimation(greenColor),
            backgroundColor: lightBgColor,
          ),
        ),
      ]),
    );
  }

  Widget buildServices(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do Something',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServices(
                iconUrl: 'assets/ic_topup.png',
                title: 'Top Up',
                onTap: () {
                  Navigator.pushNamed(context, '/top-up');
                },
              ),
              HomeServices(
                iconUrl: 'assets/ic_send.png',
                title: 'Send',
                onTap: () {
                  Navigator.pushNamed(context, '/transfer-page');
                },
              ),
              HomeServices(
                iconUrl: 'assets/ic_withdraw.png',
                title: 'Withdraw',
                onTap: () {},
              ),
              HomeServices(
                iconUrl: 'assets/ic_more.png',
                title: 'More',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => moreDialog(context),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildLatestTrasaction() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transactions',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Container(
            padding: EdgeInsets.all(22),
            margin: EdgeInsets.only(
              top: 14,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: BlocProvider(
              create: (context) => TransactionBloc()..add(TransactionGet()),
              child: BlocBuilder<TransactionBloc, TransactionState>(
                builder: (context, state) {
                  if (state is TransactionSuccess) {
                    return Column(
                        children: state.transactions.map((transaction) {
                      return HomeLatestTransactionItem(
                          transaction: transaction);
                    }).toList());
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSendAgain() {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Again',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          BlocProvider(
            create: (context) => UserBloc()..add(UserGetRecent()),
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserSuccess) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: state.users.map((user) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TransferAmountPage(
                                      data: TransferFormModel(
                                    sendTo: user.username,
                                  )),
                                ),
                              );
                            },
                            child: HomeUseritem(user: user));
                      }).toList(),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget buildFriendlyTips() {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          BlocProvider(
            create: (context) => TipBloc()..add(TipGet()),
            child: BlocBuilder<TipBloc, TipState>(
              builder: (context, state) {
                // print(state);
                if (state is TipSuccess) {
                  return Wrap(
                    spacing: 30,
                    runSpacing: 20,
                    children: state.tips.map((tip) {
                      return HomeTipsItem(tip: tip);
                    }).toList(),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget moreDialog(BuildContext context) {
  return AlertDialog(
    backgroundColor: Colors.transparent,
    insetPadding: EdgeInsets.zero,
    alignment: Alignment.bottomCenter,
    content: Container(
      padding: EdgeInsets.all(30),
      width: MediaQuery.of(context).size.width,
      height: 326,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: lightBgColor,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Do More With Us',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        SizedBox(
          height: 13,
        ),
        Wrap(
          spacing: 29,
          runSpacing: 25,
          children: [
            HomeServices(
              iconUrl: 'assets/ic_product_data.png',
              title: 'Data',
              onTap: () {
                Navigator.pushNamed(context, '/data-provider');
              },
            ),
            HomeServices(
              iconUrl: 'assets/ic_product_water.png',
              title: 'Water',
              onTap: () {},
            ),
            HomeServices(
              iconUrl: 'assets/ic_product_stream.png',
              title: 'Stream',
              onTap: () {},
            ),
            HomeServices(
              iconUrl: 'assets/ic_product_movie.png',
              title: 'Movie',
              onTap: () {},
            ),
            HomeServices(
              iconUrl: 'assets/ic_product_food.png',
              title: 'Food',
              onTap: () {},
            ),
            HomeServices(
              iconUrl: 'assets/ic_product_travel.png',
              title: 'Travel',
              onTap: () {},
            ),
          ],
        )
      ]),
    ),
  );
}
