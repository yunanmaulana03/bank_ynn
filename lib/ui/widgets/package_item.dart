import 'package:bank_ynn/models/data_plan_model.dart';
import 'package:flutter/material.dart';

import '../../shared/shared_method.dart';
import '../../shared/theme.dart';

class PackageItem extends StatelessWidget {
  final DataPlanModel dataPlan;
  final bool isSelected;

  const PackageItem({
    Key? key,
    required this.dataPlan,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157,
      height: 175,
      padding: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 22,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? blueColor : whiteColor,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dataPlan.name.toString(),
            style: blackTextStyle.copyWith(
              fontSize: 32,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            formatCurrency(dataPlan.price ?? 0),
            style: greyTextStyle.copyWith(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
