import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';

///import 'package:ps_welness_new_ui/controllers/5_rwa_controller/rwaBanner_controller.dart';
import 'package:ps_welness_new_ui/modules_view/5_rwa_section_view_RRR/rwa_drawer_view/drawerpage.dart';
import 'package:ps_welness_new_ui/modules_view/5_rwa_section_view_RRR/rwa_home/rwaSlidersss.dart';
import 'package:ps_welness_new_ui/modules_view/5_rwa_section_view_RRR/rwa_patient_list/rwa_patient_list.dart';
import 'package:ps_welness_new_ui/modules_view/5_rwa_section_view_RRR/rwa_payment_history/rwa_payment_history.dart';
import 'package:ps_welness_new_ui/modules_view/5_rwa_section_view_RRR/rwa_profile_page_view/profile_view.dart';
import 'package:ps_welness_new_ui/modules_view/5_rwa_section_view_RRR/rwa_update_bank_details/bank_update_view.dart';

import '../../../controllers/5_rwa_controller_RRR/rwaBanner_controller.dart';
import '../../../widgets/exit_popup_warning/exit_popup.dart';
import '../rwa_payout_history/rwa_payout_histories.dart';
import '../rwa_user_views/rwa_add_patient.dart';

class RwaHomePage extends StatelessWidget {
  RwaHomePage({Key? key}) : super(key: key);
  RwaBannerController _rwaBannerController = Get.put(RwaBannerController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GlobalKey<ScaffoldState> _key = GlobalKey();

    final List<String> productname = [
      'Add Patient',
      'Update Bank Details',
      'Patient List',
      'My Payment Report',
      'My Payout Report',
      'Manage Profile'
    ];

    final List<String> underprocess = [
      '',
      '',
      '',
      '',
      '',
      '',
    ];

    List<Color> colors = [
      Color(0xff11eae0),
      Color(0xffe68cf7),
      Colors.yellow,
      Colors.lightGreenAccent,
      Colors.lightGreen
    ];

    final List<String> productimage = [
      'lib/assets/icons/rwa_patient.png',
      'lib/assets/icons/rwabank2.png',
      'lib/assets/icons/rwapatientlist.png',
      'lib/assets/icons/rwapayreport.png',
      'lib/assets/icons/rwapyout.png',
      'lib/assets/icons/rwauser.png',
    ];
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              lightPrimary,
              darkPrimary,
            ])),
        child: Scaffold(
          key: _key,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              children: [
                Container(
                    height: size.height * 0.045,
                    width: size.width * 0.11,
                    child: Image.asset('lib/assets/icons/rwa.png')),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'PS WELLNESS',
                        style: GoogleFonts.poppins(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          //color: Color(0xff023382)
                        ),
                      ),
                      TextSpan(
                        text: ' RWA',
                        style: GoogleFonts.alatsi(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: MyTheme.containercolor5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            //MyTheme.ThemeColors,
            leading: IconButton(
              icon: const Icon(
                Icons.dehaze_rounded,
                size: 23,
                color: Colors.white,
              ),
              onPressed: () {
                _key.currentState!.openDrawer();
              },
            ),
          ),
          drawer: RwaMainDrawer(),
          body: Obx(
            () => (_rwaBannerController.isLoading.value)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: size.height * 0.28,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: MySliderwa(),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.001,
                              horizontal: size.width * 0.01),
                          child: Container(
                            height: size.height * 0.585,
                            decoration: BoxDecoration(),
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: size.height * 0.25,
                                  mainAxisExtent: size.height * 0.188,
                                  childAspectRatio: 4 / 3,
                                  crossAxisSpacing: 4,
                                  mainAxisSpacing: 8,
                                ),
                                itemCount: productname.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return Container(
                                    height: size.height * 0.08,
                                    //width: double.,
                                    margin: EdgeInsets.symmetric(
                                        vertical: size.height * 0.00131,
                                        horizontal: size.width * 0.01),
                                    decoration: BoxDecoration(
                                        color: Color(0xff11eae0),
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(-0, -0),
                                            spreadRadius: 0,
                                            blurRadius: 0,
                                            color: Colors.grey.shade100,
                                          ),
                                          BoxShadow(
                                            offset: Offset(3, 3),
                                            spreadRadius: 0,
                                            blurRadius: 0,
                                            color: Colors.grey.shade300,
                                          ),
                                        ]),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: size.height * 0.000,
                                          horizontal: size.width * 0.000),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              underprocess[index],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: GoogleFonts.abhayaLibre(
                                                fontSize: size.height * 0.016,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (index == 0) {
                                                Get.to(() => RwaaaAddPatient());
                                              } else if (index == 1) {
                                                Get.to(() =>
                                                    UpdateRwaBankDetail());
                                              } else if (index == 2) {
                                                Get.to(() => RwaPatientList());
                                              } else if (index == 3) {
                                                Get.to(
                                                    () => RwaPaymentHistory());
                                              } else if (index == 4) {
                                                Get.to(
                                                    () => RwaPayoutHistory());
                                              } else if (index == 5) {
                                                Get.to(() => RwaProfilePage());
                                              } else if (index == 6) {
                                              } else if (index == 7) {}
                                            },
                                            child: Container(
                                              height: size.height * 0.11,
                                              width: size.width * 0.23,
                                              padding: EdgeInsets.all(7),
                                              child: Image.asset(
                                                productimage[index],
                                              ),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          Colors.grey.shade300,
                                                      //color: Color(0xFFBEBEBE),
                                                      offset: Offset(03, 03),
                                                      blurRadius: 0,
                                                      spreadRadius: 0,
                                                    ),
                                                    const BoxShadow(
                                                      color: Colors.white,
                                                      offset: Offset(-02, -02),
                                                      blurRadius: 0,
                                                      spreadRadius: 0,
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.005,
                                          ),
                                          Container(
                                            height: size.height * 0.033,
                                            decoration: BoxDecoration(
                                                color: Color(0xffffffff)
                                                    .withOpacity(0.999),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                )),
                                            child: Center(
                                              child: Text(
                                                productname[index],
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: GoogleFonts.abhayaLibre(
                                                  fontSize: size.height * 0.018,
                                                  letterSpacing: 0.5,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // child: child,
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

// class Mycrusial extends StatelessWidget {
//   RwaBannerController _rwaBannerController = Get.put(RwaBannerController());
//   final _sliderKey = GlobalKey();
//   Mycrusial({Key? key}) : super(key: key);
//
//   final List<Color> colors = [
//     Colors.red,
//     Colors.orange,
//     Colors.yellow,
//     Colors.green,
//     Colors.blue,
//     Colors.indigo,
//     Colors.purple,
//   ];
//
//   final List<String> images = [
//     'https://media.istockphoto.com/id/1207168332/photo/adult-and-children-hands-holding-paper-family-cutout-family-home-foster-care-homeless-charity.jpg?b=1&s=170667a&w=0&k=20&c=nLT8wduB3SKjWp8WQYa2hW28vckCqFyMwNpteoFq_mA=',
//     'https://images.unsplash.com/photo-1531431057391-da7a1aabd412?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',
//     'https://images.unsplash.com/photo-1577896851905-dc99e1f8b4b9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
//     'https://images.unsplash.com/photo-1532619675605-1ede6c2ed2b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
//     'https://images.unsplash.com/photo-1536064479547-7ee40b74b807?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=600&q=60',
//   ];
//   final bool _isPlaying = true;
//
//   //get _sliderKey => null;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     var base = 'http://test.pswellness.in/Images/';
//
//     //var imgpath = 'http://test.pswellness.in/Images';
//     return Scaffold(
//       body: Obx(
//         () => _rwaBannerController.isLoading.isFalse
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Container(
//                   height: size.height * 0.28,
//                   width: size.width,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Center(
//                     child: Material(
//                       color: MyTheme.ThemeColors,
//                       borderRadius: BorderRadius.circular(10),
//                       elevation: 0,
//                       child: CarouselSlider.builder(
//                         key: _sliderKey,
//                         unlimitedMode: true,
//                         autoSliderTransitionTime: Duration(seconds: 1),
//                         slideBuilder: (index) {
//                           // final items = _rwaBannerController
//                           //     .getRwaBannerModel?.bannerImageList;
//                           // print('###################: ${items?[index]}');
//                           return Padding(
//                               padding: const EdgeInsets.all(7.0),
//                               child: Material(
//                                 elevation: 12,
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: Container(
//                                   height: size.height * 38,
//                                   width: size.width,
//                                   alignment: Alignment.center,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all(
//                                         color: Colors.white, width: 3),
//                                     image: DecorationImage(
//                                       image: NetworkImage(
//                                         base +
//                                             '${_rwaBannerController.getRwaBannerModel!.bannerImageList![index].bannerPath.toString()}',
//
//                                         // 'http://test.pswellness.in/Images/${items?[index].bannerPath}'
//                                         // 'http://test.pswellness.in/Images/${items?[index].bannerPath}'),
//                                         // fit: BoxFit.fill
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ));
//                         },
//                         slideTransform: DefaultTransform(),
//                         slideIndicator: CircularSlideIndicator(
//                           indicatorBorderWidth: 2,
//                           indicatorRadius: 4,
//                           itemSpacing: 15,
//                           currentIndicatorColor: Colors.white,
//                           padding: EdgeInsets.only(bottom: 0),
//                         ),
//                         itemCount: _rwaBannerController
//                             .getRwaBannerModel!.bannerImageList!.length,
//                         //4, //_rwaBannerController.getRwaBannerModel!.bannerImageList!.length,
//                         enableAutoSlider: true,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//       ),
//     );
//   }
// }

///...........
///
