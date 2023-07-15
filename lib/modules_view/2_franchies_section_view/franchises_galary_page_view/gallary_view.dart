import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchies_getGallery_controller.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchises_galary_page_view/galary_components/credentials.dart';
import 'package:shared_preferences/shared_preferences.dart';
class FranchisesgalaryPage extends StatelessWidget {
  FrenchiesGetGalleryController frenchiesGetGalleryController = Get.put(FrenchiesGetGalleryController());
  final img = 'http://test.pswellness.in/Images/';
  callAllCoins(){
    frenchiesGetGalleryController.FrenchiesGetGalleryApi();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            lightPrimary,
            darkPrimary,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: size.height * 0.0,
                  right: -size.width * 0.2,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.3,
                      width: size.width * 0.75,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/background_stack_png/galary.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.03),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              height: size.height * 0.03,
                              width: size.width * 0.1,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white70,
                              ),
                              child: Icon(
                                Icons.arrow_back_ios_outlined,
                                size: size.height * 0.022,
                                color: MyTheme.blueww,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Text(
                            'Add Gallery',
                            style: GoogleFonts.alatsi(
                                fontSize: size.height * 0.032,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff023382)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    franchiesGalarryCredentials(),
                        Obx(()=> frenchiesGetGalleryController.isLoading.value
                            ? Center(child: CircularProgressIndicator(),)
                          : SizedBox(
                            height: size.height * 0.7,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: frenchiesGetGalleryController.getfranchiseGetGalleryModel?.gallery?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var item = frenchiesGetGalleryController.getfranchiseGetGalleryModel?.gallery;
                                  var id = item?[index].id;
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03,
                                        vertical: size.height * 0.0005),
                                    child: Container(
                                      height: size.height * 0.25,
                                      margin: EdgeInsets.symmetric(vertical: 30 / 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(-0, -0),
                                            spreadRadius: 0,
                                            blurRadius: 0,
                                            color: Colors.pink.shade900,
                                          ),
                                          BoxShadow(
                                            offset: Offset(3, 3),
                                            spreadRadius: 0,
                                            blurRadius: 0,
                                            color: Colors.pink.shade800,
                                          ),
                                        ],
                                      ),
                                      child: Container(
                                        height: size.height * 0.24,
                                        width: double.infinity,
                                        margin: EdgeInsets.symmetric(
                                            vertical: size.width * 0.0 / 05),
                                        decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xffffffff),
                                                  Color(0xffF0FFF0)
                                                ]),
                                            borderRadius: BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(-0, -0),
                                                spreadRadius: 0,
                                                blurRadius: 0,
                                                color: Colors.green.shade200,
                                              ),
                                              BoxShadow(
                                                offset: Offset(3, 3),
                                                spreadRadius: 2,
                                                blurRadius: 0,
                                                color: Colors.blue.shade700,
                                              ),
                                            ]),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.01),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: size.height * 0.22,
                                                width: size.width * 0.6,
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius: BorderRadius.circular(10),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          '$img${item?[index].images}'),
                                                        fit: BoxFit.cover),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.black38,
                                                        offset: Offset(3, 3),
                                                        blurRadius: 0,
                                                        spreadRadius: 0,
                                                      ),
                                                      BoxShadow(
                                                        color: Colors.white,
                                                        offset: Offset(-1, -1),
                                                        blurRadius: 1,
                                                        spreadRadius: 1,
                                                      ),
                                                    ]),
                                                child: Center(
                                                  child: Text('',
                                                    style: GoogleFonts.roboto(
                                                      fontSize: size.width * 0.050,
                                                      fontWeight: FontWeight.w600,
                                                      color: MyTheme.blueww,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: [
                                                  Container(
                                                    height: size.height * 0.11,
                                                    width: size.width * 0.3,
                                                    padding: const EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey[300],
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color: Colors.blue,
                                                            offset: Offset(3, 3),
                                                            blurRadius: 0,
                                                            spreadRadius: 0,
                                                          ),
                                                          BoxShadow(
                                                            color: Colors.white,
                                                            offset: Offset(-1, -1),
                                                            blurRadius: 1,
                                                            spreadRadius: 1,
                                                          ),
                                                        ]),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Image Name:',
                                                          overflow:
                                                              TextOverflow.ellipsis,
                                                          maxLines: 2,
                                                          style: GoogleFonts.roboto(
                                                            fontSize:
                                                                size.width * 0.04,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: MyTheme.blueww,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: size.height * 0.01,
                                                        ),
                                                        Text(
                                                          '${item?[index].imageName}',
                                                          overflow: TextOverflow.ellipsis,
                                                          maxLines: 3,
                                                          style: GoogleFonts.roboto(
                                                            fontSize:
                                                                size.width * 0.033,
                                                            fontWeight: FontWeight.w600,
                                                            color: Colors.grey.shade900,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.01,
                                                  ),
                                                  GestureDetector(
                                                    onTap: ()async{
                                                      frenchiesGetGalleryController.frenchiesDeleteGallery(id!);
                                                      Timer(const Duration(seconds: 1), () => callAllCoins());
                                                    },
                                                    child: Container(
                                                      height: size.height * 0.06,
                                                      width: size.width * 0.16,
                                                      padding: const EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey[300],
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              color: Colors.red,
                                                              offset: Offset(3, 3),
                                                              blurRadius: 0,
                                                              spreadRadius: 0,
                                                            ),
                                                            BoxShadow(
                                                              color: Colors.white,
                                                              offset: Offset(-1, -1),
                                                              blurRadius: 1,
                                                              spreadRadius: 1,
                                                            ),
                                                          ]),
                                                      child: Center(
                                                        child: Text(
                                                          'Delete',
                                                          overflow:
                                                              TextOverflow.ellipsis,
                                                          maxLines: 1,
                                                          style: GoogleFonts.roboto(
                                                            fontSize:
                                                                size.width * 0.033,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        // child: child,
                                      ),
                                    ),
                                  );
                                })),
                        ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
