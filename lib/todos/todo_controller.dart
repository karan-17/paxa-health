

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import 'todoModel.dart';

class TodoFunctions extends GetxController {
  late RxList<Todo> todoList = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
  }
   viewTodo() async {
    try {
      final response = await http.get(Uri.parse('${viewTodoURL}'));
      print(response.body);
      if (response.statusCode == 200) {
        final todo = Welcome.fromRawJson(response.body);
        todoList.value = todo.todos;
      } else {
        Get.snackbar(response.statusCode.toString(), response.body.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print(e);
    }
    print(todoList.runtimeType);
    return todoList;
  }

}
