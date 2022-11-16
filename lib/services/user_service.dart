import 'dart:convert';

import 'package:bank_ynn/models/user_edit_form_model.dart';
import 'package:bank_ynn/services/auth_service.dart';
import 'package:http/http.dart' as http;

import '../shared/shared_value.dart';

class UserService {
  Future<void> updateUser(UserEditFormModel data) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.put(
        Uri.parse(
          '$baseUrl/users',
        ),
        body: data.toJson(),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
