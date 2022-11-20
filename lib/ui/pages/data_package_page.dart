import 'package:bank_ynn/models/operator_card_model.dart';
import 'package:bank_ynn/shared/theme.dart';
import 'package:bank_ynn/ui/widgets/button.dart';
import 'package:bank_ynn/ui/widgets/package_item.dart';
import 'package:flutter/material.dart';

import '../../models/data_plan_model.dart';
import '../widgets/forms.dart';
import '../widgets/transfer_result_user_item.dart';

class DataPackagePage extends StatefulWidget {
  final OperatorCardModel operatorCard;

  const DataPackagePage({Key? key, required this.operatorCard})
      : super(key: key);

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  final phoneController = TextEditingController(text: '');
  DataPlanModel? selectedDataPlan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Paket Data',
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
            'Phone Number',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          CustomFormField(
            title: '+628',
            isShowTitle: false,
            controller: phoneController,
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Select Package',
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
            children: widget.operatorCard.dataPlans!.map((dataPlan) {
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDataPlan = dataPlan;
                    });
                  },
                  child: PackageItem(
                    dataPlan: dataPlan,
                    isSelected: dataPlan.id == selectedDataPlan?.id,
                  ));
            }).toList(),
          ),
          SizedBox(
            height: 57,
          ),
        ],
      ),
      floatingActionButton:
          (selectedDataPlan != null && phoneController.text.isNotEmpty)
              ? Container(
                  margin: EdgeInsets.all(24),
                  child: CustomFilledButton(
                    title: 'Continue',
                    onPressed: () {},
                  ),
                )
              : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
