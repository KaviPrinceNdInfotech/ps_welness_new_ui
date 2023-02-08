import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
//import 'package:ps_welness/constants/my_theme.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            // SizedBox(
            //   height: size.height * 0.02,
            // ),
            Container(
              height: size.height * 0.17,
              color: Color(0xff11f2ec),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.04),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios_outlined,
                                color: MyTheme.blueww,
                                size: size.height * 0.027,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Text(
                              'Doctors',
                              style: GoogleFonts.nunitoSans(
                                fontSize: size.width * 0.06,
                                color: MyTheme.blueww,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
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
                            hintText: 'Search',
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
                      decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(30.0)),
                          color: Colors.white),
                      width: size.width * 0.9,
                      height: size.height * 0.06,
                      margin: new EdgeInsets.fromLTRB(20, 20, 20, 210),
                      padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: size.height * 0.0001,
            ),

            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.01,
                          vertical: size.height * 0.003),
                      child: InkWell(
                        onTap: () {
                          Get.to(() => DoctorList());
                        },
                        child: Padding(
                          padding: EdgeInsets.all(size.height * 0.005),
                          child: Container(
                            height: size.height * 0.15,
                            width: size.width * 0.15,
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.005),
                            decoration: BoxDecoration(
                                color: Color(0xff11f2ec),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(3, 4),
                                    blurRadius: 0,
                                    spreadRadius: 0,
                                  ),
                                  const BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, -0),
                                    blurRadius: 0,
                                    spreadRadius: 0,
                                  ),
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: size.width * 0.24,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        //catimage[index], height: size.height * 0.08,
                                        //productimage[index],
                                        "lib/assets/icons/doctor1.png",
                                        height: size.height * 0.12,
                                      ),
                                      Text(
                                        'Fees: ₹  200',
                                        //doctorcatagary[index],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.bold,
                                          color: MyTheme.blueww,
                                          fontSize: size.width * 0.04,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.06,
                                ),
                                SizedBox(
                                  width: size.width * 0.6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Kumar Prince',
                                        //doctorcatagary[index],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: MyTheme.blueww,
                                          fontSize: size.height * 0.022,
                                        ),
                                      ),
                                      Text(
                                        'Cardiologist',
                                        //doctorcatagary[index],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade700,
                                          fontSize: size.height * 0.017,
                                        ),
                                      ),
                                      Text(
                                        'Experenced: 2 yr',
                                        //doctorcatagary[index],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: MyTheme.containercolor14,
                                          fontSize: size.height * 0.017,
                                        ),
                                      ),
                                      Spacer(),
                                      PhysicalModel(
                                        color: Colors.transparent,
                                        elevation: 1,
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          height: size.height * 0.045,
                                          width: size.width * 0.5,
                                          decoration: BoxDecoration(
                                            color: MyTheme.containercolor4,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Make an Appointment',
                                              //doctorcatagary[index],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                color: MyTheme.white,
                                                fontSize: size.height * 0.017,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.004,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
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
