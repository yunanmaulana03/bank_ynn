import 'package:bank_ynn/models/user_model.dart';
import 'package:bank_ynn/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeUseritem extends StatelessWidget {
  final UserModel user;
  const HomeUseritem({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      margin: EdgeInsets.only(
        right: 17,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            margin: EdgeInsets.only(
              bottom: 13,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: user.profilePicture == null
                    ? AssetImage(
                        'assets/img_profile.png',
                      )
                    : NetworkImage(user.profilePicture!) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            '@${user.name}',
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          )
        ],
      ),
    );
  }
}
