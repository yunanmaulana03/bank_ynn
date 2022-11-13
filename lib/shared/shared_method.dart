import 'package:another_flushbar/flushbar.dart';
import 'package:bank_ynn/shared/theme.dart';
import 'package:flutter/material.dart';

void showCustomSnackbar(BuildContext context, String message) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    duration: Duration(seconds: 2),
  ).show(context);
}
