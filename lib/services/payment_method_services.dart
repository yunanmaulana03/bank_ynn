import 'dart:convert';

import 'package:bank_ynn/models/payment_method.dart';
import 'package:bank_ynn/services/auth_service.dart';
import 'package:http/http.dart' as http;

import '../shared/shared_value.dart';

class PaymentMethodService {
  Future<List<PaymentMethodModel>> getPaymentMethods() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse(
          '$baseUrl/payment_methods',
        ),
        headers: {
          'Authorization': token,
        },
      );
      if (res.statusCode == 200) {
        return List<PaymentMethodModel>.from(jsonDecode(res.body)
            .map((paymentMethod) => PaymentMethodModel.fromJson(paymentMethod)))
            .toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
