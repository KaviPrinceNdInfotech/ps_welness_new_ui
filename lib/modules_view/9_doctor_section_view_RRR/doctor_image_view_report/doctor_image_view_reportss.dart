import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_view_report1_controller/doctor_viewreport_controller.dart';
import 'package:ps_welness_new_ui/widgets/widgets/constant_string.dart';

class DoctorReportImageView extends StatelessWidget {
  DoctorreportviewController _doctorreportviewController =
      Get.put(DoctorreportviewController());
  final List item = [
    "https://www.thenewsminute.com/sites/all/var/www/images/dhanush%20medical%20report(1).jpeg",
    "https://www.thenewsminute.com/sites/all/var/www/images/dhanush%20medical%20report(1).jpeg"
  ];
  @override
  Widget build(BuildContext context) {
    /// var base = 'http://test.pswellness.in/Images/';

    ///  //IMAGE_BASE_URL
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Doctor Report View"),
      ),
      body: Obx(
        () => (_doctorreportviewController.isLoading.value)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : _doctorreportviewController
                        .doctorImageviewModel?.doctorViewReportFile ==
                    null
                ? Center(
                    child: Text("No List"),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                            itemCount: _doctorreportviewController
                                .doctorImageviewModel
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
                                    '$IMAGE_BASE_URL${_doctorreportviewController.doctorImageviewModel?.doctorViewReportFile?[index].image1.toString()}',
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
