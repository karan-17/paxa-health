import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paxa/screens/home_screen.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class AuthFunctions extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  login(String username, String password) async {
    try {
      print(username);
      print(password);
      final response = await http.post(
        Uri.parse('${loginAuthURL}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          {
            'username': username,
            'password': password,
          },
        ),
      );
      print(response.body);
      if (response.statusCode == 200) {
        Get.offAll(() => const HomeScreen());
      } else {
        Get.snackbar(response.statusCode.toString(), response.body.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  // void register(){
  //   print('Register');
  // }
  //
  // void forgotPassword(){
  //   print('Forgot Password');
  // }
}
