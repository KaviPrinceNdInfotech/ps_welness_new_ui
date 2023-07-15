import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchies_getGallery_controller.dart';

class GallaryViewss extends StatelessWidget {
  GallaryViewss({Key? key}) : super(key: key);
  FrenchiesGetGalleryController frenchiesGetGalleryController = Get.put( FrenchiesGetGalleryController());
  final img = 'http://test.pswellness.in/Images/';
  callGalleryList(){
    frenchiesGetGalleryController.FrenchiesGetGalleryApi();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: MyTheme.ThemeColors,
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(()=> frenchiesGetGalleryController.isLoading.value
          ? Center(child: CircularProgressIndicator(),)
            : SingleChildScrollView(
            child: SafeArea(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -size.height * 0.043,
                    right: -size.width * 0.17,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: size.height * 0.23,
                        width: size.width * 0.65,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                  'lib/assets/background_stack_png/galarry.png',
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.03,
                            vertical: size.height * 0.01),
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
                              'Gallery',
                              style: GoogleFonts.alatsi(
                                  fontSize: size.height * 0.032,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff023382)),
                            ),
                          ],
                        ),
                      ),
                      //Spacer(),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  borderRadius:  BorderRadius.all(
                                       Radius.circular(30.0)),
                                  color: Colors.white70),
                              width: size.width * 0.45,
                              height: size.height * 0.06,
                              margin:  const EdgeInsets.fromLTRB(10, 20, 10, 20),
                              padding:  const EdgeInsets.fromLTRB(5, 8, 8, 8),
                              child: Theme(
                                data: Theme.of(context)
                                    .copyWith(splashColor: Colors.transparent),
                                child: TextField(
                                  onChanged: (value)=>  frenchiesGetGalleryController.filterPaymentNurse(value),
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 15.0, color: MyTheme.blueww),
                                  decoration: InputDecoration(
                                    //prefixIcon: Icon(Icons.search),
                                    filled: true,
                                    fillColor: Colors.white70,
                                    hintText: 'Enter Image Name',
                                    contentPadding: const EdgeInsets.only(
                                        left: 10.0, bottom: 14.0, top: 0.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            PhysicalModel(
                              color: Colors.green,
                              elevation: 10,
                              borderRadius: BorderRadius.circular(20),
                              shadowColor: Colors.grey,
                              child: Container(
                                height: size.height * 0.055,
                                width: size.width * 0.16,
                                decoration: BoxDecoration(
                                  color: MyTheme.white,
                                  //color: Colors.white70,
                                  //gradient: MyTheme.gradient1,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                    child: Text(
                                  'Search',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: size.width * 0.03,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      frenchiesGetGalleryController.data.value.isEmpty
                          ? Center(child: Text('No List'))
                          :
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: frenchiesGetGalleryController.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                 var item= frenchiesGetGalleryController.data;
                                 var id = item[index].id;
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
                                                  //darkPrimary,
                                                ]),
                                            borderRadius:
                                                BorderRadius.circular(12),
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
                                                color: Colors.yellow.shade900,
                                              ),
                                            ]),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.01),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: size.height * 0.22,
                                                width: size.width * 0.6,
                                                padding: const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    image:  DecorationImage(
                                                        image: NetworkImage(
                                                          '${img}${item?[index].images}'
                                                        ),
                                                        fit: BoxFit.cover),
                                                    boxShadow: const [
                                                       BoxShadow(
                                                        color: Colors.black,
                                                        // Color(0xFFBEBEBE),
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
                                                    '',
                                                    style: GoogleFonts.roboto(
                                                      fontSize:
                                                          size.width * 0.050,
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
                                                    padding: EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey[300],
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.blue.shade300,
                                                            offset: Offset(3, 3),
                                                            blurRadius: 0,
                                                            spreadRadius: 0,
                                                          ),
                                                          const BoxShadow(
                                                            color: Colors.white,
                                                            offset:
                                                                Offset(-1, -1),
                                                            blurRadius: 1,
                                                            spreadRadius: 1,
                                                          ),
                                                        ]),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Image Name:',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 2,
                                                          style:
                                                              GoogleFonts.roboto(
                                                            fontSize:
                                                                size.width * 0.04,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: MyTheme.blueww,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              size.height * 0.01,
                                                        ),
                                                        // Spacer(),
                                                        Text(
                                                          '${item?[index].imageName}',
                                                          overflow: TextOverflow.ellipsis,
                                                          maxLines: 3,
                                                          style: GoogleFonts.roboto(
                                                            fontSize: size.width * 0.033,
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
                                                  InkWell(
                                                    onTap: (){
                                                      frenchiesGetGalleryController.frenchiesDeleteGallery(id!);
                                                      Timer(const Duration(seconds: 1), () => callGalleryList());
                                                    },
                                                    child: Container(
                                                      height: size.height * 0.06,
                                                      width: size.width * 0.16,
                                                      padding: const EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey[300],
                                                          borderRadius: BorderRadius.circular(10),
                                                          boxShadow: const [
                                                             BoxShadow(
                                                              color: Colors.red,
                                                              offset: Offset(3, 3),
                                                              blurRadius: 0,
                                                              spreadRadius: 0,
                                                            ),
                                                             BoxShadow(
                                                              color: Colors.white,
                                                              offset:
                                                                  Offset(-1, -1),
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
                                                            //MyTheme.ThemeColors,
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
                                })
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

