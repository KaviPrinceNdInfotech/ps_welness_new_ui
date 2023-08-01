import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/10_lab_controller/add_test_lab_controller/lab_test_add_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/skils_controller/skils_controllers.dart';
import 'package:ps_welness_new_ui/modules_view/10_lab_section_view/lab_drawer_view/drower_pages/lab_test_addtest/add_testt.dart';
import 'package:ps_welness_new_ui/modules_view/10_lab_section_view/lab_home/lab_home_page.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/utils/services/account_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LabtestListScreen extends StatelessWidget {
  LabtestListScreen({Key? key}) : super(key: key);
  static const id = '/Home_screen';
  SkillsListController _skillsListController = Get.put(SkillsListController());
  LabTestListController _labTestListController =
      Get.put(LabTestListController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool shouldPop = true;
    return WillPopScope(
      onWillPop: () async {
        //Get.offAll(LabHomePage());
        //Get.offAll(() => LabHomePage());
        Get.to(()=>LabHomePage());
        return shouldPop;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyTheme.ThemeColors,
          elevation: 0,
          title: Text('View Lab Test'),
          centerTitle: true,
          //centerTitle: true,
          leading: InkWell(
              onTap: () {
                Get.to(()=>LabHomePage());
              },
              child: Icon(Icons.arrow_back_ios_new_outlined)),
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: MyTheme.ThemeColors,
          child: const Icon(
            Icons.add,
          ),
          onPressed: () async {
            // Get.defaultDialog(
            //     backgroundColor: MyTheme.ThemeColors,
            //     title: '',
            //     content: Column(
            //       //mainAxisSize: MainAxisSize.min,
            //       children: [
            //         NeumorphicTextFieldContainer(
            //           child: TextFormField(
            //             maxLines: 1,
            //             autofillHints: [AutofillHints.name],
            //             controller: _skillsListController.skillsnameController,
            //             onSaved: (value) {
            //               _skillsListController.SkillName = value!;
            //             },
            //             validator: (value) {
            //               return _skillsListController.validskillss(value!);
            //             },
            //             //controller: textEditingController,
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
            //            // keyboardType: TextInputType.multiline,
            //             //maxLines: 1,
            //             autofocus: true,
            //             //obscureText: true,
            //             //controller: _loginpasswordController.mobileController,
            //           ),
            //         ),
            //         SizedBox(
            //           height: 30.0,
            //         ),
            //         RectangularButton(
            //             text: 'SUBMIT',
            //             press: () {
            //               CallLoader.loader();
            //               _skillsListController.checkSkills();
            //               //_loginpasswordController.checkLoginpassword();
            //               //Get.to(HomePage());
            //               //_loginpasswordController.checkLoginpassword();
            //             })
            //         // ElevatedButton(
            //         //   style: ElevatedButton.styleFrom(
            //         //     primary: Colors.red, // background
            //         //     onPrimary: Colors.yellow, // foreground
            //         //   ),
            //         //   onPressed: () {
            //         //     CallLoader.loader();
            //         //     _skillsListController.checkSkills();
            //         //
            //         //    // _skillsListController.skillsListApi();
            //         //     //_skillsListController.refresh();
            //         //     _skillsListController.update();
            //         //     //todoController.todos.add(
            //         //     //   Todo(
            //         //     //     text: textEditingController.text,
            //         //     //   ),
            //         //     //);
            //         //     Get.back();
            //         //     // if (
            //         //     // settingsScreenController
            //         //     //     .categoryNameController.text.isNotEmpty) {
            //         //     //   var expenseCategory = ExpenseCategory(
            //         //     //       settingsScreenController
            //         //     //           .categoryNameController.text,
            //         //     //       id: _addExpenseController.expenseCategories.length);
            //         //     //   settingsScreenController
            //         //     //       .addExpenseCategory(expenseCategory);
            //         //     //   _addExpenseController.expenseCategories
            //         //     //       .add(expenseCategory);
            //         //     //   Get.back();
            //         //     // }
            //         //     // else {
            //         //     //   Get.snackbar(
            //         //     //     "title",
            //         //     //     "content",
            //         //     //   );
            //         //     // }
            //         //   },
            //         //   child: Text(
            //         //     'ADD SKILS',
            //         //     style: TextStyle(color: Colors.white, fontSize: 16.0),
            //         //   ),
            //         //   //color: Colors.redAccent,
            //         // )
            //       ],
            //     ),
            //
            //     radius: 10.0);
            ///
            //_labTestListController.onInit();
            // _labTestListController.onInit();
            CallLoader.loader();
            await Future.delayed(Duration(seconds: 1));
            CallLoader.hideLoader();
            await SharedPreferences.getInstance()
                .then((value) => Get.to(AddTestPageLab()));
            //Get.to(AddTestPageLab());
            //_labTestListController.onInit();
            _labTestListController.getTestNameApi();
            //_labTestListController.dispose();
            _labTestListController.refresh();
            //_labTestListController.onClose();
          },
        ),

        ///
        body: Obx(
          () => (_labTestListController.isLoading.value)
              ? const Center(child: CircularProgressIndicator())
              : _labTestListController.labtestaddedlist?.labTest == null
                  ? Center(
                      child: Text('No Data'),
                    )
                  : SizedBox(
                      height: size.height * 7,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              //1,
                              _labTestListController
                                  .labtestaddedlist?.labTest?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                ListTile(
                                  leading: Text(
                                    // "okok",
                                    "${_labTestListController.labtestaddedlist?.labTest?[index].testName.toString()}",
                                    style: TextStyle(
                                      fontSize: size.height * 0.015,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  trailing: InkWell(
                                    onTap: () async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setString("TestaddedId",
                                          "${_labTestListController.labtestaddedlist?.labTest?[index].id.toString()}");
                                      Get.dialog(
                                        AlertDialog(
                                          title: const Text('Test'),
                                          content: const Text(
                                              'You Want To delete your Test?'),
                                          actions: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                TextButton(
                                                  child: const Text(
                                                    "Close",
                                                    style: TextStyle(
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                  onPressed: () => Get.back(),
                                                ),
                                                TextButton(
                                                    child: const Text(
                                                      "Confirm",
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    onPressed: () =>
                                                        accountService
                                                            .getAccountData
                                                            .then(
                                                                (accountData) {
                                                          Timer(
                                                            const Duration(
                                                                milliseconds:
                                                                    200),
                                                            () {
                                                              _labTestListController
                                                                  .labTestListApi();
                                                              //.skillsListApi();
                                                              _labTestListController
                                                                  .update();

                                                              ///calling delete api...
                                                              _labTestListController
                                                                  .deleteTestApi();
                                                              Get.to(() =>
                                                                  LabtestListScreen());
                                                              Get.back();

                                                              //Get.to((page))
                                                              ///
                                                            },
                                                          );
                                                        })
                                                    //Get.back(),
                                                    ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.delete_forever_outlined,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.cyan,
                                ),
                              ],
                            );
                          })
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
      ),
    );
  }
}
