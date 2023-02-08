import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/modules_view/doctor_appointment_details/doctors_lists/doctor_list_appointment.dart';

class DriverAppointmentDetails extends StatelessWidget {
  DriverAppointmentDetails({Key? key}) : super(key: key);

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
      decoration: BoxDecoration(
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
                                decoration: BoxDecoration(
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
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                        ),
                      ),
                      decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(30.0)),
                          color: Colors.white),
                      width: size.width,
                      // height: size.height * 0.06,
                      margin: new EdgeInsets.fromLTRB(10, 20, 15, 20),
                      padding: new EdgeInsets.fromLTRB(7, 6, 8, 8),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.74,
              child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              'https://images.unsplash.com/photo-1532004252750-b411a84c8a41?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRyaXZlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60'
                                              // 'https://images.unsplash.com/photo-1599493758267-c6c884c7071f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80'
                                              ),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.37,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Ram Kumar',
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
                                      'Noida Sector 6 C53 110886 UP',
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.calendar_today),
                                  Text(
                                    '07 Nov 2022',
                                    style: TextStyle(
                                      fontSize: size.height * 0.016,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  //Spacer(),
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
          ],
        ),
      ),
    );
  }
}
//#00caf7
