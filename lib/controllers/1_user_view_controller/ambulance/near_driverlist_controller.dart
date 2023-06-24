import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DriverlistnearController extends GetxController {
  RxBool isLoading = true.obs;

  // DriverListApi? driverlist;

  ///todo:get..list..ambulancde..get..post..same..api...........
  //
  // void nearlistdriverApi() async {
  //   isLoading(true);
  //   driverlist = await ApiProvider.DrivernearListApi();
  //   if (driverlist?.message != null) {
  //     isLoading(false);
  //     // foundneardriver.value = driverlist!.message!;
  //   }
  // }

  @override
  void onInit() {
    // nearlistdriverApi();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
