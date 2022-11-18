import 'package:bank_ynn/blocs/user/user_bloc.dart';
import 'package:bank_ynn/models/user_model.dart';
import 'package:bank_ynn/shared/theme.dart';
import 'package:bank_ynn/ui/widgets/button.dart';
import 'package:bank_ynn/ui/widgets/forms.dart';
import 'package:bank_ynn/ui/widgets/transfer_recent_user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/transfer_result_user_item.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final usernameController = TextEditingController(text: '');
  UserModel? selectedUser;
  late UserBloc userBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userBloc = context.read<UserBloc>()..add(UserGetRecent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transfer',
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
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          CustomFormField(
            title: 'by username',
            isShowTitle: false,
            controller: usernameController,
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {
                userBloc.add(UserGetByUsername(usernameController.text));
              } else {
                userBloc.add(UserGetRecent());
              }
              setState(() {});
            },
          ),
          usernameController.text.isEmpty
              ? buildRecentUsers()
              : buildResult(context),
          SizedBox(
            height: 50,
          ),
        ],
      ),
      floatingActionButton: selectedUser != null
          ? Container(
              margin: EdgeInsets.all(24),
              child: CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(context, '/transfer-amount');
                },
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildRecentUsers() {
    return Container(
      margin: EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Users',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          TransferRecentUserItem(
            imgUrl: 'assets/img_friends1.png',
            name: 'Yonna Jie',
            username: 'yoenna',
            isVerified: true,
          ),
          TransferRecentUserItem(
            imgUrl: 'assets/img_friends2.png',
            name: 'Siti',
            username: 'siti',
          ),
          TransferRecentUserItem(
            imgUrl: 'assets/img_friends3.png',
            name: 'John Hi',
            username: 'john',
          ),
        ],
      ),
    );
  }

  Widget buildResult(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 17,
            runSpacing: 17,
            children: [
              TransferResultUserItem(
                imgUrl: 'assets/img_friends1.png',
                name: 'Yonna Jie',
                username: 'yoenna',
                isVerified: true,
              ),
              TransferResultUserItem(
                imgUrl: 'assets/img_friends2.png',
                name: 'Yanne Ka',
                username: 'yoenya',
                isSelected: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
