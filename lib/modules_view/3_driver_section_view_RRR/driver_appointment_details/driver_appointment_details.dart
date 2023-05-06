import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';

import '../../../controllers/3_driver_view_controllers_RRR/driver_appoinment_details_controller/driver_appoinment_details_controller.dart';
//import 'package:ps_welness_new_ui/controllers/3_driver_view_controllers/driver_appoinment_details_controller/driver_appoinment_details_controller.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/modules_view/doctor_appointment_details/doctors_lists/doctor_list_appointment.dart';

class DriverAppointmentDetails extends StatelessWidget {
  DriverAppointmentDetails({Key? key}) : super(key: key);
  DriverAppoinmentDetailController _driverAppoinmentDetailController =
      Get.put(DriverAppoinmentDetailController());
  final List<String> doctorcatagary = [
    'Cardiologist',
    'Audiologist',
    'Dentist',
    'ENT',
    'Gynaecologist',
    'Orthopaedic s',
    'Paediatrician',
    'Psychiatrists',
    'Veterinarian',
    'Radiologist',
    'Pulmonologist',
    'Endocrinologist',
    'Neurologist',
    'Veterinarian',
    'Cardiothoracic',
  ];

  final List<String> catimage = [
    'lib/assets/icons/cat1.png',
    'lib/assets/icons/cat2.png',
    'lib/assets/icons/cat3.png',
    'lib/assets/icons/cat4.png',
    'lib/assets/icons/cat5.png',
    'lib/assets/icons/cat6.png',
    'lib/assets/icons/cat7.png',
    'lib/assets/icons/cat8.png',
    'lib/assets/icons/cat9.png',
    'lib/assets/icons/cat10.png',
    'lib/assets/icons/cat11.png',
    'lib/assets/icons/cat12.png',
    'lib/assets/icons/cat13.png',
    'lib/assets/icons/cat14.png',
    'lib/assets/icons/cat15.png',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            lightPrimary,
            darkPrimary,
          ])),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 4,
              child: Container(
                height: size.height * 0.23,
                decoration: BoxDecoration(
                  color: MyTheme.ThemeColors,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.075,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                                height: size.height * 0.035,
                                width: size.width * 0.08,
                                decoration: const BoxDecoration(
                                  color: Colors.white70,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios_outlined,
                                  size: size.height * 0.025,
                                )),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text(
                            'See Your upcoming Booking',
                            style: TextStyle(
                              color: MyTheme.blueww,
                              fontSize: size.width * 0.045,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * 0.06,
                      decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(30.0)),
                          color: Colors.white),
                      width: size.width,
                      // height: size.height * 0.06,
                      margin: new EdgeInsets.fromLTRB(10, 20, 15, 20),
                      padding: new EdgeInsets.fromLTRB(7, 6, 8, 8),
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(splashColor: Colors.transparent),
                        child: TextField(
                          autofocus: false,
                          style:
                              TextStyle(fontSize: 15.0, color: MyTheme.blueww),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search name',
                            contentPadding: const EdgeInsets.only(
                                left: 10.0, bottom: 1.0, top: 0.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => _driverAppoinmentDetailController.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      height: size.height * 0.74,
                      child: ListView.builder(
                          itemCount: _driverAppoinmentDetailController
                              .getDriverAppointmentDetail?.length,
                          itemBuilder: (BuildContext context, int index) {
                            var items = _driverAppoinmentDetailController
                                .getDriverAppointmentDetail;
                            var now = items?[0].joiningDate;
                            var formatter = DateFormat('dd-MM-yyyy');
                            String date = formatter.format(now!);
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.005,
                                  horizontal: size.width * 0.01),
                              child: Material(
                                elevation: 5,
                                child: Container(
                                  height: size.height * 0.13,
                                  decoration: BoxDecoration(
                                    color: MyTheme.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.02),
                                        child: Material(
                                          elevation: 9,
                                          child: Container(
                                            width: size.width * 0.25,
                                            height: size.height * 0.11,
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                border: Border.all(
                                                    color: Colors.cyanAccent,
                                                    width: 1.3),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      '${items?[index].dlImage}'),
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.37,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              '${items?[index].driverName}',
                                              style: TextStyle(
                                                fontSize: size.height * 0.02,
                                                fontWeight: FontWeight.w800,
                                                color: MyTheme.blueww,
                                              ),
                                            ),
                                            Text(
                                              'Ambulance Driver',
                                              style: TextStyle(
                                                fontSize: size.height * 0.016,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.red.shade300,
                                              ),
                                            ),
                                            //Spacer(),
                                            Text(
                                              '${items?[index].location}',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: size.height * 0.015,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Icon(Icons.calendar_today),
                                          Text(
                                            date,
                                            style: TextStyle(
                                              fontSize: size.height * 0.016,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            '03 am',
                                            style: TextStyle(
                                              fontSize: size.height * 0.017,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
