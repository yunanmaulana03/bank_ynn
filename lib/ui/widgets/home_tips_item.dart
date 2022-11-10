import 'package:bank_ynn/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeTipsItem extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String url;
  const HomeTipsItem(
      {Key? key, required this.imgUrl, required this.title, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 176,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            child: Image.asset(
              imgUrl,
              width: 155,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Text(
              title,
              style: blackTextStyle.copyWith(
                fontWeight: medium,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}
