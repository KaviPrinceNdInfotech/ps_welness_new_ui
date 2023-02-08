import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
//import 'package:ps_welness/controllers/skils_controller/add_skils_controller.dart';
//import 'package:ps_welness/model/add_skils_model/add_skil_model.dart';
import 'package:ps_welness_new_ui/controllers/skils_controller/add_skils_controller.dart';
import 'package:ps_welness_new_ui/model/add_skils_model/add_skil_model.dart';

class TodoScreen extends StatelessWidget {
  static const id = '/Todo_Screen';
  final TodoController todoController = Get.find<TodoController>();

  final TextEditingController textEditingController = TextEditingController();

  TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                // textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "Add your skils",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                autofocus: true,
                controller: textEditingController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ignore: deprecated_member_use
                ElevatedButton(
                  child: const Text('Cancel'),
                  // color: Colors.red,
                  // textColor: Colors.white,
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
                // ignore: deprecated_member_use
                ElevatedButton(
                  child: const Text('Add'),
                  // color: Colors.green,
                  // textColor: Colors.white,
                  onPressed: () {
                    todoController.todos.add(
                      Todo(
                        text: textEditingController.text,
                      ),
                    );
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
