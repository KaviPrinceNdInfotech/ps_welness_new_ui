import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/report_controller/doctor_report_user_controller.dart';

class DoctorUserReportView extends StatelessWidget {
  DoctorreportuserviewController _doctorreportuserviewController =
      Get.put(DoctorreportuserviewController());
  final List item = [
    "https://www.thenewsminute.com/sites/all/var/www/images/dhanush%20medical%20report(1).jpeg",
    "https://www.thenewsminute.com/sites/all/var/www/images/dhanush%20medical%20report(1).jpeg"
  ];
  @override
  Widget build(BuildContext context) {
    var base = 'http://test.pswellness.in/Images/';
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Report View"),
      ),
      body: Obx(
        () => (_doctorreportuserviewController.isLoading.value)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : _doctorreportuserviewController
                        .doctorReportUserImage?.doctorViewReportFile ==
                    null
                ? Center(
                    child: Text("No List"),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                            itemCount: _doctorreportuserviewController
                                .doctorReportUserImage
                                ?.doctorViewReportFile
                                ?.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    top: 10.0, left: 2, right: 2),
                                child: Container(
                                  height: size.height * 0.8,
                                  width: double.infinity * 0.8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.cyan,
                                      border: Border.all(
                                          color: Colors.black12, width: 4)),
                                  child: Image.network(
                                    base +
                                        '${_doctorreportuserviewController.doctorReportUserImage?.doctorViewReportFile?[index].image1.toString()}',
                                    //base+'${_userhomePageController.banerlistmodel!.bannerImageList![index].toString()}',
                                    fit: BoxFit.fill,
                                    errorBuilder: (context, error, stackTrace) {
                                      //if image not comming in catagary then we have to purchase

                                      return Center(
                                        child: Text(
                                          'No Image',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.height * 0.013,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  ),
      ),
    );
  }
}
