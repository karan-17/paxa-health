import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paxa/constants.dart';

class AddTodoController extends GetxController{
  final TextEditingController titleController = TextEditingController();
  RxBool isToday = false.obs;
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  void toggleToday(value){
    isToday.value = value;
  }

  Future pickImageFromGallery(ImageSource imageSource) async {
    try{
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImagePath.value = pickedFile.path;
        selectedImageSize.value = (File(selectedImagePath.value).lengthSync() / 1024 / 1024).toStringAsFixed(2);
      } else {
        Get.snackbar('Error', 'No image selected',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print(e);
    }
  }

addTodo(String title, bool isCompleted) async {
  try {
    final response = await http.post(
      Uri.parse('${addTodoURL}'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {
          'todo': title,
          'completed': isCompleted,
          'userId': 1,
        },
      ),
    );
    print(response.body);
    if (response.statusCode == 200) {
      Get.snackbar('Success', response.body.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar(response.statusCode.toString(), response.body.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  } catch (e) {
    print(e);
    Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
  }
}
}