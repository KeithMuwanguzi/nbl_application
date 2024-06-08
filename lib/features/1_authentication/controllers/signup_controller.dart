import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nbl/core/util/widgets/snackbar.dart';

class SignUpController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  var isVisible = true.obs;
  var isVisible2 = true.obs;
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email can not be empty';
    }
    String pattern = r'\w+@\w+\.\w+';
    RegExp reg = RegExp(pattern);
    if (!reg.hasMatch(email)) {
      return 'Invalid Email format';
    }
    return null;
  }

  String? validateField(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email can not be empty';
    }
    String pattern = r'\w+@\w+\.\w+';
    RegExp reg = RegExp(pattern);
    if (!reg.hasMatch(email)) {
      return 'Invalid Email format';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password cannot be empty';
    }

    if (password.length < 8) {
      return "Password is too short";
    }
    return null;
  }

  String? validateConfirm(String? pass) {
    if (pass != password.text.trim()) {
      return 'Passwords do not match';
    }
    return null;
  }

  void changeVisibility() {
    isVisible.value = !isVisible.value;
  }

  void changeVisibility2() {
    isVisible2.value = !isVisible2.value;
  }

  Future<void> signUp(String email, String password) async {
    final url =
        Uri.parse('https://fubaappbackend.onrender.com/api/users/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print(responseData);
    } else {
      // Handle error, e.g., show an error message
      final error = json.decode(response.body)['error'];
      CustomSnackbar.showError(error);
    }
  }
}
