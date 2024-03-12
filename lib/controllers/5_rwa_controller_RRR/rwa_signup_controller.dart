import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';

import '../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class RWASignupController extends GetxController {
  TextEditingController? AuthorityName,
      PhoneNumber,
      MobileNumber,
      EmailId,
      Password,
      ConfirmPassword,
      StateMaster_Id,
      CityMaster_Id,
      Location,
      LandlineNumber,
      Pincode,
      CertificateImage;
  // dropdown
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;
  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel> states = <StateModel>[];

  void getStateApi() async {
    states = await ApiProvider.getSatesApi();
  }

  void getCityByStateID(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
  }

  void rwaSignupApi() async {
    http.Response r = await ApiProvider.RWASignupApi(
        AuthorityName?.text,
        PhoneNumber?.text,
        MobileNumber?.text,
        EmailId?.text,
        Password?.text,
        ConfirmPassword?.text,
        selectedState.value?.id.toString(),
        selectedCity.value?.id.toString(),
        Location?.text,
        LandlineNumber?.text,
        Pincode?.text,
        CertificateImage?.text);
    if (r.statusCode == 200) {
    } else {}
  }

  @override
  void onInit() {
    getStateApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
    AuthorityName = TextEditingController(text: '');
    PhoneNumber = TextEditingController(text: '');
    MobileNumber = TextEditingController(text: '');
    EmailId = TextEditingController(text: '');
    Password = TextEditingController(text: '');
    ConfirmPassword = TextEditingController(text: '');
    Location = TextEditingController(text: '');
    LandlineNumber = TextEditingController(text: '');
    Pincode = TextEditingController(text: '');
    CertificateImage = TextEditingController(text: '');
    super.onInit();
  }
}
