import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/my_y_m_w_d_reports_view_all/my_ymwd_lab_details/fr_lab_components/labss_credentials.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/modules_view/2_franchies_section_view/my_y_m_w_d_reports_view_all/my_ymwd_lab_details/fr_lab_components/labss_credentials.dart';

//import 'fr_doc_components3/credentials.dart';

//import 'package:ps_welness/modules_view/lab_center/lab_signup2/lab_components2/credentials.dart';
//import 'package:ps_welness/modules_view/lab_center/lab_signup2/lab_components2/head_text.dart';

class YmwdreportLab extends StatelessWidget {
  const YmwdreportLab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            lightPrimary,
            darkPrimary,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: size.height * 0.01,
                //bottom: size.height * 0.64,
                //left: -30,
                right: -size.width * 0.03,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: size.height * 0.18,
                    width: size.width * 0.58,
                    decoration: BoxDecoration(
                        //color: Colors.,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              'lib/assets/background_stack_png/frlab1.png',
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // YmwdDoc3HeadText(),
                  MyYmwdreportlabbCredential(),
                  SizedBox(
                      height: size.height * 0.77,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 12,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                  vertical: size.height * 0.0005),
                              child: Container(
                                height: size.height * 0.3,
                                margin: EdgeInsets.symmetric(vertical: 30 / 5),
                                decoration: BoxDecoration(
                                  // image: DecorationImage(
                                  //     image: NetworkImage(
                                  //         'https://images.unsplash.com/photo-1589758438368-0ad531db3366?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'),
                                  //     fit: BoxFit.fill),
                                  //color: MyTheme.containercolor8,
                                  borderRadius: BorderRadius.circular(20),

                                  // gradient: LinearGradient(
                                  //     begin: Alignment.centerLeft,
                                  //     end: Alignment.centerRight,
                                  //     colors: [
                                  //       lightPrimary,
                                  //       darkPrimary,
                                  //     ]),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(-0, -0),
                                      spreadRadius: 0,
                                      blurRadius: 0,
                                      color: Colors.pink.shade900,

                                      // color: darkShadow1,
                                    ),
                                    BoxShadow(
                                      offset: Offset(3, 3),
                                      spreadRadius: 0,
                                      blurRadius: 0,
                                      color: Colors.pink.shade800,
                                    ),
                                  ],
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        'https://images.unsplash.com/photo-1464618663641-bbdd760ae84a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDh8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60'
                                        //'https://images.unsplash.com/photo-1628921919890-6d79dc5592c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NnxIRjMxcGQ3aFVIMHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=900&q=60'
                                        //'https://images.unsplash.com/32/Mc8kW4x9Q3aRR3RkP5Im_IMG_4417.jpg?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGJhY2tncm91bmQlMjBpbWFnZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60'
                                        //'https://images.unsplash.com/photo-1611242320536-f12d3541249b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHJlZCUyMGJhY2tncm91bmR8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60'
                                        //'https://images.unsplash.com/photo-1530533718754-001d2668365a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
                                        // 'https://images.unsplash.com/photo-1543333995-a78aea2eee50?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fHBhdGllbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60'
                                        // 'https://images.unsplash.com/photo-1612776572997-76cc42e058c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTl8YU1uY09rZllTRFV8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60'
                                        //'https://images.unsplash.com/photo-1518783211485-10fd3bfb2ce2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'
                                        //  'https://images.unsplash.com/photo-1543157145-f78c636d023d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80'
                                        ,
                                      ),
                                      fit: BoxFit.cover),
                                  // image: DecorationImage(
                                  //     image: NetworkImage(
                                  //         'https://images.unsplash.com/photo-1626624340240-aadc087844fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Ymx1ciUyMGltYWdlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
                                  //     fit: BoxFit.cover)
                                ),
                                child: Container(
                                  height: size.height * 0.3,
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                      vertical: size.width * 0.0 / 05),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color(0xffffffff),
                                            Color(0xffF0FFF0)
                                            //darkPrimary,
                                          ]),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            'https://images.unsplash.com/photo-1464618663641-bbdd760ae84a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDh8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60'
                                            //'https://images.unsplash.com/photo-1628921919890-6d79dc5592c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NnxIRjMxcGQ3aFVIMHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=900&q=60'
                                            // 'https://images.unsplash.com/32/Mc8kW4x9Q3aRR3RkP5Im_IMG_4417.jpg?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGJhY2tncm91bmQlMjBpbWFnZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60'
                                            // 'https://images.unsplash.com/flagged/photo-1568196978341-fd5e4d1253ed?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80'
                                            // 'https://images.unsplash.com/photo-1611242320536-f12d3541249b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHJlZCUyMGJhY2tncm91bmR8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60'
                                            //'https://images.unsplash.com/photo-1543333995-a78aea2eee50?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fHBhdGllbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60'
                                            //'https://images.unsplash.com/photo-1612776572997-76cc42e058c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTl8YU1uY09rZllTRFV8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60'
                                            //'https://images.unsplash.com/photo-1518783211485-10fd3bfb2ce2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'
                                            ,
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(-0, -0),
                                          spreadRadius: 0,
                                          blurRadius: 0,
                                          color: Colors.red.shade200,
                                        ),
                                        BoxShadow(
                                          offset: Offset(3, 3),
                                          spreadRadius: 2,
                                          blurRadius: 0,
                                          color: Colors.blue.shade400,
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
                                          height: size.height * 0.3,
                                          width: size.width * 0.92,
                                          padding: EdgeInsets.all(3),
                                          // Image.asset(
                                          //   'lib/assets/icons/user.png',
                                          //   // "lib/assets/image/icons8-hospital-64.png",
                                          // ),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[900],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    'https://images.unsplash.com/photo-1464618663641-bbdd760ae84a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDh8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60'
                                                    //  'https://images.unsplash.com/photo-1546448396-6aef80193ceb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80'
                                                    //'https://images.unsplash.com/photo-1628921919890-6d79dc5592c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NnxIRjMxcGQ3aFVIMHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=900&q=60'
                                                    //'https://images.unsplash.com/32/Mc8kW4x9Q3aRR3RkP5Im_IMG_4417.jpg?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGJhY2tncm91bmQlMjBpbWFnZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60'
                                                    //'https://images.unsplash.com/flagged/photo-1568196978341-fd5e4d1253ed?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80'
                                                    // 'https://images.unsplash.com/photo-1517241034903-9a4c3ab12f00?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
                                                    // 'https://images.unsplash.com/photo-1611242320536-f12d3541249b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHJlZCUyMGJhY2tncm91bmR8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60'
                                                    // 'https://images.unsplash.com/photo-1530533718754-001d2668365a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
                                                    // 'https://images.unsplash.com/photo-1543333995-a78aea2eee50?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fHBhdGllbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60'
                                                    // 'https://images.unsplash.com/photo-1612776572997-76cc42e058c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTl8YU1uY09rZllTRFV8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60'
                                                    //'https://images.unsplash.com/photo-1518783211485-10fd3bfb2ce2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'
                                                    //'https://images.unsplash.com/photo-1543157145-f78c636d023d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80'
                                                    ,
                                                  ),
                                                  fit: BoxFit.cover),
                                              boxShadow: [
                                                const BoxShadow(
                                                  color: Colors.black,
                                                  // Color(0xFFBEBEBE),
                                                  offset: Offset(3, 3),
                                                  blurRadius: 0,
                                                  spreadRadius: 0,
                                                ),
                                                const BoxShadow(
                                                  color: Colors.white,
                                                  offset: Offset(-1, -1),
                                                  blurRadius: 1,
                                                  spreadRadius: 1,
                                                ),
                                              ]),

                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Lab Id:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Lab Name:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  // Text(
                                                  //   'Franchise:',
                                                  //   style: GoogleFonts.lato(
                                                  //     fontSize:
                                                  //         size.width * 0.03,
                                                  //     fontWeight:
                                                  //         FontWeight.w700,
                                                  //     color: Colors.black,
                                                  //   ),
                                                  // ),
                                                  Text(
                                                    'Landline no:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Mobile No:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Email:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Address:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Licence:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    'GST No:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Aadhaar:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Approval:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Action:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'LAB34',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.brown.shade600,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Sagar Lab',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.brown.shade600,
                                                    ),
                                                  ),
                                                  // Text(
                                                  //   'JBM Franchies',
                                                  //   style: GoogleFonts.lato(
                                                  //     fontSize:
                                                  //         size.width * 0.03,
                                                  //     fontWeight:
                                                  //         FontWeight.w700,
                                                  //     color:
                                                  //         Colors.brown.shade600,
                                                  //   ),
                                                  // ),
                                                  Text(
                                                    '7766737388',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.brown.shade600,
                                                    ),
                                                  ),
                                                  Text(
                                                    '4452455448',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.brown.shade600,
                                                    ),
                                                  ),
                                                  Text(
                                                    'uyuy@gmail.com',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.brown.shade600,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Noida sector6 C52 UP 569988',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.brown.shade600,
                                                    ),
                                                  ),
                                                  Text(
                                                    '0980088899',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.brown.shade600,
                                                    ),
                                                  ),
                                                  Text(
                                                    '12DFR44334433',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.brown.shade600,
                                                    ),
                                                  ),
                                                  Text(
                                                    '4232825565431',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.brown.shade600,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Approved',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.green.shade900,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height:
                                                            size.height * 0.02,
                                                        width:
                                                            size.width * 0.075,
                                                        color: Colors
                                                            .lightBlueAccent,
                                                        child: Center(
                                                          child: Text(
                                                            'Edit',
                                                            style: GoogleFonts
                                                                .lato(
                                                              fontSize:
                                                                  size.width *
                                                                      0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            size.width * 0.04,
                                                      ),
                                                      Container(
                                                        height:
                                                            size.height * 0.02,
                                                        width:
                                                            size.width * 0.15,
                                                        color: Colors.indigo,
                                                        child: Center(
                                                          child: Text(
                                                            'Bank Details',
                                                            style: GoogleFonts
                                                                .lato(
                                                              fontSize:
                                                                  size.width *
                                                                      0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            size.width * 0.04,
                                                      ),
                                                      Container(
                                                        height:
                                                            size.height * 0.02,
                                                        width: size.width * 0.1,
                                                        color: Colors.red,
                                                        child: Center(
                                                          child: Text(
                                                            'Delete',
                                                            style: GoogleFonts
                                                                .lato(
                                                              fontSize:
                                                                  size.width *
                                                                      0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // child: child,
                                ),
                              ),
                            );
                          })),
                  //HospitalSocial(),
                  //Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
