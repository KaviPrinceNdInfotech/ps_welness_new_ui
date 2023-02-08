import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/constants/constants.dart';
import '../../../../../constants/my_theme.dart';
import '../../../../../controllers/1_user_view_controller/drawer_contoller/medicine_history_controller/medicine_history_controller.dart';

class MedicinrHistoryUser extends StatelessWidget {
  MedicinrHistoryUser({Key? key}) : super(key: key);

  MedicineHistoryController _medicineHistoryController =
      Get.put(MedicineHistoryController());

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
                    'Medicine History',
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
                      () => (_medicineHistoryController.isLoading.value)
                          ? Center(child: CircularProgressIndicator())
                          : TextField(
                              controller: _medicineHistoryController
                                  .appointmentController1,
                              onTap: () {
                                _medicineHistoryController.chooseDate();
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
            Obx(
                  () => (_medicineHistoryController.isLoading.value)
                  ? Center(child: CircularProgressIndicator())
                  : _medicineHistoryController.medicinelistmodel!.data ==
                  null
                  ? Center(
                child: Text('No List'),
              )
                  : SizedBox(
                  height: size.height * 0.72,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _medicineHistoryController.medicinelistmodel!.data.length,
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
                                        'https://images.unsplash.com/photo-1613843596852-9a6317dae0b8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1744&q=80'
                                        // 'https://images.unsplash.com/photo-1587854680352-936b22b91030?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fG1lZGljaW5lfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                                        // 'https://images.unsplash.com/photo-1628595351029-c2bf17511435?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fG1lZGljaW5lfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                                        ),
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
                                        image: NetworkImage(
                                            'https://images.unsplash.com/photo-1630094556251-2a1e50b60e7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjEyfHxtZWRpY2luZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
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
                                              'Medicine Name:',
                                              style: GoogleFonts.poppins(
                                                color: MyTheme.text1,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.width * 0.039,
                                              ),
                                            ),
                                            Text(
                                              'Medicine Type:',
                                              style: GoogleFonts.poppins(
                                                color: MyTheme.text1,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.width * 0.039,
                                              ),
                                            ),
                                            Text(
                                              'Medicine description:',
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
                                              'Medicine Company:',
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
                                              _medicineHistoryController.medicinelistmodel!.data[index].medicineName.toString(),
                                              //'Dolo 650      ',
                                              style: GoogleFonts.raleway(
                                                  color: Colors.cyanAccent,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: size.width * 0.039),
                                            ),
                                            Text(
                                              _medicineHistoryController.medicinelistmodel!.data[index].medicineTypeId.toString(),

                                              //'Nov 16,22     ',
                                              style: GoogleFonts.raleway(
                                                  color: Colors.cyanAccent,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: size.width * 0.039),
                                            ),
                                            Text(
                                              _medicineHistoryController.medicinelistmodel!.data[index].medicineDescription.toString(),

                                              //'Nov 20,22      ',
                                              style: GoogleFonts.raleway(
                                                  color: Colors.cyanAccent,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: size.width * 0.039),
                                            ),
                                            Text(
                                            "₹ ${ _medicineHistoryController.medicinelistmodel!.data[index].mrp.toString()}"

                                              ,
                                              //'Rs.200      ',
                                              style: GoogleFonts.raleway(
                                                  color: Colors.cyanAccent,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: size.width * 0.039),
                                            ),
                                            Text(
                                              _medicineHistoryController.medicinelistmodel!.data[index].brandName.toString(),
                                              //'Cipla     ',
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
            ),
          ],
        ),
      ),
    );
  }
}
