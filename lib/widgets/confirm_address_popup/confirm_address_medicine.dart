import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/1_user_view_controller/medicine_controllers/add_delivery_post_controller.dart';
import '../../controllers/1_user_view_controller/medicine_controllers/medicine_address_controller/medicine_address_controller.dart';
import '../../modules_view/1_user_section_views/medicine_view/medicine_address_list/medicine_address_list_view.dart';
import '../../utils/services/account_service.dart';

Future<bool> showConfirmAddressPopup(context) async {
  MedicineAddressController _medicine_address_controller =
      Get.put(MedicineAddressController());
  medicine_addresssList_Controller _medicine_addresslist_controller =
      Get.put(medicine_addresssList_Controller());
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Do you want to save this address?",
                  textDirection: TextDirection.ltr,
                  style: GoogleFonts.oswald(
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        print('no selected');
                        Navigator.of(context).pop();
                      },
                      child:
                          Text("Cancel", style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                    )),
                    SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          _medicine_address_controller.addmedicineaddressApi();
                          //_medicine_address_controller.refresh();
                          //_medicine_address_controller.onInit();
                          _medicine_address_controller.checkaddressmedicine();
                          _medicine_addresslist_controller
                              .medicineaddressListApi();
                          _medicine_addresslist_controller.update();
                          await accountService.getAccountData
                              .then((accountData) {
                            Timer(
                              const Duration(seconds: 2),
                              () {
                                // labcheckoutApi();
                                Get.offAll(Medicineaddresslist());

                                //Get.to((page))
                                ///
                              },
                            );
                          });
                          print('yes selected');
                          //exit(0);
                        },
                        child: Text("Save"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green.shade800),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
