import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/rozarpay_wollet_controller/wallet_rozarpay_controller.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';

import '../../../../../constants/constants/constants.dart';
import '../../../../../constants/my_theme.dart';
import '../../../../../controllers/1_user_view_controller/wallet_user_controller/wallet_controllers_user.dart';
import '../../../home_page_user_view/user_home_page.dart';

class WalletCredentials extends StatelessWidget {
  WalletCredentials({Key? key}) : super(key: key);
  TextEditingController walletAmount = TextEditingController();


  Wallet_2_Controller _wallet_2_controller = Get.put(Wallet_2_Controller());
  RozarwalletController _rozarwalletController = Get.put(RozarwalletController());
  String text = "No Value Entered";


  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  get newvalue => null!;

  // LoginpasswordController _loginpasswordController =
  //     Get.put(LoginpasswordController());

  @override
  Widget build(BuildContext context) {
    print("jdfkjsdfksldnsdjg: ${_wallet_2_controller.walletAmount.text}");

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Obx(
              () => (_wallet_2_controller.isLoading.value)
              ? Center(child: CircularProgressIndicator())
              : Form(
            key: _wallet_2_controller.walletformkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      //height: size.height * 0.02,
                      ),

                  ///todo: add ammount..........

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.00,
                        vertical: size.height * 0.003),
                    child: InkWell(
                      onTap: () {
                        //Get.to(() => DoctorListUser());
                      },
                      child: Container(
                        //height: size.height * 0.5,
                        width: size.width,
                        padding:
                            EdgeInsets.symmetric(vertical: size.height * 0.004),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black38,
                                offset: Offset(5, 5),
                                blurRadius: 0,
                                spreadRadius: 0,
                              ),
                              const BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, -0),
                                blurRadius: 0,
                                spreadRadius: 0,
                              ),
                            ]),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                  vertical: size.height * 0.03),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Available Balance:',
                                    // doctorcatagary[index],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.sunflower(
                                      fontWeight: FontWeight.bold,
                                      color: MyTheme.blueww,
                                      fontSize: size.height * 0.025,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height*0.08,
                                    width: size.width*0.3,
                                    // color: Colors.red,
                                    child: ListView.builder(
                                      itemCount: 1,
                                      //itemCount: _walletController.getwalletlist?.result.length,
                                      itemBuilder: (BuildContext context , int index){
                                        print("kmmfmlmfklfm: ${_wallet_2_controller.getwalletlist?.result?[index].walletAmount?.toDouble()}");
                                        return
                                          Obx(

                                                () => (_wallet_2_controller.isLoading.value)
                                                ? Center(child: CircularProgressIndicator())
                                                :_wallet_2_controller.getwalletlist!.result!.isEmpty
                                                ? Center(
                                              child: Text('No List'),
                                            )
                                                :
                                            Padding(
                                              padding:  EdgeInsets.only(
                                                  top: size.height*0.02
                                              ),
                                              child: Container(
                                                height: size.height*0.04,
                                                width: size.width*0.12,
                                                child: Center(child: Text('₹ ${_wallet_2_controller.getwalletlist!.result![index].walletAmount!.toDouble()}' ,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold ,
                                                      color: Colors.black,
                                                      fontSize: size.width*0.04,
                                                  ),
                                                )),

                                                decoration: BoxDecoration(
                                                  color: Colors.blue.shade200,
                                                    // gradient:
                                                    // LinearGradient(
                                                    //   colors: <
                                                    //       Color>[
                                                    //     Color(
                                                    //         0xff3a923b),
                                                    //     Color(
                                                    //         0xffb5d047),
                                                    //   ],
                                                    // ),
                                                    borderRadius: BorderRadius.circular(10)
                                                ),
                                              ),
                                            ),

                                            //     Container(
                                            //   height: size.height*0.1,
                                            //   width: size.width*0.3,
                                            //  // color: Colors.red,
                                            //   child: Center(
                                            //     child: Text('₹ ${_walletController.getwalletlist!.result[index].walletAmount!.toDouble()}',
                                            //       //Text('₹ ${_walletController.getwalletlist?.result[index].walletAmount.toDouble()}',
                                            //
                                            //         style: TextStyle(
                                            //           fontSize: size.height*0.02,
                                            //           color: Colors.black,
                                            //         ),
                                            //       ),
                                            //   ),
                                            // ),
                                          );



                                      },
                                    ),
                                  ),
                                  // Text(
                                  //   '₹ '
                                  //       '4500.00',
                                  //   // doctorcatagary[index],
                                  //   maxLines: 1,
                                  //   overflow: TextOverflow.ellipsis,
                                  //   style: GoogleFonts.sunflower(
                                  //     fontWeight: FontWeight.bold,
                                  //     color: MyTheme.blueww,
                                  //     fontSize: size.height * 0.025,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                  //height: size.height * 0.06,
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(vertical: 30 / 2),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            lightPrimary2,
                                            darkPrimary2,
                                          ]),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(-0, -0),
                                          spreadRadius: 1,
                                          blurRadius: 0,
                                          color: Colors.grey.shade300,
                                        ),
                                        BoxShadow(
                                          offset: Offset(3, 3),
                                          spreadRadius: 1,
                                          blurRadius: 0,
                                          color: Colors.grey.shade300,
                                        ),
                                      ]),
                                  child: TextFormField(
                                    style:TextStyle(fontSize:size.height*0.02,fontWeight: FontWeight.w800),

                                    autofillHints: [
                                      AutofillHints.transactionAmount
                                    ],
                                    controller:
                                        _wallet_2_controller.walletAmount,
                                    onSaved: (value) {
                                      _wallet_2_controller.amount = value!;
                                    },
                                    validator: (value) {
                                      return _wallet_2_controller
                                          .validateAmount(value!);
                                    },
                                    cursorColor: Colors.black,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      prefixText: '₹ ',
                                      prefixStyle: TextStyle(color: Colors.black,fontSize: size.height*0.02,
                                      fontWeight: FontWeight.bold),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.03),
                                      hintText: 'Amount',
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                      helperStyle: TextStyle(
                                        color: black.withOpacity(0.7),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      // prefixIcon: Icon(
                                      //   Icons.phone_android_outlined,
                                      //   color: black.withOpacity(0.7),
                                      //   size: 20,
                                      // ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                  vertical: size.height * 0.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.01,
                                        vertical: size.height * 0.001),
                                    child: InkWell(
                                      onTap: () {
                                        _wallet_2_controller.walletAmount.text = '100';

                                        // Get.to(() => DoctorListUser());
                                      },
                                      child: Container(
                                        height: size.height * 0.04,
                                        width: size.width * 0.15,
                                        padding: EdgeInsets.symmetric(
                                            vertical: size.height * 0.004),
                                        decoration: BoxDecoration(
                                            color: Colors.orange.shade300,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade300,
                                                offset: Offset(2, 2),
                                                blurRadius: 0,
                                                spreadRadius: 0,
                                              ),
                                              const BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, -0),
                                                blurRadius: 1,
                                                spreadRadius: 0,
                                              ),
                                            ]),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.all(size.height * 0.001),
                                          child: Center(
                                            child: Text(
                                              '₹100',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.sunflower(
                                                fontWeight: FontWeight.bold,
                                                color: MyTheme.blueww,
                                                fontSize: size.width * 0.038,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.01,
                                        vertical: size.height * 0.001),
                                    child: InkWell(
                                      onTap: () {
                                        _wallet_2_controller.walletAmount.text = '200';
                                        // Get.to(() => DoctorListUser());
                                      },
                                      child: Container(
                                        height: size.height * 0.04,
                                        width: size.width * 0.15,
                                        padding: EdgeInsets.symmetric(
                                            vertical: size.height * 0.004),
                                        decoration: BoxDecoration(
                                            color: Colors.orange.shade300,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade300,
                                                offset: Offset(2, 2),
                                                blurRadius: 0,
                                                spreadRadius: 0,
                                              ),
                                              const BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, -0),
                                                blurRadius: 1,
                                                spreadRadius: 0,
                                              ),
                                            ]),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.all(size.height * 0.001),
                                          child: Center(
                                            child: Text(
                                              '₹200',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.sunflower(
                                                fontWeight: FontWeight.bold,
                                                color: MyTheme.blueww,
                                                fontSize: size.width * 0.038,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.01,
                                        vertical: size.height * 0.001),
                                    child: InkWell(
                                      onTap: () {
                                        _wallet_2_controller.walletAmount.text = '500';

                                        // Get.to(() => DoctorListUser());
                                      },
                                      child: Container(
                                        height: size.height * 0.04,
                                        width: size.width * 0.15,
                                        padding: EdgeInsets.symmetric(
                                            vertical: size.height * 0.004),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.all(size.height * 0.001),
                                          child: Center(
                                            child: Text(
                                              '₹500',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.sunflower(
                                                fontWeight: FontWeight.bold,
                                                color: MyTheme.blueww,
                                                fontSize: size.width * 0.038,
                                              ),
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.orange.shade300,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade300,
                                                offset: Offset(2, 2),
                                                blurRadius: 0,
                                                spreadRadius: 0,
                                              ),
                                              const BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, -0),
                                                blurRadius: 1,
                                                spreadRadius: 0,
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.01,
                                        vertical: size.height * 0.001),
                                    child: InkWell(
                                      onTap: () {
                                        _wallet_2_controller.walletAmount.text = '2000';

                                        // Get.to(() => DoctorListUser());
                                      },
                                      child: Container(
                                        height: size.height * 0.04,
                                        width: size.width * 0.15,
                                        padding: EdgeInsets.symmetric(
                                            vertical: size.height * 0.004),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.all(size.height * 0.001),
                                          child: Center(
                                            child: Text(
                                              '₹1000',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.sunflower(
                                                fontWeight: FontWeight.bold,
                                                color: MyTheme.blueww,
                                                fontSize: size.width * 0.038,
                                              ),
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.orange.shade300,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade300,
                                                offset: Offset(2, 2),
                                                blurRadius: 0,
                                                spreadRadius: 0,
                                              ),
                                              const BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, -0),
                                                blurRadius: 1,
                                                spreadRadius: 0,
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                  vertical: size.height * 0.051),
                              child: InkWell(
                                onTap: () {
                                  print("jhgvjdfhvjkfhvfi: ${_wallet_2_controller.walletAmount.text}");
                                  // var prefs = GetStorage();
                                  // //saved amount..........
                                  // amount = prefs.read(_walletPostController.Money.text);
                                  // print('1111111111&&&&&&&okoko:${amount}');
                                  // _walletPostController.walletPostApi();
                                  ///..................................................1feb23
                                  // _walletPostController.checkAmount();
                                  ///..............................................
                                  _rozarwalletController.openCheckout();
                                 // Get.to(() => UserHomePage());
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: size.height * 0.065,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            darkPrimary2,
                                            lightPrimary,
                                          ]),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 0),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          color: darkShadow,
                                        ),
                                        BoxShadow(
                                          offset: Offset(-1, -1),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          color: lightShadow,
                                        ),
                                      ]),
                                  child: Center(
                                    child: Text(
                                      'SUBMIT',
                                      style: TextStyle(
                                        fontSize: size.width * 0.049,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // RectangularButton(
                              //     text: 'SUBMIT',
                              //     press: () {
                              //       Get.to(HomePage());
                              //       //_loginpasswordController.checkLoginpassword();
                              //     }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  ///

                  // child: DropdownButton(
                  //     value: _hospital_2_controller.selectedState.value,
                  //     menuMaxHeight: size.height * 0.3,
                  //     items: items.map((String items) {
                  //       return DropdownMenuItem(
                  //         value: items,
                  //         child: Text(items),
                  //       );
                  //     }).toList(),
                  //     // _hospital_2_controller.states.map((String value) {
                  //     //   return DropdownMenuItem(
                  //     //     value: value,
                  //     //
                  //     //   )
                  //     onChanged: (String? newValue) {
                  //       _hospital_2_controller.states.value =
                  //           newValue! as List<String>;
                  //       _hospital_2_controller.selectedCity.value = null;
                  //       _hospital_2_controller.cities.clear();
                  //       _hospital_2_controller.cities
                  //           .addAll(stateCityMap[newvalue]!);
                  //     })),

                  SizedBox(
                    height: size.height * 0.018,
                    //appPadding / 2,
                  ),

                  // GetBuilder<Hospital_2_Controller>(
                  //   // specify type as Controller
                  //   init: Hospital_2_Controller(), // intialize with the Controller
                  //   builder: (value) => InkWell(
                  //     onTap: () {
                  //       _doctor_2_controller.getImage(ImageSource.gallery);
                  //     },
                  //     child: NeumorphicTextFieldContainer(
                  //       child: Container(
                  //         height: size.height * 0.07,
                  //         //width: size.width * 0.5,
                  //         child: Padding(
                  //           padding:
                  //               EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Text(
                  //                 'Authorise Letter Image',
                  //                 style: TextStyle(
                  //                   fontSize: size.width * 0.03,
                  //                   fontWeight: FontWeight.w700,
                  //                 ),
                  //               ),
                  //               Icon(Icons.camera),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
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
