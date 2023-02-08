import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/fr_registration_detailsss/fr_registration_detail_rwa/fr_all_rwa_details.dart';

import '../../../../constants/my_theme.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/modules_view/2_franchies_section_view/fr_registration_detailsss/fr_registration_detail_rwa/fr_all_rwa_details.dart';

class ResitrationRwaDetails extends StatelessWidget {
  ResitrationRwaDetails({Key? key}) : super(key: key);

  //RwaPayoutController _payoutController = Get.put(RwaPayoutController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: MyTheme.ThemeColors,
        height: size.height,
        width: size.width,
        child: Scaffold(
          backgroundColor: Colors.transparent,

          // backgroundColor: MyTheme.ThemeColors,
          // appBar: AppBar(
          //   centerTitle: true,
          //   elevation: 0,
          //   title: Text('Patient List'),
          //   backgroundColor: MyTheme.ThemeColors,
          // ),

          body: SingleChildScrollView(
            child: SafeArea(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -size.height * 0.02,
                    //bottom: size.height * 0.64,
                    //left: -30,
                    right: size.width * 0.00,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: size.height * 0.22,
                        width: size.width * 0.5,
                        decoration: BoxDecoration(
                            //color: Colors.,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                  'lib/assets/background_stack_png/rwa_patient_list1.png',
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
                                decoration: BoxDecoration(
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
                              'RWA List',
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
                              //height: size.height * 0.02,
                              decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(30.0)),
                                  color: Colors.white70),
                              width: size.width * 0.45,
                              height: size.height * 0.06,
                              margin: new EdgeInsets.fromLTRB(10, 20, 10, 20),
                              padding: new EdgeInsets.fromLTRB(5, 8, 8, 8),
                              child: Theme(
                                data: Theme.of(context)
                                    .copyWith(splashColor: Colors.transparent),
                                child: TextField(
                                  // controller: _payoutController
                                  //.appointmentController,
                                  onTap: () {
                                    //_payoutController.chooseDate();
                                  },
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 15.0, color: MyTheme.blueww),
                                  decoration: InputDecoration(
                                    //prefixIcon: Icon(Icons.search),
                                    filled: true,
                                    fillColor: Colors.white70,
                                    hintText: 'Enter RWA Id ',
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
                                    color: Colors.grey,
                                    fontSize: size.width * 0.03,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),

                      ///..................
                      SizedBox(
                          height: size.height * 0.73,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03,
                                      vertical: size.height * 0.0005),
                                  child: Container(
                                    height: size.height * 0.3,
                                    margin:
                                        EdgeInsets.symmetric(vertical: 30 / 5),
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
                                            'https://images.unsplash.com/photo-1632381887598-accb2a2bdd7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'
                                            //'https://images.unsplash.com/photo-1536064479547-7ee40b74b807?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGhlYWx0aCUyMGNoZWNrdXB8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60'
                                            // 'https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
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
                                                'https://images.unsplash.com/photo-1632381887598-accb2a2bdd7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'
                                                //'https://images.unsplash.com/photo-1536064479547-7ee40b74b807?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGhlYWx0aCUyMGNoZWNrdXB8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60'
                                                //'https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
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
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                              color: Colors.yellow.shade100,
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
                                                        'https://images.unsplash.com/photo-1632749161487-5f38ec89ebdf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60'
                                                        //'https://images.unsplash.com/photo-1634295912158-9c847b6b3a40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE3fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=900&q=60'
                                                        //'https://images.unsplash.com/photo-1632381887598-accb2a2bdd7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'
                                                        // 'https://images.unsplash.com/photo-1536064479547-7ee40b74b807?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGhlYWx0aCUyMGNoZWNrdXB8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60'
                                                        // 'https://images.unsplash.com/photo-1508387027939-27cccde53673?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80'
                                                        //'https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
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
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'RWA Id:',
                                                        style: GoogleFonts.lato(
                                                          fontSize:
                                                              size.width * 0.04,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .indigo.shade900,
                                                        ),
                                                      ),
                                                      Text(
                                                        'RWA Name:',
                                                        style: GoogleFonts.lato(
                                                          fontSize:
                                                              size.width * 0.04,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors
                                                              .indigo.shade900,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Mobile No:',
                                                        style: GoogleFonts.lato(
                                                          fontSize:
                                                              size.width * 0.04,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors
                                                              .indigo.shade900,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Landline No:',
                                                        style: GoogleFonts.lato(
                                                          fontSize:
                                                              size.width * 0.04,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors
                                                              .indigo.shade900,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Email:',
                                                        style: GoogleFonts.lato(
                                                          fontSize:
                                                              size.width * 0.04,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors
                                                              .indigo.shade900,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Address:',
                                                        style: GoogleFonts.lato(
                                                          fontSize:
                                                              size.width * 0.04,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors
                                                              .indigo.shade900,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Certificate No:',
                                                        style: GoogleFonts.lato(
                                                          fontSize:
                                                              size.width * 0.04,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors
                                                              .indigo.shade900,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Approval:',
                                                        style: GoogleFonts.lato(
                                                          fontSize:
                                                              size.width * 0.04,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors
                                                              .indigo.shade900,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Action:',
                                                        style: GoogleFonts.lato(
                                                          fontSize:
                                                              size.width * 0.04,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors
                                                              .indigo.shade900,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'RWA02',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.035,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .cyan.shade900,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Shankar Home',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.035,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors
                                                              .cyan.shade900,
                                                        ),
                                                      ),
                                                      Text(
                                                        '0989993244',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.035,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors
                                                              .cyan.shade900,
                                                        ),
                                                      ),
                                                      Text(
                                                        '0989993244',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.035,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors
                                                              .cyan.shade900,
                                                        ),
                                                      ),
                                                      Text(
                                                        'rkkkuuu@gmail.com',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.035,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors
                                                              .cyan.shade900,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Noida sector 2 C53 UP 833302',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.035,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors
                                                              .cyan.shade900,
                                                        ),
                                                      ),
                                                      Text(
                                                        '12DFR44334433',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.035,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors
                                                              .cyan.shade900,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Approved',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.035,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors
                                                              .green.shade900,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            height:
                                                                size.height *
                                                                    0.02,
                                                            width: size.width *
                                                                0.075,
                                                            color: Colors
                                                                .lightBlueAccent,
                                                            child: Center(
                                                              child: Text(
                                                                'Edit',
                                                                style:
                                                                    GoogleFonts
                                                                        .lato(
                                                                  fontSize:
                                                                      size.width *
                                                                          0.025,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.04,
                                                          ),
                                                          Container(
                                                            height:
                                                                size.height *
                                                                    0.02,
                                                            width: size.width *
                                                                0.15,
                                                            color:
                                                                Colors.indigo,
                                                            child: Center(
                                                              child: Text(
                                                                'Bank Details',
                                                                style:
                                                                    GoogleFonts
                                                                        .lato(
                                                                  fontSize:
                                                                      size.width *
                                                                          0.025,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.04,
                                                          ),
                                                          Container(
                                                            height:
                                                                size.height *
                                                                    0.02,
                                                            width: size.width *
                                                                0.1,
                                                            color: Colors.red,
                                                            child: Center(
                                                              child: Text(
                                                                'Delete',
                                                                style:
                                                                    GoogleFonts
                                                                        .lato(
                                                                  fontSize:
                                                                      size.width *
                                                                          0.025,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .white,
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

                      ///.................
                      ///
                      SizedBox(
                        height: size.height * 0.00,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: PhysicalModel(
                            color: Colors.green,
                            elevation: 10,
                            borderRadius: BorderRadius.circular(20),
                            shadowColor: Colors.grey,
                            child: InkWell(
                              onTap: () {
                                Get.to(() => AllRwaDetails());
                              },
                              child: Container(
                                height: size.height * 0.035,
                                width: size.width * 0.16,
                                decoration: BoxDecoration(
                                  color: MyTheme.blueww,
                                  //color: Colors.white70,
                                  //gradient: MyTheme.gradient1,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                    child: Text(
                                  'See all',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.03,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Positioned(
                  //   top: 50,
                  //   child: Container(
                  //     height: size.height * 0.10,
                  //     width: size.width * 0.19,
                  //     decoration: BoxDecoration(
                  //       color: Colors.green,
                  //       shape: BoxShape.circle,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: MyTheme.ThemeColors,
//       // appBar: AppBar(
//       //   centerTitle: true,
//       //   elevation: 0,
//       //   title: Text('Appintment History'),
//       //   backgroundColor: MyTheme.ThemeColors,
//       // ),
//       body: Column(
//         //clipBehavior: Clip.none,
//         children: [
//           SizedBox(
//             height: size.height * 0.07,
//           ),
//           SizedBox(
//             height: size.height * 0.0,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
//             child: Row(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: Container(
//                       height: size.height * 0.032,
//                       width: size.width * 0.071,
//                       decoration: BoxDecoration(
//                         color: Colors.white70,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         Icons.arrow_back_ios_outlined,
//                         size: size.height * 0.022,
//                       )),
//                 ),
//                 SizedBox(
//                   width: size.width * 0.02,
//                 ),
//                 Text(
//                   ' See Your Appointment History',
//                   style: TextStyle(
//                     color: MyTheme.blueww,
//                     fontSize: size.width * 0.045,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Row(
//             children: [
//               Container(
//                 decoration: new BoxDecoration(
//                     borderRadius:
//                         new BorderRadius.all(new Radius.circular(30.0)),
//                     color: Colors.white),
//                 width: size.width * 0.72,
//                 height: size.height * 0.06,
//                 margin: new EdgeInsets.fromLTRB(10, 20, 10, 20),
//                 padding: new EdgeInsets.fromLTRB(5, 8, 8, 8),
//                 child: Theme(
//                   data: Theme.of(context)
//                       .copyWith(splashColor: Colors.transparent),
//                   child: Obx(
//                     () => (_nurseappointmentController.isLoading.value)
//                         ? Center(child: CircularProgressIndicator())
//                         : TextField(
//                             controller: _nurseappointmentController
//                                 .appointmentController,
//                             onTap: () {
//                               _nurseappointmentController.chooseDate();
//                             },
//                             autofocus: false,
//                             style: TextStyle(
//                                 fontSize: 15.0, color: MyTheme.blueww),
//                             decoration: InputDecoration(
//                               prefixIcon: Icon(Icons.search),
//                               filled: true,
//                               fillColor: Colors.white,
//                               hintText: 'dd-mm-yyyy',
//                               contentPadding: const EdgeInsets.only(
//                                   left: 10.0, bottom: 12.0, top: 0.0),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.white),
//                                 borderRadius: BorderRadius.circular(25.7),
//                               ),
//                               enabledBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.white),
//                                 borderRadius: BorderRadius.circular(25.7),
//                               ),
//                             ),
//                           ),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: size.height * 0.06,
//                 width: size.width * 0.2,
//                 decoration: BoxDecoration(
//                   color: MyTheme.blueww,
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Center(
//                     child: Text(
//                   'Search',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: size.width * 0.035,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 )),
//               ),
//             ],
//           ),
//           SizedBox(
//               height: size.height * 0.75,
//               child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: 7,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: size.width * 0.03,
//                           vertical: size.height * 0.0005),
//                       child: Container(
//                         height: size.height * 0.25,
//                         margin: EdgeInsets.symmetric(vertical: 30 / 6),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           gradient: LinearGradient(
//                               begin: Alignment.centerLeft,
//                               end: Alignment.centerRight,
//                               colors: [
//                                 lightPrimary2,
//                                 darkPrimary2,
//                               ]),
//                           boxShadow: [
//                             BoxShadow(
//                               offset: Offset(-0, -0),
//                               spreadRadius: 0,
//                               blurRadius: 0,
//                               color: darkShadow,
//                             ),
//                             BoxShadow(
//                               offset: Offset(1, 3),
//                               spreadRadius: 0,
//                               blurRadius: 0,
//                               color: Colors.grey,
//                             ),
//                           ],
//                           // image: DecorationImage(
//                           //     image: AssetImage(
//                           //         'lib/assets/background_stack_png/appointment6.png'),
//                           //     fit: BoxFit.cover)
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(6.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Patient Name:',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Patient Mobile :',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Patient Email:',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Patient Location:',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Patient City:',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Patient State :',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Kishor Kumar',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                   Text(
//                                     '9977889999',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                   Text(
//                                     'ksk@gmail.com',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                   Text(
//                                     'Sector 12, C 59',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                   Text(
//                                     'Lakhnaw',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                   Text(
//                                     'UP',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   })),
//           // Positioned(
//           //   top: 50,
//           //   child: Container(
//           //     height: size.height * 0.10,
//           //     width: size.width * 0.19,
//           //     decoration: BoxDecoration(
//           //       color: Colors.green,
//           //       shape: BoxShape.circle,
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
