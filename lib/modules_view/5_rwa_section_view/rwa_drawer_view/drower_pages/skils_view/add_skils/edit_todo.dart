import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ps_welness_new_ui/controllers/skils_controller/add_skils_controller.dart';
//import 'package:ps_welness/controllers/skils_controller/add_skils_controller.dart';

class TodoEdit extends StatelessWidget {
  final int? index;
  TodoEdit({Key? key, @required this.index}) : super(key: key);
  final TodoController todoController = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController =
        TextEditingController(text: todoController.todos[index!].text);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                // textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "Add Your Skils",
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
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
                // ignore: deprecated_member_use
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    child: const Text('Update'),
                    // color: Colors.green,
                    // textColor: Colors.white,
                    onPressed: () {
                      var editing = todoController.todos[index!];
                      editing.text = textEditingController.text;
                      todoController.todos[index!] = editing;
                      Get.back();
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
