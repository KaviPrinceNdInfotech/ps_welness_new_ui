import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../model/add_skils_model/add_skil_model.dart';
//import 'package:ps_welness/model/add_skils_model/add_skil_model.dart';

class TodoController extends GetxController {
  var todos = List<Todo>.empty().obs;

  @override
  void onInit() {
    List? storedTodos = GetStorage().read<List>('todo');
    if (storedTodos != null) {
      todos = storedTodos.map((e) => Todo.fromJson(e)).toList().obs;
    }
    ever(todos, (_) {
      GetStorage().write('todo', todos.toList());
    });
    super.onInit();
  }
}
