import 'package:bank_ynn/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeUseritem extends StatelessWidget {
  final String imgUrl;
  final String username;
  const HomeUseritem({Key? key, required this.imgUrl, required this.username})
      : super(key: key);

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
                image: AssetImage(
                  imgUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            '@$username',
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
