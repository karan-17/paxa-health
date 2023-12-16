import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paxa/widgets/time_wheel.dart';
import '../todos/add_todo_controller.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final controller = Get.put(AddTodoController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: (){Get.back();},
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            color: Colors.black,
          ),
          title: const Text(
            'Task',
            style: TextStyle(
              color: Colors.black,
              fontSize: 34,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w700,
              height: 0.04,
              letterSpacing: 0.37,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add a Task',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 34,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                    height: 0.04,
                    letterSpacing: 0.37,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Name',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w600,
                        height: 0.06,
                        letterSpacing: 0.38,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          hintText: 'Enter task name',
                          hintStyle: TextStyle(
                            color: Color(0xFFC4C4C4),
                            fontSize: 20,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w600,
                            height: 0.06,
                            letterSpacing: 0.38,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Hour',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w600,
                        height: 0.06,
                        letterSpacing: 0.38,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      height: 50,
                      child: TimeWheel(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Today',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                          height: 0.06,
                          letterSpacing: 0.38,
                        ),
                      ),
                      Obx(
                        () => Switch(
                          value: controller.isToday.value,
                          onChanged: (value) {
                            controller.toggleToday(value);
                          },
                          activeTrackColor: Color(0xFF35C758),
                          activeColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.pickImageFromGallery(ImageSource.gallery);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF171717),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        'Add Image',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.06,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w500,
                          height: 0.09,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  //show image here
                  child: Obx(
                    () => controller.selectedImagePath.value == ''
                        ? const Text('No image selected.')
                        : Image.file(File(controller.selectedImagePath.value),height: 400,width: 400,),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.addTodo(
                          titleController.text,
                          false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF171717),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        'Done',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.06,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w500,
                          height: 0.09,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20),
                  child: SizedBox(
                    child: Text(
                      'If you disable today, the task will be considered as tomorrow',
                      style: TextStyle(
                        color: Color(0x993C3C43),
                        fontSize: 13,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
