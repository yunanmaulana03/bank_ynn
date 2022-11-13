import 'package:bank_ynn/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferRecentUserItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String username;
  final bool isVerified;
  const TransferRecentUserItem(
      {Key? key,
      required this.imgUrl,
      required this.name,
      required this.username,
      this.isVerified = false})
      : super(key: key);

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
              image: AssetImage(
                imgUrl,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              '@$username',
              style: greyTextStyle.copyWith(
                fontSize: 12,
              ),
            )
          ],
        ),
        Spacer(),
        if (isVerified)
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
