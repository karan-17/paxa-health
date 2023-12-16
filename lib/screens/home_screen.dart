import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paxa/screens/add_todo_screen.dart';
import '../todos/todo_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TodoFunctions());
    print(controller.viewTodo());
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/55942632?v=4',
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Today',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 34,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w700,
                        height: 0.04,
                        letterSpacing: 0.37,
                      ),
                    ),
                    Text(
                      'Hide completed',
                      style: TextStyle(
                        color: Color(0xFF3478F6),
                        fontSize: 13,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              FutureBuilder(
                future: controller.viewTodo(),
                builder: (context, index) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.todoList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => ListTile(
                          leading: Icon(controller.todoList[index].completed
                              ? Icons.check_box_outlined
                              : Icons.check_box_outline_blank_outlined),
                          title: Text(
                            controller.todoList[index].todo,
                          ),
                          titleTextStyle: TextStyle(
                            color: controller.todoList[index].completed
                                ? Colors.grey
                                : Colors.black,
                            fontSize: 17,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w400,
                            decoration: controller.todoList[index].completed
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                          subtitle: const Text(
                            '12:42 PM',
                          ),
                          subtitleTextStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w400,
                          ),
                          leadingAndTrailingTextStyle: TextStyle(
                            color: controller.todoList[index].completed
                                ? Colors.grey
                                : Colors.black,
                            fontSize: 17,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w400,
                            decoration: controller.todoList[index].completed
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                          trailing: const Icon(Icons.more_vert_outlined),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Tomorrow',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 34,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w700,
                        height: 0.04,
                        letterSpacing: 0.37,
                      ),
                    ),
                    Text(
                      'Hide completed',
                      style: TextStyle(
                        color: Color(0xFF3478F6),
                        fontSize: 13,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              FutureBuilder(
                future: controller.viewTodo(),
                builder: (context, index) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.todoList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => ListTile(
                          leading: const Icon(Icons.circle_rounded),
                          title: Text(
                            controller.todoList[index].todo,
                          ),
                          titleTextStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w400,
                          ),
                          subtitle: const Text(
                            '12:42 PM',
                          ),
                          subtitleTextStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w400,
                          ),
                          leadingAndTrailingTextStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w400,
                          ),
                          trailing: const Icon(Icons.more_vert_outlined),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => const AddTodoScreen());
            },
            child: const Icon(Icons.add),
          )),
    );
  }
}
