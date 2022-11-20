import 'package:bank_ynn/blocs/operator_card/operator_card_bloc.dart';
import 'package:bank_ynn/models/operator_card_model.dart';
import 'package:bank_ynn/shared/theme.dart';
import 'package:flutter/material.dart';

class DataProviderItem extends StatelessWidget {
  final OperatorCardModel operatorCard;
  final bool isSelected;
  const DataProviderItem({
    Key? key,
    required this.operatorCard,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 18,
      ),
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border: isSelected
            ? Border.all(
                width: 2,
                color: blueColor,
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            operatorCard.thumbnail.toString(),
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                operatorCard.name.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                operatorCard.status.toString(),
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
