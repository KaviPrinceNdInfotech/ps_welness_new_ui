import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';

import '../../../controllers/9_doctor_controllers_RRR/prescriptions_controllers/prescriptions_controllers.dart';

class PrescriptionsDoctor extends StatefulWidget {
  PrescriptionsDoctor({Key? key}) : super(key: key);

  @override
  State<PrescriptionsDoctor> createState() => _PrescriptionsDoctorState();
}

class _PrescriptionsDoctorState extends State<PrescriptionsDoctor> {
  @override
  Widget build(BuildContext context) {
    Prescriptions_doctor_Controller _prescriptions_doctor_controller =
        Get.put(Prescriptions_doctor_Controller());
    Size size = MediaQuery.of(context).size;

    return Form(
      key: _prescriptions_doctor_controller.prescriptionsdrformkey,
      //autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          centerTitle: true,
          title: Text('Prescriptions'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
                ///weight...
                TextFormField(
                  controller: _prescriptions_doctor_controller.weightController,
                  autovalidateMode: AutovalidateMode.always,
                  decoration: InputDecoration(
                    // icon: Icon(Icons.line_weight),
                    hintText: 'Patient Wheight(in kg)',
                    labelText: 'Weight *',
                  ),
                  onSaved: (value) {
                    _prescriptions_doctor_controller.weight = value!;
                  },
                  validator: (value) {
                    return _prescriptions_doctor_controller.Weight(value!);
                  },
                ),

                ///compalint..
                TextFormField(
                  controller:
                      _prescriptions_doctor_controller.complainController,
                  autovalidateMode: AutovalidateMode.always,
                  decoration: InputDecoration(
                    // icon: Icon(Icons.line_weight),
                    hintText: 'Present Complaint',
                    labelText: 'Complaint',
                  ),
                  onSaved: (value) {
                    _prescriptions_doctor_controller.complain = value!;
                  },
                  validator: (value) {
                    return _prescriptions_doctor_controller.Complane(value!);
                  },
                ),

                ///alergy...
                TextFormField(
                  controller: _prescriptions_doctor_controller.alergyController,
                  autovalidateMode: AutovalidateMode.always,
                  decoration: InputDecoration(
                    // icon: Icon(Icons.line_weight),
                    hintText: 'Alergies if any',
                    labelText: 'Alergy',
                  ),
                  onSaved: (value) {
                    _prescriptions_doctor_controller.alergy = value!;
                  },
                  validator: (value) {
                    return _prescriptions_doctor_controller.Alergy(value!);
                  },
                ),

                ///primarydiagnosis.......
                TextFormField(
                  controller: _prescriptions_doctor_controller
                      .primerydiagnosisController,
                  autovalidateMode: AutovalidateMode.always,
                  decoration: InputDecoration(
                    // icon: Icon(Icons.line_weight),
                    hintText: 'Primary Diagnosis Based On symptoms',
                    labelText: 'Primary Diagnosis',
                  ),
                  onSaved: (value) {
                    _prescriptions_doctor_controller.primerydiagnosis = value!;
                  },
                  validator: (value) {
                    return _prescriptions_doctor_controller.Primerydiagnosis(
                        value!);
                  },
                ),

                ///prescrivetest.......
                TextFormField(
                  controller:
                      _prescriptions_doctor_controller.prescribetestController,
                  autovalidateMode: AutovalidateMode.always,
                  decoration: InputDecoration(
                    // icon: Icon(Icons.line_weight),
                    hintText: 'Prescribe Test',
                    labelText: 'Prescribe Test',
                  ),
                  onSaved: (value) {
                    _prescriptions_doctor_controller.prescribetest = value!;
                  },
                  validator: (value) {
                    return _prescriptions_doctor_controller.Prescribetest(
                        value!);
                  },
                ),

                ///post medicine....srrgeryy...
                TextFormField(
                  controller: _prescriptions_doctor_controller
                      .medicinesurgeryController,
                  autovalidateMode: AutovalidateMode.always,
                  decoration: InputDecoration(
                    // icon: Icon(Icons.line_weight),
                    hintText: 'Past medicine/Surgical History',
                    labelText: 'Medicine/Sugary',
                  ),
                  onSaved: (value) {
                    _prescriptions_doctor_controller.medicinesurgery = value!;
                  },
                  validator: (value) {
                    return _prescriptions_doctor_controller.Medicinesurgery(
                        value!);
                  },
                ),

                ///medicine 1
                SizedBox(
                  height: size.height * 0.012,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Med 1',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: size.height * 0.019,
                        color: Colors.red,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller:
                            _prescriptions_doctor_controller.med1Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.line_weight),
                          hintText: 'Medicine name 1',
                          labelText: 'Medicine 1',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.med1 = value!;
                        },
                        // validator: (value) {
                        //   return _prescriptions_doctor_controller.Med1(value!);
                        // },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller:
                            _prescriptions_doctor_controller.dose1Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          //icon: Icon(Icons.),
                          hintText: 'Doses 1',
                          labelText: 'Doses 1',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.dose1 = value!;
                        },
                        // validator: (value) {
                        //   return _prescriptions_doctor_controller.Dose1(value!);
                        // },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller: _prescriptions_doctor_controller
                            .instruction1Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.line_weight),
                          hintText: 'Instructions 1',
                          labelText: 'Instructions 1',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.instruction1 =
                              value!;
                        },
                        // validator: (value) {
                        //   return _prescriptions_doctor_controller.Inst1(value!);
                        // },
                      ),
                    ),
                  ],
                ),

                ///medicine_2........
                SizedBox(
                  height: size.height * 0.012,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Med 2',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: size.height * 0.019,
                        color: Colors.red,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller:
                            _prescriptions_doctor_controller.med2Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.line_weight),
                          hintText: 'Medicine name 2',
                          labelText: 'Medicine 2',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.med2 = value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Med1(value!);
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller:
                            _prescriptions_doctor_controller.dose2Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          //icon: Icon(Icons.),
                          hintText: 'Doses 2',
                          labelText: 'Doses 2',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.dose2 = value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Dose1(value!);
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller: _prescriptions_doctor_controller
                            .instruction2Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.line_weight),
                          hintText: 'Instructions 2',
                          labelText: 'Instructions 2',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.instruction2 =
                              value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Inst1(value!);
                        },
                      ),
                    ),
                  ],
                ),

                ///medicine_3............
                SizedBox(
                  height: size.height * 0.012,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Med 3',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: size.height * 0.019,
                        color: Colors.red,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller:
                            _prescriptions_doctor_controller.med3Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.line_weight),
                          hintText: 'Medicine name 3',
                          labelText: 'Medicine 3',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.med3 = value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Med1(value!);
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller:
                            _prescriptions_doctor_controller.dose3Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          //icon: Icon(Icons.),
                          hintText: 'Doses 3',
                          labelText: 'Doses 3',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.dose3 = value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Dose1(value!);
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller: _prescriptions_doctor_controller
                            .instruction3Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.line_weight),
                          hintText: 'Instructions 3',
                          labelText: 'Instructions 3',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.instruction3 =
                              value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Inst1(value!);
                        },
                      ),
                    ),
                  ],
                ),

                ///medicine_4..........
                SizedBox(
                  height: size.height * 0.012,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Med 4',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: size.height * 0.019,
                        color: Colors.red,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller:
                            _prescriptions_doctor_controller.med4Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.line_weight),
                          hintText: 'Medicine name 4',
                          labelText: 'Medicine 4',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.med4 = value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Med1(value!);
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller:
                            _prescriptions_doctor_controller.dose4Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          //icon: Icon(Icons.),
                          hintText: 'Doses 4',
                          labelText: 'Doses 4',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.dose4 = value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Dose1(value!);
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller: _prescriptions_doctor_controller
                            .instruction4Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.line_weight),
                          hintText: 'Instructions 4',
                          labelText: 'Instructions 4',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.instruction4 =
                              value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Inst1(value!);
                        },
                      ),
                    ),
                  ],
                ),

                ///medicine_5..........
                SizedBox(
                  height: size.height * 0.012,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Med 5',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: size.height * 0.019,
                        color: Colors.red,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller:
                            _prescriptions_doctor_controller.med5Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.line_weight),
                          hintText: 'Medicine name 5',
                          labelText: 'Medicine 5',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.med5 = value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Med1(value!);
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller:
                            _prescriptions_doctor_controller.dose5Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          //icon: Icon(Icons.),
                          hintText: 'Doses 5',
                          labelText: 'Doses 5',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.dose5 = value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Dose1(value!);
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller: _prescriptions_doctor_controller
                            .instruction5Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.line_weight),
                          hintText: 'Instructions 5',
                          labelText: 'Instructions 5',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.instruction5 =
                              value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Inst1(value!);
                        },
                      ),
                    ),
                  ],
                ),

                ///medicine_6.......
                SizedBox(
                  height: size.height * 0.012,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Med 6',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: size.height * 0.019,
                        color: Colors.red,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller:
                            _prescriptions_doctor_controller.med6Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.line_weight),
                          hintText: 'Medicine name 6',
                          labelText: 'Medicine 6',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.med6 = value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Med1(value!);
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller:
                            _prescriptions_doctor_controller.dose6Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          //icon: Icon(Icons.),
                          hintText: 'Doses 6',
                          labelText: 'Doses 6',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.dose6 = value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Dose1(value!);
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller: _prescriptions_doctor_controller
                            .instruction6Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.line_weight),
                          hintText: 'Instructions 6',
                          labelText: 'Instructions 6',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.instruction6 =
                              value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Inst1(value!);
                        },
                      ),
                    ),
                  ],
                ),

                ///medicine_7..........
                SizedBox(
                  height: size.height * 0.012,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Med 7',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: size.height * 0.019,
                        color: Colors.red,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller:
                            _prescriptions_doctor_controller.med7Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.line_weight),
                          hintText: 'Medicine name 7',
                          labelText: 'Medicine 7',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.med7 = value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Med1(value!);
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller:
                            _prescriptions_doctor_controller.dose7Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          //icon: Icon(Icons.),
                          hintText: 'Doses 7',
                          labelText: 'Doses 7',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.dose7 = value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Dose1(value!);
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller: _prescriptions_doctor_controller
                            .instruction7Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.line_weight),
                          hintText: 'Instructions 7',
                          labelText: 'Instructions 7',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.instruction7 =
                              value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Inst1(value!);
                        },
                      ),
                    ),
                  ],
                ),

                ///medicine_8.........

                SizedBox(
                  height: size.height * 0.012,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Med 8',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: size.height * 0.019,
                        color: Colors.red,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller:
                            _prescriptions_doctor_controller.med8Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.line_weight),
                          hintText: 'Medicine name 8',
                          labelText: 'Medicine 8',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.med8 = value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Med1(value!);
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller:
                            _prescriptions_doctor_controller.dose8Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          //icon: Icon(Icons.),
                          hintText: 'Doses 8',
                          labelText: 'Doses 8',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.dose8 = value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Dose1(value!);
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller: _prescriptions_doctor_controller
                            .instruction8Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.line_weight),
                          hintText: 'Instructions 8',
                          labelText: 'Instructions 8',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.instruction8 =
                              value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Inst1(value!);
                        },
                      ),
                    ),
                  ],
                ),

                ///medicine_9........
                SizedBox(
                  height: size.height * 0.012,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Med 9',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: size.height * 0.019,
                        color: Colors.red,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller:
                            _prescriptions_doctor_controller.med9Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.line_weight),
                          hintText: 'Medicine name 9',
                          labelText: 'Medicine 9',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.med9 = value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Med1(value!);
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller:
                            _prescriptions_doctor_controller.dose9Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          //icon: Icon(Icons.),
                          hintText: 'Doses 9',
                          labelText: 'Doses 9',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.dose9 = value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Dose1(value!);
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller: _prescriptions_doctor_controller
                            .instruction9Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.line_weight),
                          hintText: 'Instructions 9',
                          labelText: 'Instructions 9',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.instruction9 =
                              value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Inst1(value!);
                        },
                      ),
                    ),
                  ],
                ),

                ///medicine_10...........
                SizedBox(
                  height: size.height * 0.012,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Med 10',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: size.height * 0.019,
                        color: Colors.red,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller:
                            _prescriptions_doctor_controller.med10Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.line_weight),
                          hintText: 'Medicine name 10',
                          labelText: 'Medicine 10',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.med10 = value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Med1(value!);
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller:
                            _prescriptions_doctor_controller.dose10Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          //icon: Icon(Icons.),
                          hintText: 'Doses 10',
                          labelText: 'Doses 10',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.dose10 = value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Dose1(value!);
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: TextFormField(
                        controller: _prescriptions_doctor_controller
                            .instruction10Controller,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.line_weight),
                          hintText: 'Instructions 10',
                          labelText: 'Instructions 10',
                        ),
                        onSaved: (value) {
                          _prescriptions_doctor_controller.instruction10 =
                              value!;
                        },
                        validator: (value) {
                          // return _prescriptions_doctor_controller.Inst1(value!);
                        },
                      ),
                    ),
                  ],
                ),

                ///...................

                SizedBox(
                  height: size.height * 0.01,
                ),
                ElevatedButton(
                  onPressed: () {
                    _prescriptions_doctor_controller.checkPrescription1();
                    CallLoader.hideLoader();
                    //_prescriptions_doctor_controller.checkPrescription1();
                    // Get.dialog(
                    //   Column(
                    //     mainAxisAlignment:
                    //     MainAxisAlignment
                    //         .center,
                    //     children: [
                    //       Padding(
                    //         padding:
                    //         const EdgeInsets.symmetric(horizontal: 30),
                    //         child:
                    //         Container(
                    //           decoration:
                    //           const BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.all(
                    //               Radius.circular(20),
                    //             ),
                    //           ),
                    //           child:
                    //           Padding(
                    //             padding: const EdgeInsets.all(20.0),
                    //             child: Material(
                    //               child: Column(
                    //                 children: [
                    //                   const SizedBox(height: 10),
                    //                   Text(
                    //                     "You want give prescription ?",
                    //                     textAlign: TextAlign.center,
                    //                     style: TextStyle(
                    //                       fontSize: 16,
                    //                       color: Colors.cyan.shade700,
                    //                       fontWeight: FontWeight.w800,
                    //                     ),
                    //                   ),
                    //                   const SizedBox(height: 15),
                    //                   const Text(
                    //                     "You can give your prescriptions and suggest your medicine.",
                    //                     textAlign: TextAlign.center,
                    //                   ),
                    //                   const SizedBox(height: 20),
                    //                   //Buttons
                    //                   Row(
                    //                     children: [
                    //                       Expanded(
                    //                         child: ElevatedButton(
                    //                           style: ElevatedButton.styleFrom(
                    //                             minimumSize: const Size(0, 45),
                    //                             primary: Colors.red,
                    //                             onPrimary: const Color(0xFFFFFFFF),
                    //                             shape: RoundedRectangleBorder(
                    //                               borderRadius: BorderRadius.circular(8),
                    //                             ),
                    //                           ),
                    //                           onPressed: () {
                    //                             Get.back();
                    //                           },
                    //                           child: const Text(
                    //                             'NO',
                    //                             style: TextStyle(
                    //                               fontSize: 20,
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                       const SizedBox(width: 10),
                    //                       Expanded(
                    //                         child: ElevatedButton(
                    //                           style: ElevatedButton.styleFrom(
                    //                             minimumSize: const Size(0, 45),
                    //                             primary: Colors.green.shade800,
                    //                             onPrimary: const Color(0xFFFFFFFF),
                    //                             shape: RoundedRectangleBorder(
                    //                               borderRadius: BorderRadius.circular(8),
                    //                             ),
                    //                           ),
                    //                           onPressed: () async {
                    //                             // await _callNumber("${_doctorHomepageController.founddoctoraptProducts2?[index].mobileNumber}".toString());
                    //                             Get.back();
                    //                             Get.to(PrescriptionsDoctor());
                    //                           },
                    //                           child: const Text(
                    //                             'Yes',
                    //                             style: TextStyle(
                    //                               fontSize: 20,
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // );
                    //print(
                    //"mobilee:${_doctorHomepageController.founddoctoraptProducts2?[index].mobileNumber}");

                    //   Get.to(
                    //       UserVideoAudio());.....
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.orangeAccent),
                    shadowColor: MaterialStateProperty.all(Colors.orangeAccent),
                    elevation: MaterialStateProperty.all(16),
                    minimumSize: MaterialStateProperty.all(const Size(60, 40)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Add priscription',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
