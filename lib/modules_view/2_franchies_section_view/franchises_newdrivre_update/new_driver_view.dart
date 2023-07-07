import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesNewDriver_controller/frenchiesNewDriverList_controller.dart';

class NewDriverView extends StatelessWidget {
  NewDriverView({Key? key}) : super(key: key);
  FrenchiesNewDriverListController _frenchiesNewDriverListController = Get.put(FrenchiesNewDriverListController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: MyTheme.ThemeColors,
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(()=> _frenchiesNewDriverListController.isLoading.value
          ? const Center(child: CircularProgressIndicator(),)
          : SingleChildScrollView(
            child: SafeArea(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -size.height * 0.043,
                    right: -size.width * 0.08,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: size.height * 0.22,
                        width: size.width * 0.54,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                  'lib/assets/background_stack_png/fr_driver1.png',
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
                              'New Driver',
                              style: GoogleFonts.alatsi(
                                  fontSize: size.height * 0.032,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff023382)),
                            ),
                          ],
                        ),
                      ),
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
                              margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                              padding: const EdgeInsets.fromLTRB(5, 8, 8, 8),
                              child: Theme(
                                data: Theme.of(context)
                                    .copyWith(splashColor: Colors.transparent),
                                child: TextField(
                                  onChanged: (value)=>  _frenchiesNewDriverListController.filterPaymentNurse(value),
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 15.0, color: MyTheme.blueww),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white70,
                                    hintText: 'Enter Driver Name',
                                    contentPadding: const EdgeInsets.only(
                                        left: 10.0, bottom: 14.0, top: 0.0),
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
                      SizedBox(
                        height: size.height * 0.0,
                      ),
                      _frenchiesNewDriverListController.data.value.isEmpty
                          ? Center(child: Text('No List'))
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:  _frenchiesNewDriverListController.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var item =  _frenchiesNewDriverListController.data;
                                  var id = _frenchiesNewDriverListController.getfrenchiesNewDriverListModel?.newDriver?[index].id;
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03,
                                        vertical: size.height * 0.0005),
                                    child: Container(
                                      height: size.height * 0.13,
                                      margin: const EdgeInsets.symmetric(vertical: 30 / 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          const BoxShadow(
                                            offset: Offset(-0, -0),
                                            spreadRadius: 0,
                                            blurRadius: 0,
                                            color: Colors.black,
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
                                        height: size.height * 0.093,
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
                                                blurRadius: 2,
                                                color: Colors.orange.shade200,
                                              ),
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Driver Name:',
                                                    style: GoogleFonts.roboto(
                                                      fontSize: size.width * 0.04,
                                                      fontWeight: FontWeight.w500,
                                                      color: MyTheme.blueww,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.02,
                                                  ),
                                                  Container(
                                                    height: size.height * 0.05,
                                                    width: size.width * 0.5,
                                                    padding: const EdgeInsets.all(2),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey[300],
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                        boxShadow: const[
                                                           BoxShadow(
                                                            color: Colors.black38,
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
                                                      child: Text('${item?[index].driverName}',
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                        maxLines: 2,
                                                        style: GoogleFonts.roboto(
                                                          fontSize:
                                                              size.width * 0.04,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors
                                                              .cyan.shade700,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Action:',
                                                    style: GoogleFonts.roboto(
                                                      fontSize: size.width * 0.04,
                                                      fontWeight: FontWeight.w500,
                                                      color: MyTheme.blueww,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.02,
                                                  ),
                                                  InkWell(
                                                    onTap: (){
                                                      _dialog(id);
                                                    },
                                                    child: Container(
                                                      height: size.height * 0.05,
                                                      width: size.width * 0.3,
                                                      padding: const EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey[300],
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10),
                                                          boxShadow: const[
                                                             BoxShadow(
                                                              color: Colors.green,
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
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Update',
                                                              overflow: TextOverflow
                                                                  .ellipsis,
                                                              maxLines: 1,
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize:
                                                                    size.width *
                                                                        0.04,
                                                                fontWeight:
                                                                    FontWeight.w600,
                                                                color: Colors.green,
                                                                //MyTheme.ThemeColors,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  size.width * 0.02,
                                                            ),
                                                            Icon(
                                                              Icons.edit,
                                                              size:
                                                                  size.width * 0.05,
                                                              color: Colors.grey,
                                                            ),
                                                          ],
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
  _dialog(id){
    Get.defaultDialog(
        title: '',
        content: Form(
          key: _frenchiesNewDriverListController.franchisesNewDriverUpdateformkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 50,
                child: TextFormField(
                  controller: _frenchiesNewDriverListController.driverNameController,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    labelText: 'Driver Name',
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return'Driver Name is Empty';
                    }
                  },
                ),
              ),
              SizedBox(height: 10,),
              const SizedBox(height: 30.0,),
              InkWell(
                onTap: ()async{
                  _frenchiesNewDriverListController.checkFranchisesNewDriver(id);
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  decoration: const BoxDecoration(
                    color: Colors.teal,
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        radius: 10.0);
  }
}
