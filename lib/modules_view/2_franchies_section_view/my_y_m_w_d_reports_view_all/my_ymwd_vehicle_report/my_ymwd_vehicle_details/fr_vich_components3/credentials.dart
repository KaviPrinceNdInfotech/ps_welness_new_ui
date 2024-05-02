import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';

// import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';

import '../../../../../../controllers/2_franchises_controller/my_ymwd_report_controller/my_ymwd_report_vehicle_controller.dart';

class MyYmwdreportVehicleeCredential extends StatelessWidget {
  MyYmwdreportVehicleeCredential({Key? key}) : super(key: key);

  YmwdVehicleController _ymwd_vehicle_controller =
      Get.put(YmwdVehicleController());

  var items = [
    'Daily',
    'Monthly',
    'Yearly',
    'Weekly',
  ];

  get newvalue => null!;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          Form(
            key: _ymwd_vehicle_controller.ymwdvehicleformkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.032),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        height: size.height * 0.035,
                        width: size.width * 0.07,
                        decoration: const BoxDecoration(
                            color: Colors.white70, shape: BoxShape.circle),
                        child: const Center(
                            child: Icon(Icons.arrow_back_ios_outlined))),
                  ),
                  SizedBox(
                    height: size.width * 0.05,
                  ),
                  Text(
                    'VEHICLE!',
                    style: GoogleFonts.alatsi(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff023382)),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  NeumorphicTextFieldContainer(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.01),
                      child: Obx(
                        () => DropdownButtonFormField(
                            value: _ymwd_vehicle_controller.selectedTerm.value,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.list_alt,
                                color: Colors.black,
                              ),
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                            hint: Text('Select Any'),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.height * 0.015,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              _ymwd_vehicle_controller.selectedTerm.value =
                                  newValue!;
                              _ymwd_vehicle_controller
                                  .frenchiesYMDWVehicleReportApi(newValue);
                            }),
                      ),
                    ),
                  ),
                  SizedBox(
                      //height: size.height * 0.0,
                      ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30.0)),
                            color: MyTheme.containercolor14),
                        width: size.width * 0.72,
                        height: size.height * 0.06,
                        margin: EdgeInsets.fromLTRB(1, 20, 10, 20),
                        padding: new EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(splashColor: Colors.transparent),
                          child: TextField(
                            onChanged: (value) => _ymwd_vehicle_controller
                                .filterPaymentNurse(value),
                            autofocus: false,
                            style: TextStyle(
                                fontSize: 15.0, color: MyTheme.blueww),
                            decoration: InputDecoration(
                              //prefixIcon: Icon(Icons.search),
                              filled: true,
                              fillColor: MyTheme.ThemeColors,
                              hintText: 'Search van number',
                              contentPadding: const EdgeInsets.only(
                                  left: 10.0, bottom: 12.0, top: 0.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: MyTheme.ThemeColors),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height * 0.06,
                        width: size.width * 0.15,
                        decoration: BoxDecoration(
                          //color: MyTheme.blueww,
                          gradient: MyTheme.gradient2,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                            child: Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.035,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
