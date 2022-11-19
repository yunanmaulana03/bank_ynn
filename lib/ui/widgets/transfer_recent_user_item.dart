import 'package:bank_ynn/shared/theme.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';

class TransferRecentUserItem extends StatelessWidget {
  final UserModel user;
  const TransferRecentUserItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Row(children: [
        Container(
          width: 45,
          height: 45,
          margin: EdgeInsets.only(
            right: 14,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: user.profilePicture == null || user.profilePicture!.isEmpty
                  ? AssetImage(
                      'assets/img_profile.png',
                    )
                  : NetworkImage(user.profilePicture!) as ImageProvider,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name.toString(),
              overflow: TextOverflow.ellipsis,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              '@${user.username}',
              overflow: TextOverflow.ellipsis,
              style: greyTextStyle.copyWith(
                fontSize: 12,
              ),
            )
          ],
        ),
        Spacer(),
        if (user.verified == 1)
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: greenColor,
                size: 14,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Verified',
                style: greenTextStyle.copyWith(
                  fontSize: 11,
                  fontWeight: medium,
                ),
              ),
            ],
          )
      ]),
    );
  }
}
