import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OptionsControllerfr extends GetxController {
  RxBool isOptionSelected1 = false.obs;
  RxBool isOptionSelected2 = false.obs;
  RxBool isOptionSelected3 = false.obs;
  RxBool isOptionSelected4 = false.obs;
  RxBool isOptionSelected5 = false.obs;

  Future<void> resetSelection1() async {
    isOptionSelected1.value = false;
  }

  Future<void> selectOption1() async {
    isOptionSelected1.value = true;
  }

  ///2

  void resetSelection2() {
    isOptionSelected2.value = false;
  }

  Future<void> selectOption2() async {
    isOptionSelected2.value = true;
  }

  ///3
  void resetSelection3() {
    isOptionSelected3.value = false;
  }

  Future<void> selectOption3() async {
    isOptionSelected3.value = true;
  }

  ///4
  void resetSelection4() {
    isOptionSelected4.value = false;
  }

  Future<void> selectOption4() async {
    isOptionSelected4.value = true;
  }

  ///5
  void resetSelection5() {
    isOptionSelected5.value = false;
  }

  Future<void> selectOption5() async {
    isOptionSelected5.value = true;
  }
}
