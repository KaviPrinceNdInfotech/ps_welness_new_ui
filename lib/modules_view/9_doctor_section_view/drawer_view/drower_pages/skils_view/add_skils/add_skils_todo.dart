import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers/skils_controller/skils_controllers.dart';
import 'package:ps_welness_new_ui/controllers/skils_controller/add_skils_controller.dart';
import 'package:ps_welness_new_ui/model/add_skils_model/add_skil_model.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/controllers/skils_controller/add_skils_controller.dart';
// import 'package:ps_welness/model/add_skils_model/add_skil_model.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';

class AddSkilsScreen extends StatelessWidget {


  AddSkilsScreen({Key? key}) : super(key: key);
  static const id = '/Home_screen';
  //final TodoController todoController = Get.put(TodoController());
  //final TextEditingController textEditingController = TextEditingController();
  SkillsListController _skillsListController = Get.put(SkillsListController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.ThemeColors,
        elevation: 0,
        title: Text('Add Skils'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyTheme.ThemeColors,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          // Get.defaultDialog(
          //     backgroundColor: MyTheme.ThemeColors,
          //     title: '',
          //     content: Column(
          //       //mainAxisSize: MainAxisSize.min,
          //       children: [
          //         NeumorphicTextFieldContainer(
          //           child: TextFormField(
          //             controller: textEditingController,
          //             // onSaved: (value) {
          //             //   _chemist_1_controller.confirmpassword = value!;
          //             // },
          //             // validator: (value) {
          //             //   return _chemist_1_controller.validConfirmPassword(value!);
          //             // },
          //             cursorColor: Colors.black,
          //             obscureText: false,
          //             decoration: InputDecoration(
          //               hintText: 'Add Skills',
          //               helperStyle: TextStyle(
          //                 color: black.withOpacity(0.7),
          //                 fontSize: 18,
          //               ),
          //               prefixIcon: Icon(
          //                 Icons.phonelink_lock,
          //                 color: black.withOpacity(0.7),
          //                 size: 20,
          //               ),
          //               border: InputBorder.none,
          //             ),
          //             keyboardType: TextInputType.multiline,
          //             maxLines: 1,
          //             autofocus: true,
          //             //obscureText: true,
          //             //controller: _loginpasswordController.mobileController,
          //           ),
          //         ),
          //         SizedBox(
          //           height: 30.0,
          //         ),
          //         ElevatedButton(
          //           style: ElevatedButton.styleFrom(
          //             primary: Colors.red, // background
          //             onPrimary: Colors.yellow, // foreground
          //           ),
          //           onPressed: () {
          //             todoController.todos.add(
          //               Todo(
          //                 text: textEditingController.text,
          //               ),
          //             );
          //             Get.back();
          //             // if (
          //             // settingsScreenController
          //             //     .categoryNameController.text.isNotEmpty) {
          //             //   var expenseCategory = ExpenseCategory(
          //             //       settingsScreenController
          //             //           .categoryNameController.text,
          //             //       id: _addExpenseController.expenseCategories.length);
          //             //   settingsScreenController
          //             //       .addExpenseCategory(expenseCategory);
          //             //   _addExpenseController.expenseCategories
          //             //       .add(expenseCategory);
          //             //   Get.back();
          //             // }
          //             // else {
          //             //   Get.snackbar(
          //             //     "title",
          //             //     "content",
          //             //   );
          //             // }
          //           },
          //           child: Text(
          //             'ADD SKILS',
          //             style: TextStyle(color: Colors.white, fontSize: 16.0),
          //           ),
          //           //color: Colors.redAccent,
          //         )
          //       ],
          //     ),
          //     radius: 10.0);
          // Get.to(TodoScreen());
        },
      ),
      body: Obx(
        () => (_skillsListController.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : _skillsListController.viewSkilsReport?.skills == null
            ? Center(
          child: Text('No Data'),
        )
            :
        SizedBox(
          height: size.height*75,

          child:ListView.builder(
            shrinkWrap: true,
              itemCount: _skillsListController.viewSkilsReport?.skills.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text(
                    _skillsListController.viewSkilsReport!.skills[index].skillName.toString()
                  ),
                );
              }
          )
          // ListView.builder(
          //   shrinkWrap: true,
          //   itemBuilder: (context, index)
          //   =>
          //   //     Dismissible(
          //   //   key: UniqueKey(),
          //   //   background: Container(
          //   //     color: Colors.deepOrange,
          //   //     child: const Icon(
          //   //       Icons.delete,
          //   //       color: Colors.red,
          //   //     ),
          //   //   ),
          //   //   onDismissed: (_) {
          //   //     todoController.todos.removeAt(index);
          //   //     Get.snackbar('Remove!', "Task was succesfully Delete",
          //   //         snackPosition: SnackPosition.BOTTOM);
          //   //   },
          //   //   child:
          //   ListTile(
          //       //selectedTileColor: Colors.red,
          //
          //       title: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             todoController.todos[index].text!,
          //             style: todoController.todos[index].done
          //                 ? const TextStyle(
          //                     color: Colors.red,
          //                     decoration: TextDecoration.lineThrough,
          //                   )
          //                 : const TextStyle(
          //                     color: Colors.black,
          //                   ),
          //           ),
          //           Divider(),
          //         ],
          //       ),
          //   //
          //   //     // trailing: IconButton(
          //   //     //   onPressed: () => Get.to(() => TodoEdit(index: index)),
          //   //     //   icon: const Icon(Icons.edit),
          //   //     // ),
          //   //     // leading: Checkbox(
          //   //     //   value: todoController.todos[index].done,
          //   //     //   onChanged: (neWvalue) {
          //   //     //     var todo = todoController.todos[index];
          //   //     //     todo.done = neWvalue!;
          //   //     //     todoController.todos[index] = todo;
          //   //     //   },
          //   //     // ),
          //   //   ),
          //   // ),
          //   //itemCount: todoController.todos.length,
          // ),
        ),
      ),
    );
  }
}
