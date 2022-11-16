// isinya adalah request request yang diperlukan mengenai autentikasi yang ada pada halaman authentication (register, login, logout, check email)
// tipe kembalian bool karena pada saat pengecekan email (Check Email) pada api menghasilkan true or false

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../shared/shared_value.dart';

class AuthService {
  Future<bool> checkEmail(email) async {
    try {
      final res = await http.post(
        Uri.parse(
          '$baseUrl/is-email-exist',
        ),
        body: {
          'email': email,
        },
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['is_email_exist'];
      } else {
        return jsonDecode(res.body)['errors'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
