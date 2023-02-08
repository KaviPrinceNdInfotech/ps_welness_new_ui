import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/constants/constants.dart';
import '../../../../../constants/my_theme.dart';
import '../../../../../controllers/1_user_view_controller/drawer_contoller/doctor_history_section/doctor_history_controller.dart';

class DoctorHistoryUser extends StatelessWidget {
  DoctorHistoryUser({Key? key}) : super(key: key);

  DoctorHistoryController _doctorHistoryController =
      Get.put(DoctorHistoryController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.height * 0.02),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      size: size.width * 0.05,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Text(
                    'Doctor History',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.02),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(splashColor: Colors.transparent),
                    child: Obx(
                      () => (_doctorHistoryController.isLoading.value)
                          ? Center(child: CircularProgressIndicator())
                          : TextField(
                              controller: _doctorHistoryController
                                  .appointmentController1,
                              onTap: () {
                                _doctorHistoryController.chooseDate();
                              },
                              autofocus: false,
                              style: TextStyle(
                                  fontSize: 15.0, color: MyTheme.blueww),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'dd-mm-yyyy',
                                contentPadding: const EdgeInsets.only(
                                    left: 10.0, bottom: 12.0, top: 0.0),
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
                  ),
                  decoration: new BoxDecoration(
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(30.0)),
                      color: Colors.white),
                  width: size.width * 0.72,
                  height: size.height * 0.06,
                  margin: new EdgeInsets.fromLTRB(15, 20, 10, 20),
                  padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                ),
                Container(
                  height: size.height * 0.06,
                  width: size.width * 0.2,
                  decoration: BoxDecoration(
                    color: MyTheme.blueww,
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
            SizedBox(
                height: size.height * 0.73,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.03,
                            vertical: size.height * 0.0005),
                        child: Container(
                          height: size.height * 0.33,
                          margin: EdgeInsets.symmetric(vertical: 30 / 6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    lightPrimary,
                                    darkPrimary,
                                  ]),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(-2, -2),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  color: darkShadow,
                                ),
                                BoxShadow(
                                  offset: Offset(2, 2),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  color: lightShadow,
                                ),
                              ],
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://images.unsplash.com/photo-1621619856624-42fd193a0661?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTJ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60'),
                                  fit: BoxFit.cover)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.1,
                                child: Container(
                                  height: size.height * 0.09,
                                  width: size.width * 0.16,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.shade200,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'lib/assets/background_stack_png/doctor20.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Doctor Name:',
                                            style: GoogleFonts.poppins(
                                              color: MyTheme.text1,
                                              fontWeight: FontWeight.w600,
                                              fontSize: size.width * 0.039,
                                            ),
                                          ),
                                          Text(
                                            'Service Date:',
                                            style: GoogleFonts.poppins(
                                              color: MyTheme.text1,
                                              fontWeight: FontWeight.w600,
                                              fontSize: size.width * 0.039,
                                            ),
                                          ),
                                          Text(
                                            'Service Time:',
                                            style: GoogleFonts.poppins(
                                              color: MyTheme.text1,
                                              fontWeight: FontWeight.w600,
                                              fontSize: size.width * 0.039,
                                            ),
                                          ),
                                          Text(
                                            'Paid Fees:',
                                            style: GoogleFonts.poppins(
                                              color: MyTheme.text1,
                                              fontWeight: FontWeight.w600,
                                              fontSize: size.width * 0.039,
                                            ),
                                          ),
                                          Text(
                                            'Location:',
                                            style: GoogleFonts.poppins(
                                              color: MyTheme.text1,
                                              fontWeight: FontWeight.w600,
                                              fontSize: size.width * 0.039,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Dr.Vineet Mishra',
                                            style: GoogleFonts.raleway(
                                                color: Colors.cyanAccent,
                                                fontWeight: FontWeight.w700,
                                                fontSize: size.width * 0.039),
                                          ),
                                          Text(
                                            'Nov 16,22 - Nov 20,22',
                                            style: GoogleFonts.raleway(
                                                color: Colors.cyanAccent,
                                                fontWeight: FontWeight.w700,
                                                fontSize: size.width * 0.039),
                                          ),
                                          Text(
                                            '22:37',
                                            style: GoogleFonts.raleway(
                                                color: Colors.cyanAccent,
                                                fontWeight: FontWeight.w700,
                                                fontSize: size.width * 0.039),
                                          ),
                                          Text(
                                            'Rs.500',
                                            style: GoogleFonts.raleway(
                                                color: Colors.cyanAccent,
                                                fontWeight: FontWeight.w700,
                                                fontSize: size.width * 0.039),
                                          ),
                                          Text(
                                            'B6 new ashok nagar delhi 110096',
                                            style: GoogleFonts.raleway(
                                                color: Colors.cyanAccent,
                                                fontWeight: FontWeight.w700,
                                                fontSize: size.width * 0.039),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
