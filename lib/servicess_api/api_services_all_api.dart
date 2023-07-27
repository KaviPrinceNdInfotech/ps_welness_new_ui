import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/10_lab_module/lab_model_byId.dart';
import 'package:ps_welness_new_ui/model/10_lab_module/lab_upload_dropdown_patient/lab_patient_dropdown_api.dart';
import 'package:ps_welness_new_ui/model/1_user_model/about_us_user_model/user_aboutus_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/ambulance/ambulance_type_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/ambulance/vehicle_type3_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/lab_details/lab_appointment_history.dart';
import 'package:ps_welness_new_ui/model/1_user_model/lab_details/lab_details_api.dart';
import 'package:ps_welness_new_ui/model/1_user_model/medicine_order/medicine_order_history.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_appointment_models/nurse_detail_id.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_appointment_models/nurse_list_modelby_locationid.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_appointment_models/nurse_type_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/report_moidel3/doctor_userrr_model/doctor_report_model_listss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/report_moidel3/doctor_userrr_model/doctor_view_report_modell.dart';
import 'package:ps_welness_new_ui/model/1_user_model/report_moidel3/lab_userr_model/lab_report_model_list.dart';
import 'package:ps_welness_new_ui/model/1_user_model/report_moidel3/lab_userr_model/lab_report_view_models.dart';
import 'package:ps_welness_new_ui/model/1_user_model/report_moidel3/nurse_userrr_model/nursee_report_model_listss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/report_moidel3/nurse_userrr_model/nurseee_view_report_modell.dart';
import 'package:ps_welness_new_ui/model/1_user_model/test_name_model/test_name_modells.dart';
import 'package:ps_welness_new_ui/model/1_user_model/user_profile_details/user_profile_details.dart';
import 'package:ps_welness_new_ui/model/1_user_model/wallet_model/wallet_section_model.dart';
import 'package:ps_welness_new_ui/model/4_nurse_all_models/nurse_appointment_details_list.dart';
import 'package:ps_welness_new_ui/model/4_nurse_all_models_RRR/dropdown_list_patient_nurse.dart';
import 'package:ps_welness_new_ui/model/4_nurse_all_models_RRR/nurse_aboutus_model.dart';
import 'package:ps_welness_new_ui/model/4_nurse_all_models_RRR/nurse_view_imagereport.dart';
import 'package:ps_welness_new_ui/model/4_nurse_all_models_RRR/nurse_view_report.dart';
import 'package:ps_welness_new_ui/model/5_RWA_controller_RRR/rwa_aboutus_model.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/patient_list.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model_RRR/doctor_homepage_model/doctor_report_image_view.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model_RRR/doctor_homepage_model/doctor_view_report11_model.dart';
import 'package:ps_welness_new_ui/model/banner_image_model/banner_get_api.dart';
import 'package:ps_welness_new_ui/model/franchies_models/franchies_specialist.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/10_lab_module/lab_about_us/lab_about_us_detail.dart';
import '../model/10_lab_module/lab_appointment_details/lab_appointment_detailsss.dart';
import '../model/10_lab_module/lab_appointment_history/lab_appointment_history.dart';
import '../model/10_lab_module/lab_appointment_historyy_latest/lab_appointment_history_model.dart';
import '../model/10_lab_module/lab_profile_detail_model/profile_details_model.dart';
import '../model/10_lab_module/lab_report_view_model/lab_report_image.dart';
import '../model/10_lab_module/lab_report_view_model/lab_report_view_model.dart';
import '../model/1_user_model/ambulance/accepted_driver_models.dart';
import '../model/1_user_model/ambulance/ambulance_catagary2_model.dart';
import '../model/1_user_model/ambulance/driver_list_model.dart';
import '../model/1_user_model/city_model/city_modelss.dart';
import '../model/1_user_model/complain_dropdown_subject_model/complain_dropdown_get_model.dart';
import '../model/1_user_model/doctor_appointment_history_model/user_doctor_apointment_history.dart';
import '../model/1_user_model/doctor_checkout_model/doctor_checkout_modell.dart';
import '../model/1_user_model/doctor_list_byhospitalid/doctor_list_through_api.dart';
import '../model/1_user_model/get_department_list_model/department_model.dart';
import '../model/1_user_model/get_speacilist_bydeptid_model/get_speacilist_bydeptid.dart';
import '../model/1_user_model/health_checkup_list/health_checkup_list.dart';
import '../model/1_user_model/health_chekup_list_views/health_checkup_list_views.dart';
import '../model/1_user_model/health_chkp_checkout_model/health_chkp_chkout_model.dart';
import '../model/1_user_model/hlthchkp_detail_model/healthchkp_detail_model.dart';
import '../model/1_user_model/lab_details/lab_checkout_modells.dart';
import '../model/1_user_model/lab_list_models.dart';
import '../model/1_user_model/medicine_cart_list_model/medicine_cart_list_models.dart';
import '../model/1_user_model/medicine_checkout/medicine_checkout_model.dart';
import '../model/1_user_model/medicine_checkout/medicine_original_chekout.dart';
import '../model/1_user_model/medicine_list_address_dwlivery_api/medicine_list_address_model.dart';
import '../model/1_user_model/medicine_list_model/medicine_list_models.dart';
import '../model/1_user_model/nurse_location_model/nurse_location_models.dart';
import '../model/1_user_model/nurse_type_model/nurse_type_model.dart';
import '../model/1_user_model/states_model/state_modells.dart';
import '../model/1_user_model/time_slots_common_model/time_slots_common.dart';
import '../model/1_user_model/view_doctor_review_ratting/view_doctor_review_ratting.dart';
import '../model/1_user_model/view_healthchkp_review/healthchkp_review_view.dart';
import '../model/1_user_model/view_review_model/nurse_view_review_model.dart';
import '../model/3_driver_controllers_RRR/user_list_booking_driver/user_list_booking_driver_controller.dart';
import '../model/6_chemist_model_RRR/chemist_model_RRR/chemist_aboutus_model.dart';
import '../model/6_chemist_model_RRR/chemist_model_RRR/chemist_profile_detailModel.dart';
import '../model/9_doctors_model/doctor_profile_model.dart';
import '../model/9_doctors_model/get_all_skils_model/get_all_skils_model.dart';
//mport '../model/9_doctors_model/get_doctor_list_model/get_doctorlist_model.dart';
import '../model/9_doctors_model/view_patient_report_model.dart';
import '../model/9_doctors_model_RRR/doctor_homepage_model/about_us_model/about_us_model.dart';
import '../model/9_doctors_model_RRR/doctor_homepage_model/dropdown_patient_list_model/dropdown_patient_list_model.dart';
import '../model/9_prince_doctors_model/doctor_payment_history.dart';
import '../model/9_prince_doctors_model/get_doctor_list_model/get_doctorlist_model.dart';
import '../model/lab_review_model/lab_view_review_model.dart';
import '../modules_view/1_user_section_views/doctorss/doctor_appointments_details/doctor_details_by_id/doctor_detail_by_id_model.dart';
import '../modules_view/1_user_section_views/nursess/nurse_list_userrrr/nurse_list_user_model.dart';
import '../modules_view/circular_loader/circular_loaders.dart';

var prefs = GetStorage();

class ApiProvider {
  static var baseUrl = 'http://test.pswellness.in/';
  //static var baseUrl1 = 'https://api.gyros.farm/';
  //'http://pswellness.in/';
  static String token = '';
  static String Token = '';
  //static String catid = '';
  //static String productid = '';
  //static String orderid = '';
  static String Id = '';
  static String MedicineId = ''.toString();
  static String adminId = ''.toString();
  static String userid = ''.toString();

  static String StatemasterId = ''.toString();
  static String CitymasterId = ''.toString();
  static String LabtestId = ''.toString();
  static String nursebooking_Id = ''.toString();
  static String labbooking_Id = "".toString();
  static String doctorbooking_Id = ''.toString();
  static String lat = "".toString();
  static String lng = "".toString();
  static String lat2 = "".toString();
  static String lng2 = "".toString();
  static String vehicletypeid = "".toString();
  static String ambulancetypeid = "".toString();

  static String userdriverid = "".toString();
  static String AdminLoginId = ''.toString();

  static String BookingId = ''.toString();

  static String PatientRegNo = ''.toString();
  static String userPassword = ''.toString();

  static String DriverId = ''.toString();
  static String driverpassword = ''.toString();

  // static String ImageBase64 =
  //     "PCFET0NUWVBFIGh0bWw+CjxodG1sIGxhbmc9ImVuIj4KCjxoZWFkPgogIDxtZXRhIGNoYXJzZXQ9IlVURi04Ij4KICA8bGluayByZWw9InN0eWxlc2hlZXQiIGhyZWY9Imh0dHBzOi8vY2RuLmpzZGVsaXZyLm5ldC9ucG0vc3dpcGVyQDgvc3dpcGVyLWJ1bmRsZS5taW4uY3NzIiAvPgogIDxsaW5rIGhyZWY9Imh0dHBzOi8vZm9udHMuZ29vZ2xlYXBpcy5jb20vY3NzP2ZhbWlseT1OdW5pdG8rU2Fuczo0MDAsNDAwaSw3MDAsOTAwJmRpc3BsYXk9c3dhcCIgcmVsPSJzdHlsZXNoZWV0Ij4KICA8bWV0YSBodHRwLWVxdWl2PSJYLVVBLUNvbXBhdGlibGUiIGNvbnRlbnQ9IklFPWVkZ2UiPgogIDxzY3JpcHQgc3JjPSJodHRwczovL2Nkbi5qc2RlbGl2ci5uZXQvbnBtL3N3aXBlckA4L3N3aXBlci1idW5kbGUubWluLmpzIj48L3NjcmlwdD4KICA8bWV0YSBuYW1lPSJ2aWV3cG9ydCIgY29udGVudD0id2lkdGg9ZGV2aWNlLXdpZHRoLCBpbml0aWFsLXNjYWxlPTEuMCI+CiAgPGxpbmsgaHJlZj0iaHR0cHM6Ly9jZG4uanNkZWxpdnIubmV0L25wbS9ib290c3RyYXBANS4xLjMvZGlzdC9jc3MvYm9vdHN0cmFwLm1pbi5jc3MiIHJlbD0ic3R5bGVzaGVldCIKICAgIGludGVncml0eT0ic2hhMzg0LTFCbUU0a1dCcTc4aVloRmxkdkt1aGZUQVU2YXVVOHRUOTRXckhmdGpEYnJDRVhTVTFvQm9xeWwyUXZaNmpJVzMiIGNyb3Nzb3JpZ2luPSJhbm9ueW1vdXMiPgogIDxsaW5rIGhyZWY9Imh0dHBzOi8vY2RuanMuY2xvdWRmbGFyZS5jb20vYWpheC9saWJzL3R3aXR0ZXItYm9vdHN0cmFwLzQuMy4xL2Nzcy9ib290c3RyYXAubWluLmNzcyIgcmVsPSJzdHlsZXNoZWV0IiAvPgogIDxzY3JpcHQgc3JjPSJodHRwczovL2NoZWNrb3V0LnJhem9ycGF5LmNvbS92MS9jaGVja291dC5qcyI+PC9zY3JpcHQ+CiAgPGxpbmsgcmVsPSJzdHlsZXNoZWV0IiBocmVmPSJpbmRleC5jc3MiIHR5cGU9InRleHQvY3NzIj4KICA8bGluayByZWw9InN0eWxlc2hlZXQiIGhyZWY9Imh0dHBzOi8vY2RuanMuY2xvdWRmbGFyZS5jb20vYWpheC9saWJzLwpmb250LWF3ZXNvbWUvNS4xNS4yL2Nzcy9hbGwubWluLmNzcyIgLz4KICA8bGluayByZWw9InN0eWxlc2hlZXQiCiAgICBocmVmPSJodHRwczovL2ZvbnRzLmdvb2dsZWFwaXMuY29tL2Nzcz9mYW1pbHk9TWF0ZXJpYWwrSWNvbnN8Um9ib3RvOjQwMCw1MDAsNzAwfFNvdXJjZStDb2RlK1BybyIgLz4KICA8bGluayByZWw9InN0eWxlc2hlZXQiCiAgICBocmVmPSJodHRwczovL2Nkbi5qc2RlbGl2ci5uZXQvZ2gvbWxhdXJzZW4vcmVhY3QtbWRANS4xLjQvdGhlbWVzL3JlYWN0LW1kLnRlYWwtcGluay0yMDAtbGlnaHQubWluLmNzcyIgLz4KICA8c2NyaXB0IHNyYz0iaHR0cHM6Ly9jZG4uanNkZWxpdnIubmV0L25wbS9ib290c3RyYXBANS4xLjMvZGlzdC9qcy9ib290c3RyYXAuYnVuZGxlLm1pbi5qcyIKICAgIGludGVncml0eT0ic2hhMzg0LWthN1NrMEdsbjRnbXR6Mk1sUW5pa1Qxd1hnWXNPZytPTWh1UCtJbFJIOXNFTkJPMExSbjVxKzhuYlRvdjQrMXAiCiAgICBjcm9zc29yaWdpbj0iYW5vbnltb3VzIj48L3NjcmlwdD4KICA8c2NyaXB0IHNyYz0iaHR0cHM6Ly9jZG4uanNkZWxpdnIubmV0L25wbS9AcG9wcGVyanMvY29yZUAyLjEwLjIvZGlzdC91bWQvcG9wcGVyLm1pbi5qcyIKICAgIGludGVncml0eT0ic2hhMzg0LTcrekNOai9JcUo5NXdvMTZvTXRmc0tiWjljY0VoMzFlT3oxSEd5RHVDUTZ3Z255Sk5TWWRyUGEwM3J0UjF6ZEIiCiAgICBjcm9zc29yaWdpbj0iYW5vbnltb3VzIj48L3NjcmlwdD4KICA8c2NyaXB0IHNyYz0iaHR0cHM6Ly9jZG4uanNkZWxpdnIubmV0L25wbS9ib290c3RyYXBANS4xLjMvZGlzdC9qcy9ib290c3RyYXAubWluLmpzIgogICAgaW50ZWdyaXR5PSJzaGEzODQtUUpIdHZHaG1yOVhPSXBJNllWdXRHKzJRT0s5VCtabk40a3pGTjFSdEszekVGRUlzeGhsbVdsNS9ZRVN2cFoxMyIKICAgIGNyb3Nzb3JpZ2luPSJhbm9ueW1vdXMiPjwvc2NyaXB0PgoKICA8bGluayByZWw9InN0eWxlc2hlZXQiIGhyZWY9Ii8vY29kZS5qcXVlcnkuY29tL3VpLzEuMTMuMi90aGVtZXMvYmFzZS9qcXVlcnktdWkuY3NzIj4KICA8bGluayByZWw9InN0eWxlc2hlZXQiIGhyZWY9Ii9yZXNvdXJjZXMvZGVtb3Mvc3R5bGUuY3NzIj4KICA8c2NyaXB0IHNyYz0iaHR0cHM6Ly9jb2RlLmpxdWVyeS5jb20vanF1ZXJ5LTMuNi4wLmpzIj48L3NjcmlwdD4KICA8c2NyaXB0IHNyYz0iaHR0cHM6Ly9jb2RlLmpxdWVyeS5jb20vdWkvMS4xMy4yL2pxdWVyeS11aS5qcyI+PC9zY3JpcHQ+CgogIDxzY3JpcHQgc3JjPSJodHRwczovL2FqYXguZ29vZ2xlYXBpcy5jb20vYWpheC9saWJzL2pxdWVyeS8zLjYuMS9qcXVlcnkubWluLmpzIj48L3NjcmlwdD4KCgoKICA8c2NyaXB0IHNyYz0iLy9jZG4uanNkZWxpdnIubmV0L25wbS9zd2VldGFsZXJ0MkAxMSI+PC9zY3JpcHQ+CiAgPHNjcmlwdCBzcmM9Imh0dHBzOi8vY2RuanMuY2xvdWRmbGFyZS5jb20vYWpheC9saWJzL2pxdWVyeS8zLjIuMS9qcXVlcnkubWluLmpzIiA+PC9zY3JpcHQ+CgogIDxsaW5rIHJlbD0ic3R5bGVzaGVldCIgaHJlZj0iaHR0cHM6Ly9jZG5qcy5jbG91ZGZsYXJlLmNvbS9hamF4L2xpYnMvZm9udC1hd2Vzb21lLzUuMTMuMC9jc3MvYWxsLm1pbi5jc3MiIC8+CgoKCiAgPHNjcmlwdCBzcmM9Imh0dHBzOi8vY2RuLmpzZGVsaXZyLm5ldC9naC9hbHBpbmVqcy9hbHBpbmVAdjIueC54L2Rpc3QvYWxwaW5lLm1pbi5qcyIgZGVmZXI+PC9zY3JpcHQ+CgogIDxsaW5rIHJlbD0ic3R5bGVzaGVldCIgaHJlZj0iaHR0cHM6Ly9zdGFja3BhdGguYm9vdHN0cmFwY2RuLmNvbS9ib290c3RyYXAvNC40LjEvY3NzL2Jvb3RzdHJhcC5taW4uY3NzIgogICAgaW50ZWdyaXR5PSJzaGEzODQtVmtvbzh4NENHc08zK0hoeHY4VC9RNVBhWHRrS3R1NnVnNVRPZU5WNmdCaUZlV1BHRk45TXVoT2YyM1E5SWZqaCIgY3Jvc3NPcmlnaW49ImFub255bW91cyIgLz4KICA8c2NyaXB0IHNyYz0iaHR0cHM6Ly9jZG4udGFpbHdpbmRjc3MuY29tIj48L3NjcmlwdD4KICA8c2NyaXB0IHNyYz0iaHR0cHM6Ly9zdGFja3BhdGguYm9vdHN0cmFwY2RuLmNvbS9ib290c3RyYXAvNC4zLjEvY3NzL2Jvb3RzdHJhcC5taW4uY3NzIj48L3NjcmlwdD4KICA8c2NyaXB0IHNyYz0iLy9jZG4uY2tlZGl0b3IuY29tLzQuNi4xL2Jhc2ljL2NrZWRpdG9yLmpzIj48L3NjcmlwdD4KICA8c2NyaXB0IHNyYz0iaHR0cHM6Ly9zdGFja3BhdGguYm9vdHN0cmFwY2RuLmNvbS9ib290c3RyYXAvNC4zLjEvanMvYm9vdHN0cmFwLmJ1bmRsZS5taW4uanMiPjwvc2NyaXB0PgogIDxzY3JpcHQgdHlwZT0idGV4dC9qYXZhc2NyaXB0IiBzcmM9ImpzL3NjcmlwdC5qcyI+PC9zY3JpcHQ+CiAgPHNjcmlwdCBzcmM9Imh0dHBzOi8vY2RuanMuY2xvdWRmbGFyZS5jb20vYWpheC9saWJzL2pxdWVyeS8zLjIuMS9qcXVlcnkubWluLmpzIj48L3NjcmlwdD4KICA8bGluayByZWw9InNob3J0Y3V0IGljb24iIGhyZWY9Ii4vaW1hZ2VzL2xvZ28ucG5nIiBzaXplcz0iOTZweCo5NnB4IiB0eXBlPSJpbWFnZS9wbmciIC8+CiAgPHRpdGxlPkd5cm9zIC0gTGV0J3MgVHVybiB0byBOYXR1cmUgZm9yIEhlYWx0aHkgRnV0dXJlPC90aXRsZT4KICA8bGluayByZWw9InN0eWxlc2hlZXQiIGhyZWY9Imh0dHBzOi8vY2RuLmpzZGVsaXZyLm5ldC9ucG0vYm9vdHN0cmFwQDQuMC4wL2Rpc3QvY3NzL2Jvb3RzdHJhcC5taW4uY3NzIgogICAgaW50ZWdyaXR5PSJzaGEzODQtR241Mzg0eHFRMWFvV1hBKzA1OFJYUHhQZzZmeTRJV3ZUTmgwRTI2M1htRmNKbFNBd2lHZ0ZBVy9kQWlTNkpYbSIgY3Jvc3NvcmlnaW49ImFub255bW91cyI+CiAgPHNjcmlwdCBzcmM9Imh0dHBzOi8vY2RuLmpzZGVsaXZyLm5ldC9ucG0vYm9vdHN0cmFwQDQuMC4wL2Rpc3QvanMvYm9vdHN0cmFwLm1pbi5qcyIKICAgIGludGVncml0eT0ic2hhMzg0LUpaUjZTcGVqaDRVMDJkOGpPdDZ2TEVIZmUvSlFHaVJSU1FReFNmRldwaTFNcXVWZEF5alVhcjUrNzZQVkNtWWwiCiAgICBjcm9zc29yaWdpbj0iYW5vbnltb3VzIj48L3NjcmlwdD4KICA8bWV0YSBuYW1lPSJ2aWV3cG9ydCIgY29udGVudD0id2lkdGg9ZGV2aWNlLXdpZHRoLCBpbml0aWFsLXNjYWxlPTEiIC8+CiAgPG1ldGEgbmFtZT0idGhlbWUtY29sb3IiIGNvbnRlbnQ9IiMwMDAwMDAiIC8+CiAgPG1ldGEgbmFtZT0iZGVzY3JpcHRpb24iIGNvbnRlbnQ9IldlYiBzaXRlIGNyZWF0ZWQgdXNpbmcgY3JlYXRlLXJlYWN0LWFwcCIgLz4KICA8IS0tIDxsaW5rIHJlbD0iYXBwbGUtdG91Y2gtaWNvbiIgaHJlZj0iL2xvZ28xOTIucG5nIiAvPiAtLT4KCiAgPGxpbmsgcmVsPSJtYW5pZmVzdCIgaHJlZj0iL21hbmlmZXN0Lmpzb24iIC8+CgoKICA8IS0tbW9iaWxlIHZpZXcgbGluay0tPgogIDwhLS0galF1ZXJ5IC0tPgoKPCEtLSBGb250IEF3ZXNvbWUgNC0tPgo8bGluayBocmVmPSJodHRwczovL3N0YWNrcGF0aC5ib290c3RyYXBjZG4uY29tL2ZvbnQtYXdlc29tZS80LjcuMC9jc3MvZm9udC1hd2Vzb21lLm1pbi5jc3MiIHJlbD0ic3R5bGVzaGVldCI+Cgo8c2NyaXB0IHNyYz0ianMvc2lkZWJhci1hY2NvcmRpb24uanMiPjwvc2NyaXB0PgoKICA8IS0tbW9iaWxlIC0tPgoKCgogIDwhLS1oZ2ZoZmhnamhnamdoai0tPgogIDxzY3JpcHQgc3JjPSJodHRwczovL2FqYXguZ29vZ2xlYXBpcy5jb20vYWpheC9saWJzL2pxdWVyeS8yLjIuNC9qcXVlcnkubWluLmpzIj48L3NjcmlwdD4KICA8c2NyaXB0IHNyYz0iaHR0cHM6Ly9jZG5qcy5jbG91ZGZsYXJlLmNvbS9hamF4L2xpYnMvbW9kZXJuaXpyLzIuOC4zL21vZGVybml6ci5qcyI+PC9zY3JpcHQ+CiAgPHN0eWxlPgogICAgLm5vLWpzICNsb2FkZXIgewogICAgICBkaXNwbGF5OiBub25lOwogICAgfQoKICAgIC5qcyAjbG9hZGVyIHsKICAgICAgZGlzcGxheTogYmxvY2s7CiAgICAgIHBvc2l0aW9uOiBhYnNvbHV0ZTsKICAgICAgbGVmdDogMTAwcHg7CiAgICAgIHRvcDogMDsKICAgIH0KCiAgICAuc2UtcHJlLWNvbiB7CiAgICAgIHBvc2l0aW9uOiBmaXhlZDsKICAgICAgbGVmdDogMHB4OwogICAgICB0b3A6IDBweDsKICAgICAgd2lkdGg6IDEwMCU7CiAgICAgIGhlaWdodDogMTAwJTsKICAgICAgei1pbmRleDogOTk5OTsKICAgICAgIGJhY2tncm91bmQ6IHVybCgpIGNlbnRlciBuby1yZXBlYXQgI2ZmZjsgCiAgICAgIGJhY2tncm91bmQtc2l6ZTogMTAwJSAxMDAlOwogICAgfQogIDwvc3R5bGU+CiAgPHNjcmlwdD4kKHdpbmRvdykubG9hZChmdW5jdGlvbiAoKSB7CiAgICAgIC8vIEFuaW1hdGUgbG9hZGVyIG9mZiBzY3JlZW4KICAgICAgJCgiLnNlLXByZS1jb24iKS5mYWRlT3V0KCJzbG93Iik7OwogICAgfSk7PC9zY3JpcHQ+CgoKCgo8L2hlYWQ+Cgo8Ym9keT4KICA8bm9zY3JpcHQ+WW91IG5lZWQgdG8gZW5hYmxlIEphdmFTY3JpcHQgdG8gcnVuIHRoaXMgYXBwLjwvbm9zY3JpcHQ+CgogIDxkaXYgaWQ9InJvb3QiPjwvZGl2PgogIDwhLS0gPGRpdiBjbGFzcz0ic3Bpbm5lci13cmFwcGVyIj4KICAgCiAgICA8ZGl2IGNsYXNzPSJzcGlubmVyIj48L2Rpdj4gLS0+CgogIDxkaXYgY2xhc3M9InNlLXByZS1jb24iPjwvZGl2PgogIDwvZGl2PgogIDxzY3JpcHQ+CiAgICB2YXIgdXJsID0gJ2h0dHBzOi8vd2F0aS1pbnRlZ3JhdGlvbi1zZXJ2aWNlLmNsYXJlLmFpL1Nob3BpZnlXaWRnZXQvc2hvcGlmeVdpZGdldC5qcz80NDAzJzsKICAgIHZhciBzID0gZG9jdW1lbnQuY3JlYXRlRWxlbWVudCgnc2NyaXB0Jyk7CiAgICBzLnR5cGUgPSAndGV4dC9qYXZhc2NyaXB0JzsKICAgIHMuYXN5bmMgPSB0cnVlOwogICAgcy5zcmMgPSB1cmw7CiAgICB2YXIgb3B0aW9ucyA9IHsKICAgICAgImVuYWJsZWQiOiB0cnVlLAogICAgICAiY2hhdEJ1dHRvblNldHRpbmciOiB7CiAgICAgICAgImJhY2tncm91bmRDb2xvciI6ICIjNGRjMjQ3IiwKICAgICAgICAiY3RhVGV4dCI6ICIiLAogICAgICAgICJib3JkZXJSYWRpdXMiOiAiMjUiLAogICAgICAgICJtYXJnaW5MZWZ0IjogIjAiLAogICAgICAgICJtYXJnaW5Cb3R0b20iOiAiNTAiLAogICAgICAgICJtYXJnaW5SaWdodCI6ICI1MCIsCiAgICAgICAgInBvc2l0aW9uIjogInJpZ2h0IgogICAgICB9LAogICAgICAiYnJhbmRTZXR0aW5nIjogewogICAgICAgICJicmFuZE5hbWUiOiAiR3lyb3MiLAogICAgICAgICJicmFuZFN1YlRpdGxlIjogIlR5cGljYWxseSByZXBsaWVzIHdpdGhpbiBhIGRheSIsCiAgICAgICAgImJyYW5kSW1nIjogImh0dHBzOi8vZ3lyb3MuZmFybS9zdGF0aWMvbWVkaWEvbG9nby5mZGRiYjRmNC5wbmciLAogICAgICAgICJ3ZWxjb21lVGV4dCI6ICJIaSB0aGVyZSFcbkhvdyBjYW4gSSBoZWxwIHlvdT8iLAogICAgICAgICJtZXNzYWdlVGV4dCI6ICJIZWxsbywgSSBoYXZlIGEgcXVlc3Rpb24gYWJvdXQge3twYWdlX2xpbmt9fSIsCiAgICAgICAgImJhY2tncm91bmRDb2xvciI6ICIjMGE1ZjU0IiwKICAgICAgICAiY3RhVGV4dCI6ICJTdGFydCBDaGF0IiwKICAgICAgICAiYm9yZGVyUmFkaXVzIjogIjI1IiwKICAgICAgICAiYXV0b1Nob3ciOiBmYWxzZSwKICAgICAgICAicGhvbmVOdW1iZXIiOiAiOTE4OTUwODAwNjMzIgogICAgICB9CiAgICB9OwogICAgcy5vbmxvYWQgPSBmdW5jdGlvbiAoKSB7CiAgICAgIENyZWF0ZVdoYXRzYXBwQ2hhdFdpZGdldChvcHRpb25zKTsKICAgIH07CiAgICB2YXIgeCA9IGRvY3VtZW50LmdldEVsZW1lbnRzQnlUYWdOYW1lKCdzY3JpcHQnKVswXTsKICAgIHgucGFyZW50Tm9kZS5pbnNlcnRCZWZvcmUocywgeCk7CiAgPC9zY3JpcHQ+CgogIDxzY3JpcHQ+CiAgICAkKGRvY3VtZW50KS5yZWFkeShmdW5jdGlvbiAoKSB7CiAgICAgIC8vUHJlbG9hZGVyCiAgICAgIHByZWxvYWRlckZhZGVPdXRUaW1lID0gMTAwMDAwOwogICAgICBmdW5jdGlvbiBoaWRlUHJlbG9hZGVyKCkgewogICAgICAgIHZhciBwcmVsb2FkZXIgPSAkKCcuc3Bpbm5lci13cmFwcGVyJyk7CiAgICAgICAgcHJlbG9hZGVyLmZhZGVPdXQocHJlbG9hZGVyRmFkZU91dFRpbWUpOwogICAgICB9CiAgICAgIGhpZGVQcmVsb2FkZXIoKTsKCgogICAgfSk7CiAgPC9zY3JpcHQ+CgoKCiAgPHNjcmlwdD4KICAgICQoZG9jdW1lbnQpLnJlYWR5KGZ1bmN0aW9uICgpIHsKICAgICAgJCgiI3AxIikuaGlkZSgpOwogICAgICAkKCIjcDIiKS5oaWRlKCk7CiAgICAgICQoIiNwMyIpLmhpZGUoKTsKICAgICAgJCgiI3A0IikuaGlkZSgpOwogICAgICAkKCIjcDUiKS5oaWRlKCk7CgogICAgICAkKCIjdDEiKS5zaG93KCk7CiAgICAgICQoIi5idXQxIikuY2xpY2soZnVuY3Rpb24gKCkgewogICAgICAgICQoIiNwMSIpLnNob3coKTsKICAgICAgICAkKCIjcDIiKS5oaWRlKCk7CiAgICAgICAgJCgiI3AzIikuaGlkZSgpOwogICAgICAgICQoIiNwNCIpLmhpZGUoKTsKICAgICAgICAkKCIjcDUiKS5oaWRlKCk7CiAgICAgICAgJCgiI3QxIikuaGlkZSgpOwogICAgICB9KTsKICAgICAgJCgiLmJ1dDIiKS5jbGljayhmdW5jdGlvbiAoKSB7CiAgICAgICAgJCgiI3AxIikuaGlkZSgpOwogICAgICAgICQoIiNwMiIpLnNob3coKTsKICAgICAgICAkKCIjcDMiKS5oaWRlKCk7CiAgICAgICAgJCgiI3A0IikuaGlkZSgpOwogICAgICAgICQoIiNwNSIpLmhpZGUoKTsKCiAgICAgICAgJCgiI3QxIikuaGlkZSgpOwogICAgICB9KTsKICAgICAgJCgiLmJ1dDMiKS5jbGljayhmdW5jdGlvbiAoKSB7CiAgICAgICAgJCgiI3AxIikuaGlkZSgpOwogICAgICAgICQoIiNwMiIpLmhpZGUoKTsKICAgICAgICAkKCIjcDMiKS5zaG93KCk7CiAgICAgICAgJCgiI3A0IikuaGlkZSgpOwoKICAgICAgICAkKCIjdDEiKS5oaWRlKCk7CiAgICAgICAgJCgiI3A1IikuaGlkZSgpOwogICAgICB9KTsKICAgICAgJCgiLmJ1dDQiKS5jbGljayhmdW5jdGlvbiAoKSB7CiAgICAgICAgJCgiI3AxIikuaGlkZSgpOwogICAgICAgICQoIiNwMiIpLmhpZGUoKTsKICAgICAgICAkKCIjcDMiKS5oaWRlKCk7CiAgICAgICAgJCgiI3A0Iikuc2hvdygpOwogICAgICAgICQoIiNwNSIpLmhpZGUoKTsKCiAgICAgICAgJCgiI3QxIikuaGlkZSgpOwogICAgICB9KTsKICAgICAgJCgiLmJ1dDUiKS5jbGljayhmdW5jdGlvbiAoKSB7CiAgICAgICAgJCgiI3AxIikuaGlkZSgpOwogICAgICAgICQoIiNwMiIpLmhpZGUoKTsKICAgICAgICAkKCIjcDMiKS5oaWRlKCk7CgogICAgICAgICQoIiN0MSIpLmhpZGUoKTsKICAgICAgICAkKCIjcDQiKS5oaWRlKCk7CiAgICAgICAgJCgiI3A1Iikuc2hvdygpOwogICAgICB9KTsKICAgIH0pOwogIDwvc2NyaXB0Pgo8c2NyaXB0IHNyYz0iL3N0YXRpYy9qcy9idW5kbGUuanMiPjwvc2NyaXB0PjxzY3JpcHQgc3JjPSIvc3RhdGljL2pzLzIuY2h1bmsuanMiPjwvc2NyaXB0PjxzY3JpcHQgc3JjPSIvc3RhdGljL2pzL21haW4uY2h1bmsuanMiPjwvc2NyaXB0PjxzY3JpcHQgc3JjPSIvbWFpbi4wZDViNDIyYjZhMTg5YzM0OTAzZi5ob3QtdXBkYXRlLmpzIj48L3NjcmlwdD48L2JvZHk+Cgo8L2h0bWw+"
  //         .toString();

  final box = GetStorage();

  //static String cartlistid = '';
  //static String addressid = '';
  //static String Message = "";

  ///TODO: here we have to add different api in this page...........
  /// TODO: from here user 1 section...........
  ///
  //user signup..............

  //login user api ps welness api 1..................................

  static UserSignUpApi(
    var PatientName,
    var EmailId,
    var MobileNumber,
    var Password,
    var State,
    var City,
    var Address,
    var Pincode,
  ) async {
    //var a= int.parse(State).toString();
    //var b= int.parse(City).toString();
    var url = baseUrl + 'api/PatientApi/PatientRegistration';

    var body = {
      "PatientName": PatientName,
      "EmailId": EmailId,
      "MobileNumber": MobileNumber,
      "Password": Password,
      "State": State,
      "City": City,
      "Address": Address,
      "Pincode": Pincode,
    };

    // print(body);

    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
      print(r.body);

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///here signup api of user.............24 april 2023...

  static UserSignUpApinew(
    var PatientName,
    var EmailId,
    var MobileNumber,
    var Password,
    var ConfirmPassword,
    var StateMasterId,
    var CityMasterId,
    var Location,
    var Pincode,
  ) async {
    var url = baseUrl + 'api/SignupApi/PatientRegistration';
    var body = {
      "PatientName": PatientName,
      "EmailId": EmailId,
      "MobileNumber": MobileNumber,
      "Password": Password,
      "ConfirmPassword": ConfirmPassword,
      "StateMaster_Id": StateMasterId,
      "CityMaster_Id": CityMasterId,
      "Location": Location,
      "Pincode": Pincode,
    };
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
      Get.snackbar('Success', r.body);
      print(r.body);

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///here delivery address api of user.............27 april 2023...

  static deliverymedicineAddressApi(
    var Name,
    var Email,
    //var Password,
    var MobileNumber,
    var StateMasterId,
    var CityMasterId,
    var DeliveryAddress,
    var PinCode,
    //var Patient_Id,
  ) async {
    var url = baseUrl + 'api/PatientApi/MedicineAddress';
    //saved id..........
    var prefs = GetStorage();
    //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid:${Id}');
    var body = {
      "Name": Name,
      "Email": Email,
      //"Password": "12345",
      "MobileNumber": MobileNumber,
      "StateMaster_Id": StateMasterId,
      "CityMaster_Id": CityMasterId,
      "DeliveryAddress": DeliveryAddress,
      "PinCode": PinCode,
      "Patient_Id": userid,
    };
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
      print(r.body);
      print(body);

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo:here lab booking1 api of user.............27 april 2023...

  static labbookingpostApi(
    var StateMasterId,
    var CityMasterId,
    var testId,
  ) async {
    var url = baseUrl + 'api/LabApi/LabBooking';
    var body = {
      "StateMaster_Id": StateMasterId,
      "CityMaster_Id": CityMasterId,
      "testId": testId,
    };
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
      print(r.body);
      print(body);

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo:here doctor booking1 api of user.............1 may 2023...

  static doctorbooking1postApi(
    var Department_id,
    var Specialist_id,
    var StateMaster_Id,
    var CityMaster_Id,
  ) async {
    var url = baseUrl + 'api/DoctorApi/DoctorChoose';
    var body = {
      "Department_id": Department_id,
      "Specialist_id": Specialist_id,
      "StateMaster_Id": StateMaster_Id,
      "CityMaster_Id": CityMaster_Id,
    };
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
      print(r.body);
      print(body);

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo nurse list detail...18april 2023....after api it will change in future it will based on location id...18 april 2023...................
  static NursecheckoutApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var NurseuserListId = preferences.getString("NurseuserListId");
    print("nurseuserlistId: ${NurseuserListId}");

    var prefs = GetStorage();
    // prefs.write("nursebooking_Id".toString(), json.decode(r.body)['NurseBookingId']);
    nursebooking_Id = prefs.read("nursebooking_Id").toString();
    // print('&&&&&&&&&&&&&&&&&nurse:${nursebooking_Id}’),

    var url =
        "http://test.pswellness.in/api/NurseServices/NurseAptmt?Nurse_Id=$NurseuserListId&NurseBookingId=$nursebooking_Id";
    // "http://test.pswellness.in/api/NurseServices/NurseAptmt?Nurse_Id=$NurseuserListId";//56 // 650
    // "$NurseuserListId";
    //baseUrl + 'api/NurseAppointmentAPI/NurseAppointmentList?NurseId=56';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("nurseuserlistIdcheckout:${r.body}");
        // print("DoctorListId2222bodyrr: {body}");

        NurseCheckoutModel? nursecheckout = nurseCheckoutModelFromJson(r.body);
        return nursecheckout;
      }
    } catch (error) {
      print("doctorUrlcheckouterore33221:${error}");

      return;
    }
  }

  ///todo nurse list detail...2 april 2023....after api it will change in future it will based on location id...18 april 2023...................
  static DoctoercheckoutApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var DoctorListId = preferences.getString("DoctorListId");
    print("DoctorListId2222: ${DoctorListId}");
    var prefs = GetStorage();

    ///todo:doctorbookingid.........6...june 2023....
    // prefs.write("doctorbooking_Id".toString(), json.decode(r.body)['Id']);
    doctorbooking_Id = prefs.read("doctorbooking_Id").toString();
    print('&&&&&&&&&&&&&&doctor:${doctorbooking_Id}');
    var url =
        //http://test.pswellness.in/api/DoctorApi/DoctorApt?Doctor_Id=145&PA_Id=1232
        "http://test.pswellness.in/api/DoctorApi/DoctorApt?Doctor_Id=$DoctorListId&PA_Id=$doctorbooking_Id";
    //baseUrl + 'api/NurseAppointmentAPI/NurseAppointmentList?NurseId=56';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("doctorUrlcheckout333: ${url}");
        print("DoctorListId2222bodyrr: ${r.body}");
        DoctorCheckoutModel? doctorcheckout =
            doctorCheckoutModelFromJson(r.body);
        return doctorcheckout;
      }
    } catch (error) {
      print("doctorUrlcheckouterore4444:${error}");
      return;
    }
  }

  ///todo lab checkout...28april 2023....after api it will change in future it will based on location id...18 april 2023...................
  static LabcheckoutApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var LablistssId = preferences.getString("LablistssId");
    print("LablistssId: ${LablistssId}");

    var prefs = await GetStorage();
    BookingId = prefs.read("BookingId").toString();
    print('&&&&&&&&&&&&&&lllbbb:${BookingId}');

    var url =
        "http://test.pswellness.in/api/LabApi/LabAptmt?Lab_Id=$LablistssId&Bookid=$BookingId";

    // "http://test.pswellness.in/api/LabApi/LabAptmt?Lab_Id=16&Bookid=333";
    //"http://test.pswellness.in/api/LabApi/LabAptmt?Lab_Id=$LablistssId&Bookid=333";
    //'${baseUrl}api/LabApi/LabAptmt?Lab_Id=$LablistssId';
    //"http://test.pswellness.in/api/LabApi/LabAptmt?Lab_Id=16";
    print("okokklaburlll:${url}");
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("&&&&checkout:${r.body}");
        print("&&&&checkouturl:${url}");
        Labcheckoutmodel? labcheckout = labcheckoutmodelFromJson(r.body);
        return labcheckout;
      }
    } catch (error) {
      print("rahulbaba${error}");
      return;
    }
  }

  ///todo health checkout...1_may 2023....after api it will change in future it will based on location id...18 april 2023...................
  static HealthchkupcheckoutApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var HealthchkpListId = preferences.getString("HealthchkpListId");
    print("HealthchkpListId: ${HealthchkpListId}");
    var url =
        '${baseUrl}api/HealthCheckUpApi/HealthAptmt?Test_Id=$HealthchkpListId';

    //'${baseUrl}api/HealthCheckUpApi/HealthAptmt?Test_Id=1';
    // "http://test.pswellness.in/api/LabApi/LabAptmt?Lab_Id=16";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("&&&&thhealcheckout:${r.body}");
        print("&&&&healthcheckouturl:${url}");
        HealthCheckupcheckout? healthCheckupcheckout =
            healthCheckupcheckoutFromJson(r.body);
        return healthCheckupcheckout;
      }
    } catch (error) {
      print("princechkout${error}");
      return;
    }
  }

  ///todo nurse list detail...18april 2023....after api it will change in future it will based on location id...18 april 2023...................
  static NursListApi() async {
    var url = "http://test.pswellness.in/api/NurseAPI/getNurseList?cityid=67";
    //baseUrl + 'api/NurseAppointmentAPI/NurseAppointmentList?NurseId=56';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        NurseListbycityId? nurseListbycityId =
            nurseListbycityIdFromJson(r.body);
        return nurseListbycityId;
      }
    } catch (error) {
      return;
    }
  }

  ///todo nurse list detail...8 may 2023....after api it will change in future it will based on location id...18 april 2023...................
  static NursListUserrApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var nurseLocationId = preferences.getString("nurseLocationId");
    print("nurseLocationId: ${nurseLocationId}");
    var url =
        "http://test.pswellness.in/api/NurseAPI/getNurseList?Loc_id=$nurseLocationId";

    //baseUrl + 'api/NurseAppointmentAPI/NurseAppointmentList?NurseId=56';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("nurseLocationIdUrl: ${url}");
        NurseListbylocationId? nurseListbylocationId =
            nurseListbylocationIdFromJson(r.body);
        return nurseListbylocationId;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: user list detail...13 july 2023......................acptrejt...
  static UserListUserrApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var nurseLocationId = preferences.getString("nurseLocationId");
    print("nurseLocationId: ${nurseLocationId}");
    var url =
        "http://test.pswellness.in/api/DriverApi/UserListForBookingAmbulance";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("userlistIdUrl77: ${url}");
        print("userlistIdUrl774343: ${r.body}");
        UserListModeldriver? userListModeldriver =
            userListModeldriverFromJson(r.body);
        return userListModeldriver;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: nurse......details........18 april....

  // static NursDetailApi() async {
  //   var url = "http://test.pswellness.in/api/NurseAPI/NurseDetails?id=56";
  //   //baseUrl + 'api/NurseAppointmentAPI/NurseAppointmentList?NurseId=56';
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       // NursedetailbyId? nursedetailbyId =
  //       // nursedetailbyIdFromJson(r.body);
  //       var nursedetailbyId = nursedetailbyIdFromJson(r.body);
  //       print('############nurse123: ${nursedetailbyId.nurseName}');
  //       return nursedetailbyId;
  //     }
  //   } catch (error) {
  //     print("okokokocnurseeee:${error}");
  //     return;
  //   }
  // }

  ///login user api ps welness api 2..................................
  static LoginEmailApi(
    var Username,
    var Password,
  ) async {
    var url = baseUrl + 'api/SignupApi/Login';

    var body = {
      "Username": Username,
      "Password": Password,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      var prefs = GetStorage();
      //saved id..........
      prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
      Id = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&user:${Id}');

      //saved id..........
      prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
      userid = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&userid:${Id}');

      //saved user credentials..........
      prefs.write("PatientRegNo".toString(),
          json.decode(r.body)['data']['PatientRegNo']);
      PatientRegNo = prefs.read("PatientRegNo").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&usecredentials:${PatientRegNo}');
//user password........
      prefs.write(
          "Password".toString(), json.decode(r.body)['data']['Password']);
      userPassword = prefs.read("Password").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&usecredentialspassword:${userPassword}');
//
      //device driverpassword

      prefs.write(
          "Password".toString(), json.decode(r.body)['data']['Password']);
      driverpassword = prefs.read("Password").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&usecredentialspassword:${driverpassword}');
      //device driverId........
      prefs.write(
          "DriverId".toString(), json.decode(r.body)['data']['DriverId']);
      DriverId = prefs.read("DriverId").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&usecredentialspassword:${DriverId}');

      //device driverId........
      prefs.write(
          "DriverId".toString(), json.decode(r.body)['data']['DriverId']);
      DriverId = prefs.read("DriverId").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&usecredentialspassword:${DriverId}');
//adminId
      //StatemasterId = ''.toString();
      //   static String CitymasterId
      ///todo: save state id........
      prefs.write("StateMaster_Id".toString(),
          json.decode(r.body)['data']['StateMaster_Id']);
      StatemasterId = prefs.read("StateMaster_Id").toString();
      print('&&&&statemasterId:${StatemasterId}');

      ///todo: save city id........
      prefs.write("CityMaster_Id".toString(),
          json.decode(r.body)['data']['CityMaster_Id']);
      CitymasterId = prefs.read("CityMaster_Id").toString();
      print('&&citymasterId:${CitymasterId}');

      ///var prefs = GetStorage();
      //savid..........
      prefs.write("AdminLogin_Id".toString(),
          json.decode(r.body)['data']['AdminLogin_Id']);
      adminId = prefs.read("AdminLogin_Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&:${adminId}');
      //saved token.........
      // prefs.write("token".toString(), json.decode(r.body)['token']);
      // token = prefs.read("token").toString();
      // print(token);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo: device token for user........

  static UserdevicetokenApi() async {
    var url = '${baseUrl}api/DriverApi/UpadateDiviceId';

    var prefs = GetStorage();
    PatientRegNo = prefs.read("PatientRegNo").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usecredentials:${PatientRegNo}');
//user password........
    userPassword = prefs.read("Password").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usecredentialspassword:${userPassword}');

    var body = {
      "UserId": "$PatientRegNo",
      "DeviceId": "fefewfefewf21331",
    };
    print("userrrtokenupdateeeddbefore${body}");

    //print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      print("userrrtokenupdateeedd${body}");
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo: device user token for driver.....

  static DriverdevicetokenApi() async {
    var url = '${baseUrl}api/DriverApi/UpadateDiviceId';

    var prefs = GetStorage();
    DriverId = prefs.read("DriverId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usecredentials:${DriverId}');
//user password........
    driverpassword = prefs.read("driverpassword").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&drivecredentialspassword:${driverpassword}');

    var body = {
      "UserId": "$DriverId".toString(),
      "DeviceId": "fefewfefewf21331werwqrwqr".toString(),
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///Change password in user 26 april 2023.....

  static ChangePasswordApi(var id, var Password, var ConfirmPassword) async {
    var url = baseUrl + 'api/SignupApi/ChangePassword';
    var prefs = GetStorage();
    //saved id..........
    //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&:${adminId}');

    var body = {
      "ID": adminId.toString(),
      // Id.toString(),
      //2.toString(),
      "Password": Password,
      "ConfirmPassword": ConfirmPassword,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      var prefs = GetStorage();
      //saved id..........
      //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
      Id = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///googleapipost
  ///todo: google post ambulance api on .......2 may 2023.......,,,,,,.....................

  static GooglebookambulanceApi(
    var start_Lat,
    var start_Long,
    var end_Lat,
    var end_Long,
    var Patient_Id,
    var AmbulanceType_id,
    var VehicleType_id,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var AmbulancelistssId = preferences.getString("AmbulancelistssId");
    print("AmbulancelistssId: ${AmbulancelistssId}");
    var url = baseUrl + 'api/DriverApi/AddAmbulance';
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usergoogle:${userid}');

    var body = {
      "start_Lat": start_Lat.toString(),
      "start_Long": start_Long.toString(),
      "end_Long": end_Long.toString(),
      "end_Lat": end_Lat.toString(),
      "Patient_Id": userid,
      "AmbulanceType_id": "${1}",
      //"$AmbulanceType_id",
      //AmbulanceType_id,
      "VehicleType_id": VehicleType_id
    };
    //
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    //print(r.body);
    if (r.statusCode == 200) {
      ///ambulance..
      //saved id..........
      var prefs = GetStorage();
      prefs.write("ambulancetypeid".toString(),
          json.decode(r.body)['AmbulanceType_id']);
      ambulancetypeid = prefs.read("AmbulanceType_id").toString();
      print('&userdriambulance:${AmbulanceType_id}');

      ///lat
      prefs.write("lat".toString(), json.decode(r.body)['start_Lat']);
      lat = prefs.read("start_Lat").toString();
      print('&userdriverlat:${start_Lat}');

      ///lng
      prefs.write("lng".toString(), json.decode(r.body)['start_Long']);
      lng = prefs.read("start_Long").toString();
      print('&user33lng33:${start_Long}');

      ///lat2
      prefs.write("lat2".toString(), json.decode(r.body)['end_Lat']);
      lat2 = prefs.read("end_Lat").toString();
      print('&userdriverlat21:${end_Lat}');

      ///lng2
      prefs.write("lng2".toString(), json.decode(r.body)['end_Long']);
      lng2 = prefs.read("end_Long").toString();
      print('&user33lng:${end_Long}');

      ///vehicle
      prefs.write(
          "vehicletypeid".toString(), json.decode(r.body)['VehicleType_id']);
      vehicletypeid = prefs.read("VehicleType_id").toString();
      print('&user33vehicleid:${VehicleType_id}');

      ///driverid
      ///userdriverid
      // prefs.write("userdriverid".toString(),
      //     json.decode(r.body)['Message'][1]);
      // userdriverid = prefs.read("DriverId");
      // print('&user33vehicleid667eee:${VehicleType_id}');

      print(r.body);
      print(r.statusCode);
      Get.snackbar("Booking Status", 'Request Send Successfully');
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errorgoogle', r.body);
      return r;
    }
  }

  ///todo: google post ambulance api on 2 .......14 july 2023.......,,,,,,.....................

  static GooglebookambulanceApi2(
    var start_Lat,
    var start_Long,
    var end_Lat,
    var end_Long,
    var Patient_Id,
    var AmbulanceType_id,
    var VehicleType_id,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var AmbulancelistssId = preferences.getString("AmbulancelistssId");
    print("AmbulancelistssId: ${AmbulancelistssId}");
    var url = baseUrl + 'api/DriverApi/AddAmbulance';
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usergoogle:${userid}');

    var body = {
      "start_Lat": start_Lat.toString(),
      "start_Long": start_Long.toString(),
      "end_Long": end_Long.toString(),
      "end_Lat": end_Lat.toString(),
      "Patient_Id": userid,
      "AmbulanceType_id": "${2}",
      //"$AmbulanceType_id",
      //AmbulanceType_id,
      "VehicleType_id": VehicleType_id
    };
    //
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    //print(r.body);
    if (r.statusCode == 200) {
      ///ambulance..
      //saved id..........
      var prefs = GetStorage();
      prefs.write("ambulancetypeid".toString(),
          json.decode(r.body)['AmbulanceType_id']);
      ambulancetypeid = prefs.read("AmbulanceType_id").toString();
      print('&userdriambulance:${AmbulanceType_id}');

      ///lat
      prefs.write("lat".toString(), json.decode(r.body)['start_Lat']);
      lat = prefs.read("start_Lat").toString();
      print('&userdriverlat:${start_Lat}');

      ///lng
      prefs.write("lng".toString(), json.decode(r.body)['start_Long']);
      lng = prefs.read("start_Long").toString();
      print('&user33lng33:${start_Long}');

      ///lat2
      prefs.write("lat2".toString(), json.decode(r.body)['end_Lat']);
      lat2 = prefs.read("end_Lat").toString();
      print('&userdriverlat21:${end_Lat}');

      ///lng2
      prefs.write("lng2".toString(), json.decode(r.body)['end_Long']);
      lng2 = prefs.read("end_Long").toString();
      print('&user33lng:${end_Long}');

      ///vehicle
      prefs.write(
          "vehicletypeid".toString(), json.decode(r.body)['VehicleType_id']);
      vehicletypeid = prefs.read("VehicleType_id").toString();
      print('&user33vehicleid:${VehicleType_id}');

      ///driverid
      ///userdriverid
      // prefs.write("userdriverid".toString(),
      //     json.decode(r.body)['Message'][1]);
      // userdriverid = prefs.read("DriverId");
      // print('&user33vehicleid667eee:${VehicleType_id}');

      print(r.body);
      print(r.statusCode);
      Get.snackbar("Booking Status", 'Request Send Successfully');
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errorgoogle', r.body);
      return r;
    }
  }

  ///todo: google post ambulance api on 3.......14 july 2023.......,,,,,,.....................

  static GooglebookambulanceApi3(
    var start_Lat,
    var start_Long,
    var end_Lat,
    var end_Long,
    var Patient_Id,
    var AmbulanceType_id,
    var VehicleType_id,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var AmbulancelistssId = preferences.getString("AmbulancelistssId");
    print("AmbulancelistssId: ${AmbulancelistssId}");
    var url = baseUrl + 'api/DriverApi/AddAmbulance';
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usergoogle:${userid}');

    var body = {
      "start_Lat": start_Lat.toString(),
      "start_Long": start_Long.toString(),
      "end_Long": end_Long.toString(),
      "end_Lat": end_Lat.toString(),
      "Patient_Id": userid,
      "AmbulanceType_id": "${3}",
      //"$AmbulanceType_id",
      //AmbulanceType_id,
      "VehicleType_id": VehicleType_id
    };
    //
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    //print(r.body);
    if (r.statusCode == 200) {
      ///ambulance..
      //saved id..........
      var prefs = GetStorage();
      prefs.write("ambulancetypeid".toString(),
          json.decode(r.body)['AmbulanceType_id']);
      ambulancetypeid = prefs.read("AmbulanceType_id").toString();
      print('&userdriambulance:${AmbulanceType_id}');

      ///lat
      prefs.write("lat".toString(), json.decode(r.body)['start_Lat']);
      lat = prefs.read("start_Lat").toString();
      print('&userdriverlat:${start_Lat}');

      ///lng
      prefs.write("lng".toString(), json.decode(r.body)['start_Long']);
      lng = prefs.read("start_Long").toString();
      print('&user33lng33:${start_Long}');

      ///lat2
      prefs.write("lat2".toString(), json.decode(r.body)['end_Lat']);
      lat2 = prefs.read("end_Lat").toString();
      print('&userdriverlat21:${end_Lat}');

      ///lng2
      prefs.write("lng2".toString(), json.decode(r.body)['end_Long']);
      lng2 = prefs.read("end_Long").toString();
      print('&user33lng:${end_Long}');

      ///vehicle
      prefs.write(
          "vehicletypeid".toString(), json.decode(r.body)['VehicleType_id']);
      vehicletypeid = prefs.read("VehicleType_id").toString();
      print('&user33vehicleid:${VehicleType_id}');

      ///driverid
      ///userdriverid
      // prefs.write("userdriverid".toString(),
      //     json.decode(r.body)['Message'][1]);
      // userdriverid = prefs.read("DriverId");
      // print('&user33vehicleid667eee:${VehicleType_id}');

      print(r.body);
      print(r.statusCode);
      Get.snackbar("Booking Status", 'Request Send Successfully');
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errorgoogle', r.body);
      return r;
    }
  }

  ///todo: book ambulance 2 booking api........
  static Googlebookambulance2Api(
      // var start_Lat,
      // var start_Long,
      // var end_Long,
      // var end_Lat,
      // var Patient_Id,
      // var Driver_Id,
      // var AmbulanceType_id,
      // var VehicleType_id,
      ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var driverlistssId = preferences.getString("driverlistssId");
    print("driverlistssId88899: ${driverlistssId}");
    //lat1
    var lng1 = preferences.getString("lng1");
    print("driverlistssId88899: ${lng1}");
    //lat1
    var lat1 = preferences.getString("lat1");
    print("lat133: ${lat1}");
    //lat1
    var lng2 = preferences.getString("lng2");
    print("lng244: ${lng2}");
    //lat1
    var lat2 = preferences.getString("lat2");
    print("lat2221: ${lat2}");
    //lat1
    var ambulance1 = preferences.getString("ambulance1");
    print("ambulance1211: ${ambulance1}");
    //lat1
    var vehicle1 = preferences.getString("vehicle1");
    print("vehicle122: ${vehicle1}");

    var url = '${baseUrl}api/DriverApi/BookDriver';

    var body = {
      "start_Lat": "$lat1",
      "start_Long": "$lng1",
      "end_Long": "$lng2",
      "end_Lat": "$lat2",
      "Patient_Id": userid,
      "Driver_Id": "$driverlistssId",
      "AmbulanceType_id": "$ambulance1",
      //AmbulanceType_id,
      "VehicleType_id": "$vehicle1",
    };
    //
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    //print(r.body);
    if (r.statusCode == 200) {
      print(r.body);
      print(r.statusCode);
      Get.snackbar("Booking Status", 'Request Send Successfully');
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errorgoogle', r.body);
      return r;
    }
  }

  ///practice.......

  // static DrivernearListApi() async {
  //   var start_Lat;
  //   var start_Long;
  //   var end_Lat;
  //   var end_Long;
  //   //var Patient_Id;
  //   var AmbulanceType_id;
  //   var VehicleType_id;
  //   var prefs = GetStorage();
  //   //read id..........
  //   Id = prefs.read("Id").toString();
  //   print('&&&&&&&&&&&&&&&&&&prince55:${Id}');
  //
  //   //read token.........
  //
  //   token = prefs.read("token").toString();
  //
  //   var body = {
  //     "start_Lat": start_Lat.toString(),
  //     "start_Long": start_Long.toString(),
  //     "end_Long": end_Long.toString(),
  //     "end_Lat": end_Lat.toString(),
  //     "Patient_Id": userid,
  //     "AmbulanceType_id": "$AmbulanceType_id",
  //     //AmbulanceType_id,
  //     "VehicleType_id": VehicleType_id
  //   };
  //
  //   final request = http.StreamedRequest(
  //       'POST', Uri.parse("${baseUrl}api/DriverApi/AddAmbulance"));
  //
  //   request.headers["Authorization"] = "Bearer $token";
  //   request.headers["Content-type"] = "application/json";
  //   request.sink
  //     ..add(utf8.encode(json.encode(body)))
  //     ..close();
  //   final streamedResponse = await request.send();
  //   final response = await http.Response.fromStream(streamedResponse);
  //   print(response.statusCode);
  //   print("princebody:${response.body}");
  //   print("&&&&&&&&&&&&&&&&&&prince: ${token}");
  //
  //   if (response.statusCode == 200) {
  //     DriverListApi noOfCartModel = driverListApiFromJson(response.body);
  //     return noOfCartModel;
  //   }
  // }

  ///todo: get ambulance driver list api......23...jun...2023.......

  static DrivernearListApi() async {
    var url = '${baseUrl}api/DriverApi/AddAmbulance';
    try {
      http.Response r = await http.post(Uri.parse(url));
      print("burldriver: ${url}");
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("burldriver: ${url}");
        DriverListApi neardriverlist = driverListApiFromJson(r.body);
        print('############nurse123: ${neardriverlist.message?[0].name}');
        return neardriverlist;
      }
    } catch (error) {
      print("okodriver:${error}");
      return;
    }
  }

  ///
  ///
  ///todo: google update driver location api on .......21 may 2023.......,,,,,,.....................

  static GoogleupdatedriverApi(
    var Lat,
    var Lang,
  ) async {
    var url = baseUrl + 'api/DriverApi/UpdateDriverLocation';
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usergoogledriver:${userid}');

    var body = {
      "Lat": Lat.toString(),
      "Lang": Lang.toString(),
      "DriverId": userid,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    //print(r.body);
    if (r.statusCode == 200) {
      print(r.body);
      print(r.statusCode);
      Get.snackbar("title", '${r.body}');
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errorgoogle', r.body);
      return r;
    }
  }

  ///todo:this is the usercomplain api...26 april 2023...............
  static UserComplainnewApi(
    var patsubid,
    var Others,
    var Complaints,
    var LoginId,
  ) async {
    var url = baseUrl + 'api/ComplaintApi/PatientComplaints';
    var prefs = GetStorage();
    //saved id..........
    //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercomplain:${adminId}');

    var body = {
      "patsubid": patsubid,
      "Others": Others,
      "Complaints": Complaints,
      "Login_Id": adminId,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo:this is the Labcomplain api...11 may 2023...............

  static LabComplainpi(
    var Complaints,
    var Login_Id,
    var Subjects,
    var Others,
  ) async {
    var url = baseUrl + 'api/ComplaintApi/LabComplaint';
    var prefs = GetStorage();
    //saved id..........
    //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercomplain:${adminId}');

    var body = {
      "Complaints": Complaints,
      "Login_Id": adminId,
      "Subjects": Subjects,
      "Others": Others,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo:this is the Labcomplain api...11 may 2023...............
  static RwaComplainpi(
    var Subjects,
    var Complaints,
    var Others,
  ) async {
    var url = baseUrl + 'api/PatientApi/Add_RWAComplaint';
    var prefs = GetStorage();
    //saved id..........
    //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
    adminId = prefs.read("AdminLogin_Id").toString();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usergoogle:${userid}');
    print('&&&&&&&&&&&&&&&&&&&&&&usercomplain:${adminId}');

    var body = {
      "RWA_Id": userid,
      "Subjects": Subjects,
      "Complaints": Complaints,
      "Others": Others,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///user profile update.........26 april 2023...

  ///here profile api of user.............24 april 2023...

  static Userprofileupdate(
    // var Id,
    var patientName,
    var MobileNumber,
    var StateMasterId,
    var CityMasterId,
    var Location,
    var PinCode,
    //var adminLoginId,
    // var AccountNo,
    //var IFSCCode,
    //var BranchName,
  ) async {
    //var a= int.parse(State).toString();
    //var b= int.parse(City).toString();
    var url = baseUrl + 'api/PatientApi/UpdateProfilebyPatient';
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&admin:${adminId}');

    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&user:${userid}');

    var body = {
      "Id":
          //137,
          userid,
      "patientName": patientName,
      //"EmailId": EmailId,
      "MobileNumber": MobileNumber,
      "StateMaster_Id": StateMasterId,
      "CityMaster_Id": CityMasterId,
      "StateMaster_Id": StateMasterId,
      "CityMaster_Id": CityMasterId,
      "Location": Location,
      "PinCode": PinCode,
      "adminLogin_id":
          //1222,
          adminId,
      //"AccountNo": AccountNo,
      //"IFSCCode": IFSCCode,
      //"Location": Location,
      //"BranchName": BranchName,
    };

    // print(body);

    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId

      print("gvhjbknlokokookupdate${body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///lab_update_profile_details...11...may...2023...prince

  static Labprofileupdate(
    var Id,
    var MobileNumber,
    var LabName,
    var StateMaster_Id,
    var CityMaster_Id,
    var Location,
    var PinCode,
    var adminLogin_id,
    var AccountNo,
    var IFSCCode,
    var BranchName,
  ) async {
    //var a= int.parse(State).toString();
    //var b= int.parse(City).toString();
    var url = baseUrl + 'api/PatientApi/UpdateProfilebyPatient';
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&admin:${adminId}');

    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userlabbbb:${userid}');

    var body = {
      "Id":
          //137,
          userid,
      "MobileNumber": MobileNumber,
      "LabName": LabName,
      "StateMaster_Id": StateMaster_Id,
      "CityMaster_Id": CityMaster_Id,
      "Location": Location,
      "PinCode": PinCode,
      "adminLogin_id":
          //1222,
          adminId,
      "AccountNo": AccountNo,
      "IFSCCode": IFSCCode,
      "Location": Location,
      "BranchName": BranchName,
    };

    // print(body);

    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId

      print("gvhjbknlokokookupdatedddd${body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///lab_paynow.ONLINE.lab....api..of...user........29 april 2023...........

  static LabpaynowOnlineApi() async {
    var url = baseUrl + 'api/LabApi/LabPayNow';
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&user:${userid}');

    labbooking_Id = prefs.read("labbooking_Id").toString();
    print('&&&&&&&&&&&&&&lab:${labbooking_Id}');
    Id = prefs.read("Id").toString();

    SharedPreferences preferences = await SharedPreferences.getInstance();
    var LablistssId = preferences.getString("LablistssId");
    print("LablistssId: ${LablistssId}");
    //doctor fees...
    var Labfeess = preferences.getString("Labfeess");
    print("Fee545454: ${Labfeess}");

    //Labfeess

    var body = {
      "Id": "$labbooking_Id",
      "Lab_Id": "$LablistssId",
      "Patient_Id": userid,
      "Amount": "$Labfeess",
      "IsPaid": "true",
    };
    // print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId
      print("gvhjbknlolabonline:${body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error1088', r.body);
      return r;
    }
  }

  ///medicine_paynow.ONLINE.....api..of...user.......29_may....2023...........

  static MedicinepaynowOnlineApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var MedicineaddresslistssId =
        preferences.getString("MedicineaddresslistssId");
    print("MedicineaddresslistssId: ${MedicineaddresslistssId}");
    var url = '$baseUrl/api/PatientMedicine/MedicinePayNow';
    var prefs = GetStorage();
    // adminId = prefs.read("AdminLogin_Id").toString();
    // print('&&&&&&&&&&&&&&&&&&&&&&admin:${adminId}');
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&user:${userid}');

    //doctor fees...
//     var DoctorFee = preferences.getString("DoctorFee");
//     print("Fee545454: ${DoctorFee}");
    var body = {
      //"Lab_Id": "$LablistssId",
      //Lab_Id,
      "Patient_Id": userid,
      "IsPaid": "true",
      "shippingId": "$MedicineaddresslistssId"
    };
    // print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId
      print("gvhjbknlolabonline:${r.body}");
      print("gvhjbknlolabonline44:${body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error1088', r.body);
      return r;
    }
  }

  ///nurse_paynow.ONLINE.....api..of...user........29 april 2023...........
  static NursepaynowOnlineApi() async {
    var url = baseUrl + 'api/NurseServices/NursePayNow';
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var NurseuserListId = preferences.getString("NurseuserListId");
    print("nurseuserlistIdrriview: ${NurseuserListId}");
    //Nurseuserfees
    var Nurseuserfees = preferences.getString("Nurseuserfees");
    print("Fee545454feeaass: ${Nurseuserfees}");

    ///.....
    //SharedPreferences preferences = await SharedPreferences.getInstance();
    var NurseFee = preferences.getString("NurseFee");
    print("Fee545454: ${NurseFee}");

    ///
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labusdoctorr:${userid}');
    nursebooking_Id = prefs.read("nursebooking_Id").toString();

    var body = {
      "Id": nursebooking_Id,
      "Nurse_Id": "$NurseuserListId",
      "Patient_Id": userid,
      "TotalFee": "$Nurseuserfees",
      "IsPaid": "true",
    };
    // print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
      print("okokolllllnursee:${body}");
//adminId
      print("gvhjbknnurseonline:${r.body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errornurse', r.body);
      return r;
    }
  }

  ///doctor_paynow.ONLINE.....api..of...user........2 may 2023...........
  static DoctorpaynowOnlineApi() async {
    var url = baseUrl + 'api/DoctorApi/DoctorPayNow';
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var DoctorListId = preferences.getString("DoctorListId");
    print("DoctorListId: ${DoctorListId}");

//doctor fees...from...lab
    var DoctorFee = preferences.getString("DoctorFee");
    print("Fee545454eeedrr: ${DoctorFee}");

    ///todo: DoctorListFees.....26/7/23.................
    ///
    var DoctorListFees = preferences.getString("DoctorListFees");
    print("Fee545454eeedrrttt333: ${DoctorListFees}");

    ///
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labusereportdr:${userid}');
    doctorbooking_Id = prefs.read("doctorbooking_Id").toString();
    print('&&&&&&&&&&&&&&doctor:${doctorbooking_Id}');
    var body = {
      "Id": "$doctorbooking_Id",
      "Doctor_Id": "$DoctorListId",
      //Lab_Id,
      "Patient_Id": userid,
      "TotalFee": "$DoctorFee",
      "IsPaid": "true"
    };
    // print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId
      print("gvhjbkdoctoronline:${r.body}");
      print("gvhjbkdoctoronlinerrr:${body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errordoctor', r.body);
      return r;
    }
  }

  ///healthchkp_paynow.ONLINE.....api..of...user........2 may 2023...........
  static HealthchkppaynowOnlineApi() async {
    var url = baseUrl + 'api/HealthCheckUpApi/HealthPayNow';
    var prefs = GetStorage();
    // adminId = prefs.read("AdminLogin_Id").toString();
    // print('&&&&&&&&&&&&&&&&&&&&&&admin:${adminId}');
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userhealthchkp:${userid}');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var HealthchkpListId = preferences.getString("HealthchkpListId");
    print("HealthchkpListId: ${HealthchkpListId}");
    var body = {
      "Test_Id": "$HealthchkpListId",
      //Lab_Id,
      "Patient_Id": userid,
      "IsPaid": "true",
    };
    // print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId
      print("gvhjbkdoctoronline:${r.body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errordoctor', r.body);
      return r;
    }
  }

  ///lab_paynow.OFFLINE.....api..of...user........29 april 2023...........

  static LabpaynowOfflineApi() async {
    var url = baseUrl + 'api/LabApi/LabPayNow';
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&admin:${adminId}');

    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&user:${userid}');
    var body = {
      "Lab_Id": "16",
      "Patient_Id": "83",
      "IsPaid": "false",
    };
    // print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId
      print("gvhjbknlolabonline:${body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///nurse_paynow.OFFLINE.....api..of...user........1 may 2023...........

  static NursepaynowOfflineApi() async {
    var url = baseUrl + 'api/NurseServices/NursePayNow';
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&admin:${adminId}');

    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&user:${userid}');
    var body = {
      "Id": "192",
      "Nurse_Id": "83",
      "IsPaid": "false",
    };
    // print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId
      print("gvhjbknlolabonline:${body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///doctor_paynow.OFFLINE.....api..of...user........1 may 2023...........

  static DoctorpaynowOfflineApi() async {
    var url = baseUrl + 'api/DoctorApi/DoctorPayNow';
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&admin:${adminId}');

    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&user:${userid}');
    var body = {
      "Doctor_Id": "145",
      "Patient_Id": "73",
      "IsPaid": "false",
    };
    // print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId
      print("gvhjbkdoctoroffline:${body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errordoctor', r.body);
      return r;
    }
  }

  ///doctor_paynow.OFFLINE.....api..of...user........1 may 2023...........

  static HealthchkppaynowOfflineApi() async {
    var url = baseUrl + 'api/HealthCheckUpApi/HealthPayNow';
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&admin:${adminId}');

    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&user:${userid}');
    var body = {
      "Test_Id": "1",
      "Patient_Id": "83",
      "IsPaid": "false",
    };
    // print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId
      print("gvhjbkdoctoroffline:${body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errordoctor', r.body);
      return r;
    }
  }

  //doctor profile  api 2..........................
  static UserProfileApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userprofiledetail:${userid}');
    print(userid);
    var url =
        //"http://test.pswellness.in/api/PatientApi/PatientProfiledetail?PatientId=137";
        "http://test.pswellness.in/api/PatientApi/PatientProfiledetail?PatientId=$userid";
    //http://test.pswellness.in/api/PatientApi/PatientProfiledetail?PatientId=137
    //var url = baseUrl + 'api/PatientApi/PatientProfiledetail?PatientId=$userid';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        Userprofilepersonal? userProfile = userprofilepersonalFromJson(r.body);
        return userProfile;
      }
    } catch (error) {
      return;
    }
  }

  //user signup..............

  //login user api ps welness api 1..................................

  static NurseselectionformApi(
    var ServiceType,
    var ServiceTime,
    var NurseTypeId,
    var PatientId,
    var Mobile,
    var ServiceDate,
    var StartDate,
    var EndDate,
    var LocationId,
  ) async {
    var url = baseUrl + 'api/ApiTest/BookAppointment';

    var body = {
      "ServiceType": ServiceType,
      "ServiceTime": ServiceTime,
      "NurseType_Id": NurseTypeId,
      "PatientId": PatientId,
      "Mobile": Mobile,
      "ServiceDate": ServiceDate,
      "StartDate": StartDate,
      "EndDate": EndDate,
      "LocationId": LocationId,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      var prefs = GetStorage();
      //saved id..........
      prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
      Id = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

      ///
      // //saved token.........
      // prefs.write("token".toString(), json.decode(r.body)['token']);
      // token = prefs.read("token").toString();
      // print(token);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo: nurse booking 1 api........27 april 2023...

  static Nursesebooking1Api(
    //var PatientId,
    var NurseTypeId,
    var ServiceType,
    var ServiceTime,
    var StartDate,
    var EndDate,
    var MobileNumber,
    var LocationId,
  ) async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labusdoctorr:${userid}');
    //nursebooking_Id = prefs.read("nursebooking_Id").toString();

    var url = baseUrl + 'api/NurseServices/NurseServices';

    var body = {
      "Patient_Id": "$userid",
      "NurseTypeId": NurseTypeId,
      "ServiceType": ServiceType,
      "NurseType_Id": NurseTypeId,
      "ServiceTime": ServiceTime,
      "StartDate": StartDate,
      "EndDate": EndDate,
      "MobileNumber": MobileNumber,
      "LocationId": LocationId,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    //print(r.body);
    if (r.statusCode == 200) {
      ///todo:nursebookingid.........5  june 2023....
      var prefs = GetStorage();
      prefs.write(
          "nursebooking_Id".toString(), json.decode(r.body)['NurseBookingId']);
      nursebooking_Id = prefs.read("nursebooking_Id").toString();
      print('&&&&&&&&&&&&&&&&&nurse:${nursebooking_Id}');

      Id = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&nursebookingId:${Id}');
      print("nursebooking8:${body}");
      print("nursebooking1:${r.body}");

      ///

      // //saved token.........
      // prefs.write("token".toString(), json.decode(r.body)['token']);
      // token = prefs.read("token").toString();
      // print(token);

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo: nurse booking 2 api........27 april 2023...

  // static Nursesebooking2Api(
  //   var NurseId,
  //   var ServiceDate,
  //   var Slotid,
  // ) async {
  //   var url = baseUrl + 'api/NurseServices/NurseBookings';
  //
  //   var body = {
  //     "Nurse_Id": "55",
  //     "ServiceDate": ServiceDate,
  //     "Slotid": Slotid,
  //   };
  //   print(body);
  //   http.Response r = await http.post(
  //     Uri.parse(url), body: body,
  //     //headers: headers
  //   );
  //   print(r.body);
  //   if (r.statusCode == 200) {
  //     var prefs = GetStorage();
  //     //saved id..........
  //     //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
  //     Id = prefs.read("Id").toString();
  //     // print('&&&&&&&&&&&&&&nursebookingId:${Id}');
  //     ///
  //     // //saved token.........
  //     // prefs.write("token".toString(), json.decode(r.body)['token']);
  //     // token = prefs.read("token").toString();
  //     // print(token);
  //     return r;
  //   } else if (r.statusCode == 401) {
  //     Get.snackbar('message', r.body);
  //   } else {
  //     Get.snackbar('Error', r.body);
  //     return r;
  //   }
  // }

  ///
  ///todo: nurse booking 2 api........27 april 2023...
//
  static Nursesebooking2Api(
    var NurseId,
    var ServiceDate,
    var Slotid,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var NurseuserListId = preferences.getString("NurseuserListId");
    print("nurseuserlistId: ${NurseuserListId}");

    var prefs = GetStorage();
    //prefs.write(
    //"nursebooking_Id".toString(), json.decode(r.body)['NurseBookingId']);
    nursebooking_Id = prefs.read("nursebooking_Id").toString();
    // print('&&&&&&&&&&&&&&&&&nurse:${nursebooking_Id}’);
    var url = baseUrl + 'api/NurseServices/NurseBookings';

    var body = {
      "Id": "${nursebooking_Id}",
      "Nurse_Id": "${NurseuserListId}",
      "ServiceDate": ServiceDate,
      "Slotid": Slotid,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      print("nurseeeaa:${body}");
      // var prefs = GetStorage();
      //saved id..........
      //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
      // Id = prefs.read("Id").toString();
      // print('&&&&&&&&&&&&&&nursebookingId:${Id}');
      ///
      // //saved token.........
      // prefs.write("token".toString(), json.decode(r.body)['token']);
      // token = prefs.read("token").toString();
      // print(token);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo nurse list detail...18april 2023....after api it will change in future it will based on location id...18 april 2023...................
  // static NursListApi() async {
  //   var url = "http://test.pswellness.in/api/NurseAPI/getNurseList?cityid=67";
  //   //baseUrl + 'api/NurseAppointmentAPI/NurseAppointmentList?NurseId=56';
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       NurseListbycityId? nurseListbycityId =
  //       nurseListbycityIdFromJson(r.body);
  //       return nurseListbycityId;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }

  ///todo: nurse......details........18 april....

  static NursDetailApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var NurseuserListId = preferences.getString("NurseuserListId");
    print("nurseuserlistId: ${NurseuserListId}");
    var url =
        "http://test.pswellness.in/api/NurseAPI/NurseDetails?id=$NurseuserListId";
    //baseUrl + 'api/NurseAppointmentAPI/NurseAppointmentList?NurseId=56';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        // NursedetailbyId? nursedetailbyId =
        // nursedetailbyIdFromJson(r.body);
        var nursedetailbyId = nursedetailbyIdFromJson(r.body);
        print('############nurse123: ${nursedetailbyId.nurseName}');
        return nursedetailbyId;
      }
    } catch (error) {
      print("okokokocnurseeee:${error}");
      return;
    }
  }

  ///time slots Api get...........................26 april 2023.....slot........

  static Future<List<TimeSlot>?> gettimeslotApi() async {
    var url = "http://test.pswellness.in/api/CommonApi/TimeSlot";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var timeslotData = timeSlotsFromJson(r.body);
        return timeslotData.timeSlots;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///todo: lab booking 2 api........27 april 2023...

  static Labbooking2Api(
    var Lab_Id,
    var TestDate,
    var Slotid,
  ) async {
    //LablistssId
    var url = baseUrl + 'api/LabApi/Booknow';

    SharedPreferences preferences = await SharedPreferences.getInstance();
    var LablistssId = preferences.getString("LablistssId");
    print("LablistssIdoooo: ${LablistssId}");
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labusereportdr:${userid}');

    var body = {
      "Lab_Id": "$LablistssId",
      "TestDate": TestDate,
      "Slotid": Slotid,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );

    print(r.body);
    if (r.statusCode == 200) {
      ///todo:labbookingid.........5  june 2023....
      prefs.write("BookingId".toString(), json.decode(r.body)["BookingId"]);
      DriverId = prefs.read("BookingId").toString();
      print('eeeebookingid:$BookingId');

      ///
      prefs.write("labbooking_Id".toString(), json.decode(r.body)['BookingId']);
      labbooking_Id = prefs.read("labbooking_Id").toString();
      print('&&&&&&&&&&&&&&lab:${labbooking_Id}');
      //saved id..........
      //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
      Id = prefs.read("Id").toString();

      print("labbbbodyy:${r.body}");

      // print('&&&&&&&&&&&&&&nursebookingId:${Id}');
      ///
      // //saved token.........
      // prefs.write("token".toString(), json.decode(r.body)['token']);
      // token = prefs.read("token").toString();
      // print(token);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo: doctor booking 2 api........27 april 2023...

  static Doctorbooking2Api(
    var Doctor_Id,
    var Slot_id,
    var AppointmentDate,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var DoctorListId = preferences.getString("DoctorListId");
    print("DoctorListId: ${DoctorListId}");
    //DoctorListId
    var url = baseUrl + 'api/DoctorApi/DoctorBooknow';

    var body = {
      "Doctor_Id": "$DoctorListId",
      "Slot_id": Slot_id,
      "AppointmentDate": AppointmentDate,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );

    print(r.body);
    if (r.statusCode == 200) {
      var prefs = GetStorage();

      ///todo:doctorbookingid.........6...june 2023....
      prefs.write("doctorbooking_Id".toString(), json.decode(r.body)['Id']);
      doctorbooking_Id = prefs.read("doctorbooking_Id").toString();
      print('&&&&&&&&&&&&&&doctor:${doctorbooking_Id}');
      //saved id..........
      //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
      Id = prefs.read("Id").toString();

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo: health chkp booking 2.........gcktcvut,....
  ///todo: lab booking 2 api........27 april 2023...

  static Healthcheckup2Api(
    var Test_Id,
    var TestDate,
    var Slotid,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var HealthchkpListId = preferences.getString("HealthchkpListId");
    print("HealthchkpListId: ${HealthchkpListId}");
    var url = baseUrl + 'api/LabApi/Booknow';

    var body = {
      "Test_Id": "$HealthchkpListId",
      "TestDate": TestDate,
      "Slotid": Slotid,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo health checkup post booking 1 api.....29 april 2023...

  static Healthbooking1Api(
    var StateMaster_Id,
    var CityMaster_Id,
    var testId,
  ) async {
    var url = baseUrl + 'api/HealthCheckUpApi/HealthCheckUpBooking';

    var body = {
      "StateMaster_Id": StateMaster_Id,
      "CityMaster_Id": CityMaster_Id,
      "testId": testId,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      var prefs = GetStorage();
      //saved id..........
      //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
      Id = prefs.read("Id").toString();
      // print('&&&&&&&&&&&&&&nursebookingId:${Id}');
      ///
      // //saved token.........
      // prefs.write("token".toString(), json.decode(r.body)['token']);
      // token = prefs.read("token").toString();
      // print(token);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  //complain_register user api................

  static UserComplainApi(
    var LoginId,
    var Subjects,
    var Complaints,
    var IsDeleted,
    var IsResolved,
    var Others,
    var Doctor,
  ) async {
    var url = baseUrl + 'api/ComplaintApi/PatientComplaint';
    // var prefs = GetStorage();
    // //saved id..........
    // //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
    // Id = prefs.read("Id").toString();
    // print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

    var body = {
      "Login_Id": Id,
      "Subjects": Subjects,
      "Complaints": Complaints,
      "IsDeleted": IsDeleted,
      "IsResolved": IsResolved,
      "Others": Others,
      "Doctor": Doctor,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);

    if (r.statusCode == 200) {
      var prefs = GetStorage();
      //saved id..........
      //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
      Id = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

      //saved id..........
      // prefs.write("Id".toString(), json.decode(r.body)['Id']);
      // Id = prefs.read("Id").toString();
      // print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');
      ///
      // //saved token.........
      // prefs.write("token".toString(), json.decode(r.body)['token']);
      // token = prefs.read("token").toString();
      // print(token);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///lab test name Api get ...........................
  static Future<List<TestModel>> getTestNameApi() async {
    var url = "http://test.pswellness.in/api/CommonApi/TestList";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var testnameData = testNameModelFromJson(r.body);
        return testnameData.tests;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///Todo: from here franchies 2 section.................
  static FranchiesSpealistApi() async {
    var url = baseUrl + 'api/CommonApi/GetSpecialist?depId=87';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        SpealistFranchies? catagarylist = spealistFranchiesFromJson(r.body);
        return catagarylist;
      }
    } catch (error) {
      return;
    }
  }

  ///Todo: from here nurse 3 section.................////
  // nurse appointment detail.............................
  static NurseappointmentApibyuser() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercart:${userid}');
    print(userid);
    // print(url);
    var url =
        "http://test.pswellness.in/api/PatientApi/AppoinmentHistory?Id=$userid";
    // "http://test.pswellness.in/api/NurseAppointmentAPI/NurseAppointmentList?NurseId=56";
    //baseUrl + 'api/NurseAppointmentAPI/NurseAppointmentList?NurseId=56';

    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print(url);
        NurseAppointmentDetail? nurseAppointmentDetail =
            nurseAppointmentDetailFromJson(r.body);
        return nurseAppointmentDetail;
      }
    } catch (error) {
      return;
    }
  }

  //from_here nurse type.........................

  //doctor profile  api 2..........................
  static NurseTypeApi() async {
    var url = baseUrl + 'api/CommonApi/NurseList';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        NurseList? nurseList = nurseListFromJson(r.body);
        return nurseList;
      }
    } catch (error) {
      return;
    }
  }

  ///Todo: from here doctor 9 section.................
  ///
  //sign up  Api doctor Api 1........................................................
  static signDoctorUpApi(
    var PinCode,
    var Id,
    var DoctorName,
    var PhoneNumber,
    var MobileNumber,
    var EmailId,
    var StateMasterId,
    var CityMasterId,
    var Location,
    var LicenceNumber,
    var ClinicName,
    var DepartmentId,
    var SpecialistId,
    var Fee,
    var Password,
    var ConfirmPassword,
    var LicenceBase64,
    var LicenceImageName,
    var LicenceImage,
    var StartTime,
    var EndTime,
    var SlotTiming,
    var StartTime2,
    var EndTime2,
    var SlotTiming2,
    // var Name,
    // var Mobile_No,
    // var Email_Id,
    // var PassWord,
    // var ConfirmPassWord,
  ) async {
    try {
      var url = baseUrl + 'api/SignupApi/DoctorRegistration';
      var body = {
        "PinCode": PinCode,
        "Id": Id,
        "DoctorName": DoctorName,
        "PhoneNumber": PhoneNumber,
        "MobileNumber": MobileNumber,
        "EmailId": EmailId,
        "StateMaster_Id": StateMasterId,
        "CityMaster_Id": CityMasterId,
        "Location": Location,
        "LicenceNumber": LicenceNumber,
        "ClinicName": ClinicName,
        "Department_Id": DepartmentId,
        "Specialist_Id": SpecialistId,
        "Fee": Fee,
        "Password": Password,
        "ConfirmPassword": ConfirmPassword,
        "LicenceBase64": LicenceBase64,
        "LicenceImageName": LicenceImageName,
        "LicenceImage": LicenceImage,
        "StartTime": StartTime,
        "EndTime": EndTime,
        "SlotTiming": SlotTiming,
        "StartTime2": StartTime2,
        "EndTime2": EndTime2,
        "SlotTiming2": SlotTiming2,

        // "Name": Name,
        // "Mobile_No": Mobile_No,
        // "Email_Id": Email_Id,
        // "PassWord": PassWord,
        // "ConfirmPassWord": ConfirmPassWord,
      };

      print(body);

      http.Response r = await http.post(
        Uri.parse(url),
        body: body,
      );
      print(r.body);

      if (r.statusCode == 200) {
        var prefs = GetStorage();
        //saved id..........
        prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
        Id = prefs.read("Id").toString();
        print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');
        return r;
      } else {
        Get.snackbar('Error', 'SignUp Fail');
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }

  //doctor profile  api 2..........................
  static DoctorProfileApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&sdcfsdfdsuserid:${userid}');
    var url = baseUrl + 'api/DoctorApi/DoctorProfile?DoctorId=$userid';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        DoctorProfile? doctorProfile = doctorProfileFromJson(r.body);
        print("drprofileurl:${url}");
        print("drprofileurl:${r.body}");
        return doctorProfile;
      }
    } catch (error) {
      return;
    }
  }

  //complain_register doctor api................

  static doctorComplainApi(
    var LoginId,
    var Subjects,
    var Complaints,
    var IsDeleted,
    var IsResolved,
    var Others,
  ) async {
    var url = baseUrl + 'api/ComplaintApi/DoctorComplaint';

    var body = {
      "Login_Id": LoginId,
      "Subjects": Subjects,
      "Complaints": Complaints,
      "IsDeleted": IsDeleted,
      "IsResolved": IsResolved,
      "Others": Others,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      var prefs = GetStorage();
      //saved id..........
      // prefs.write("Id".toString(), json.decode(r.body)['Id']);
      // Id = prefs.read("Id").toString();
      // print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');
      ///
      // //saved token.........
      // prefs.write("token".toString(), json.decode(r.body)['token']);
      // token = prefs.read("token").toString();
      // print(token);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  //complain_register doctor api................

  static NurseComplainApi(
    var LoginId,
    var Subjects,
    var Complaints,
    var IsDeleted,
    var IsResolved,
    var Others,
  ) async {
    var url = baseUrl + 'api/ComplaintApi/NurseComplaints';

    var body = {
      "Subjects": Subjects,
      "Complaints": Complaints,
      "IsDeleted": IsDeleted,
      "IsResolved": IsResolved,
      "Others": Others,
      "Login_Id": LoginId,
    };

    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      var prefs = GetStorage();
      //saved id..........
      // prefs.write("Id".toString(), json.decode(r.body)['Id']);
      // Id = prefs.read("Id").toString();
      // print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');
      ///

      // //saved token.........
      // prefs.write("token".toString(), json.decode(r.body)['token']);
      // token = prefs.read("token").toString();
      // print(token);

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  //view_patient_list api 3.........

  static ViewPatientReportsApi() async {
    var url =
        baseUrl + 'api/DoctorApi/PatientReports?DoctorId=151&PatientId=77';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        ViewPatientReport? viewPatientReport =
            viewPatientReportFromJson(r.body);
        return viewPatientReport;
      }
    } catch (error) {
      return;
    }
  }

  //view_payment_history.............

  static ViewPaymentHistoryApi() async {
    var url = baseUrl + 'api/DoctorApi/paymentHistory?id=151&Date=2023-01-10';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var viewpaymentreport = paymentHistoryFromJson(r.body);
        return viewpaymentreport;
      }
    } catch (error) {
      return;
    }
  }

  //patient_list_api..........................
  static ViewPatientsListApi() async {
    var url =
        "http://test.pswellness.in/api/DoctorApi/ViewPatientList?DoctorId=146";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var PatientList = patientListFromJson(r.body);
        return PatientList;
      }
    } catch (error) {
      return;
    }
  }

  ///todo:from here 1_user................................
//lab_list_api..........................
  static ViewLabListApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var labstateId = preferences.getString("labstateId");
    print("labstateId: ${labstateId}");
    var labcityId = preferences.getString("labcityId");
    print("labcityId: ${labcityId}");
    var labtestId = preferences.getString("labtestId");
    print("labtestId: ${labtestId}");

    var url =
        "http://test.pswellness.in/api/LabApi/LabsList?CityId=$labcityId&StateId=$labstateId&testId=$labtestId";
    //var url = "http://test.pswellness.in/api/LabApi/LabsList?CityId=786";
    //67,2,623..
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("&&&&&&&&:princelablist${r.body.toString()}");
        print("&&&&&&&&&lablisturl:${url.toString()}");
        var LabListUser = labListUserFromJson(r.body);
        return LabListUser;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: lab_list_detail_api..........................18april_--2023
  static ViewLabdetailssApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var LablistssId = preferences.getString("LablistssId");
    print("LablistssId: ${LablistssId}");
    var url = "http://test.pswellness.in/api/LabApi/LabDetails?id=$LablistssId";
    //http://test.pswellness.in/api/LabApi/LabDetails?id=16
    try {
      http.Response r = await http.get(Uri.parse(url));

      //print(r.body.toString());
      if (r.statusCode == 200) {
        print("&&&&&&&&:princelabdetailrr${r.body.toString()}");
        print("&&&&&&&&&lablistssurtttl:${url}");

        var Labdetailbyid = labdetailbyidFromJson(r.body);
        return Labdetailbyid;
      }
    } catch (error) {
      print("&&&&&&&&&lablistserrorr:${error.toString()}");
      return;
    }
  }

  ///todo: doctor_detail_api...................1 may--2023
  static ViewdetailhlthchkpApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var HealthchkpListId = preferences.getString("HealthchkpListId");
    print("HealthchkpListId: ${HealthchkpListId}");
    //HealthchkpListId
    var url =
        "http://test.pswellness.in/api/HealthCheckUpApi/ViewMore?HealthId=$HealthchkpListId";
    try {
      http.Response r = await http.get(Uri.parse(url));

      //print(r.body.toString());
      if (r.statusCode == 200) {
        print("&&&&&&&&:princehlthchkpdetail${r.body.toString()}");
        print("&&&&&&&&&princehlthchkpdetail:${url.toString()}");

        var healthchkpdetailbyid = healthCheckupcheDetailFromJson(r.body);
        return healthchkpdetailbyid;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: ambulance_type_api..........................23april.....2023.........
  static ViewAmbulanceTypeApi() async {
    var url = "http://test.pswellness.in/api/VehicleTypeApi/AmbulanceTypeList";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var Ambulancetype = ambulancetypeFromJson(r.body);
        return Ambulancetype;
      }
    } catch (error) {
      return;
    }
  }

  //doctor_list_api..........................
  static ViewDoctorListApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var doctorstateId = preferences.getString("doctorstateId");
    print("doctorstateId: ${doctorstateId}");
    var doctorcityId = preferences.getString("doctorcityId");
    print("doctorcityId: ${doctorcityId}");
    var doctordepartmentId = preferences.getString("doctordepartmentId");
    print("doctordepartmentId: ${doctordepartmentId}");
    var doctorspeacilistId = preferences.getString("doctorspeacilistId");
    print("doctorspeacilistId: ${doctorspeacilistId}");
    var url =
        "http://test.pswellness.in/api/DoctorApi/DoctorChooseDep?Department_id=$doctordepartmentId&Specialist_id=$doctorspeacilistId&StateMaster_Id=$doctorstateId&CityMaster_Id=$doctorcityId";

    // "http://test.pswellness.in/api/DoctorApi/DoctorChooseDep?Department_id=1&Specialist_id=1&StateMaster_Id=33&CityMaster_Id=771";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var GetDoctorListModel = getDoctorListModelFromJson(r.body);
        return GetDoctorListModel;
      }
      print(url);
      print(r.body);
      print(r.statusCode);
    } catch (error) {
      return;
    }
  }

  ///todo: doctor details by Id 17 april 2023.............
  static ViewDoctorDetailApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var DoctorListId = preferences.getString("DoctorListId");
    print("DoctorListId: ${DoctorListId}");
    var url =
        //"http://test.pswellness.in/api/PatientApi/GetTotalRating?Professional=Doctor&Pro_Id=$DoctorListId";
        "http://test.pswellness.in/api/DoctorApi/DoctorDetails?id=$DoctorListId";
    // http://test.pswellness.in/api/PatientApi/GetTotalRating?Professional=Doctor&Pro_Id=13
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print(url);
        print(r.body);
        print("okokokokdetaildoctorrbody:${r.body}");
        print(r.statusCode);
        print("okokokokdetaildoctorr:${url}");
        var GetDoctorDetailbyId = getDoctorDetailbyIdFromJson(r.body);
        return GetDoctorDetailbyId;
      }
    } catch (error) {
      return;
    }
  }

  ///todo:add to cart......................................................add to cart...
  static Addtocartmedicineapi(MedicineId, Quantity) async {
    var url = baseUrl + 'api/PatientMedicine/AddMedicineToCart';
    var prefs = GetStorage();
    //saved id..........
    final PatientId = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&okoko:${Id}');
    // token = prefs.read("token").toString();

    var body = {
      "PatientId": PatientId,
      "MedicineId": MedicineId,
      "Quantity": Quantity,
    };
    // final headers = {"Authorization": "Bearer $token"};

    print(body);
    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
    );
    print(url);
    print(r.body);
    print(r.statusCode);

    if (r.statusCode == 200) {
      CallLoader.hideLoader();
      Get.snackbar('Sucess', 'Added cart Sucessfully');
      return r;
    } else {
      CallLoader.hideLoader();
      Get.snackbar('Error', "${r.body}");
      return r;
    }
  }

  ///todo: add to cart 10 may 2023.....princecart.......
  static AddToCartMedicineApi(
    var MedicineId,
  ) async {
    var url = baseUrl + 'api/PatientMedicine/AddMedicineCart';
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercart:${userid}');
    print(userid);
    print(url);

    var body = {
      "PatientId": userid,
      "MedicineId": MedicineId,
    };

    print(body);
    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
    );
    print(url);
    print(r.body);
    print(r.statusCode);

    if (r.statusCode == 200) {
      Get.snackbar('Sucess', 'Added cart Sucessfully');
      return r;
    } else {
      Get.snackbar('Message', 'Already Added');

      ///orignal code
      //Get.snackbar('Error', 'Already Added');
      return r;
    }
  }

  ///todo: add to cart plius 10 may 2023.....princecart.......

  static AddToCartPlusMedicineApi(
    var MedicineId,
  ) async {
    var url = baseUrl + 'api/PatientMedicine/PlusAddToCart';
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercartplus:${userid}');
    print(userid);
    print(url);

    var body = {
      "MedicineId": MedicineId,
      "PatientId": userid,
    };

    print(body);
    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
    );
    print(url);
    print(r.body);
    print(r.statusCode);
    print("plusaddtocard:${body}");

    if (r.statusCode == 200) {
      print("plusaddtocardsucess:${body}");
      //Get.snackbar('Sucess', 'Added cart Sucessfully');
      return r;
    } else {
      //Get.snackbar('Message', 'Already Added');

      ///orignal code
      Get.snackbar('Error', '${r.body}');
      return r;
    }
  }

  ///todo: add to cart minus 10 may 2023.....princecart.......

  static AddToCartMinusMedicineApi(
    var MedicineId,
  ) async {
    var url = baseUrl + 'api/PatientMedicine/minusAddToCart';
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercartplus:${userid}');
    print(userid);
    print(url);

    var body = {
      "MedicineId": MedicineId,
      "PatientId": userid,
    };

    print(body);
    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
    );
    print(url);
    print(r.body);
    print(r.statusCode);

    if (r.statusCode == 200) {
      //Get.snackbar('Sucess', 'Added cart Sucessfully');
      return r;
    } else {
      //Get.snackbar('Message', 'Already Added');

      ///orignal code
      Get.snackbar('Error', '${r.body}');
      return r;
    }
  }

  ///todo: checkout---api---total_cost....prince 10 may...
  ///

  static GetMedicineCheckoutApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercartplus:${userid}');
    print(userid);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var MedicineaddresslistssId =
        preferences.getString("MedicineaddresslistssId");
    print("MedicineaddresslistssId: ${MedicineaddresslistssId}");
    var url =
        'http://test.pswellness.in/api/PatientMedicine/OrderPlacedDetails?PatientId=$userid&id=$MedicineaddresslistssId';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      print(url);
      if (r.statusCode == 200) {
        CheckoutmedicineModel checkoutmrdicineModel =
            checkoutmedicineModelFromJson(r.body);
        print("RRR123tttyyt55: ${checkoutmrdicineModel.data?.totalPrice}");
        print("RRRRR123url55: ${url}");
        // prefs.write("totalCostR",
        //     checkoutmrdicineModel.data?.totalPrice); // used in cart_product2
        return checkoutmrdicineModel;
      }
    } catch (error) {
      print("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR: ${error}");
      return;
    }
  }

  /// user medicinrcart_list_api.............................................
  static MedicinecartlistApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercartplus:${userid}');
    print(userid);
    var url =
        "http://test.pswellness.in/api/PatientMedicine/MedicineDetails?PatientId=$userid";
    //"http://test.pswellness.in/api/PatientMedicine/MedicineCart?patientId=$PatientId";
    //"http://test.pswellness.in/api/PatientMedicine/MedicineDetails?PatientId=$PatientId";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print('&&&okouuuuucartlisurl:${url}');

        var MedicineCartListModel = medicineCartListModelFromJson(r.body);
        return MedicineCartListModel;
      }
      print('&&&&&okokouuuuucartlist:${r.body}');
    } catch (error) {
      print('&&&&&&&&&&&&&&&&&&&&&&okokouuuuucartlisterror:${error}');

      return;
    }
  }

  //
  /// user medicine_list_api..........................
  static MedicinelistApi() async {
    var url = "http://test.pswellness.in/api/PatientMedicine/GetMedicines";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var MedicineList = medicineListFromJson(r.body);
        return MedicineList;
      }
    } catch (error) {
      return;
    }
  }

  /// user medicine_address_list_api..........................28april..2023.......
  static MedicineaddresslistApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercartplus:${userid}');
    print(userid);
    var url =
        "http://test.pswellness.in/api/PatientApi/GetMedicineAddress?Patient_id=$userid";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print('&&&&&&&&&&&&&&&&&&&&&&okaddressrrr:${url}');
        print('&&&&&&&&&&&&&&&&&&&&&&okaddressreww:${r.body}');
        var MedicineAddresslist = medicineAddressModelFromJson(r.body);
        return MedicineAddresslist;
      }
    } catch (error) {
      return;
    }
  }

  /// user medicine_orderhistory_list_api.......................21april2023...
  static MedicineorderhistorylistApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercartplus:${userid}');
    print(userid);
    var url =
        "http://test.pswellness.in/api/PatientMedicine/MedicineDetailsByPatient?PatientId=$userid";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print('&&&&&&&&&&&&&&&&&&&&&&usercartplususerrr:${url}');

        var MedicineOrderHistory = medicineOrderHistoryFromJson(r.body);
        return MedicineOrderHistory;
      }
    } catch (error) {
      return;
    }
  }

  ///lab_list_2..................................
  static LabListDrowerApi() async {
    var url =
        "http://test.pswellness.in/api/HealthCheckUpApi/ViewMore?HealthId=18";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var HealthCheckupList = healthCheckupListFromJson(r.body);
        return HealthCheckupList;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: this is the api of labappointment history by lab id.....

  static LabappointmenthistoryApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userlabhist:${userid}');
    print(userid);
    var url = "http://test.pswellness.in/api/LabApi/BookedTestHistory?LabId=12";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var LabHistorybyLabId = labHistorybyLabIdFromJson(r.body);
        print(
            '############43322: ${LabHistorybyLabId.testList?[0].patientName}');
        return LabHistorybyLabId;
      }
    } catch (error) {
      print("okokokocr8ytviuobipn:${error}");
      return;
    }
  }

  ///todo: this is the api of labappointment history by userid....21april 2023....

  static LabappointmentshistorybyuserIdApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userlabhist:${userid}');
    print(userid);
    var url =
        "http://test.pswellness.in/api/PatientApi/LabDetailsByPatient?PatientId=$userid";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print('&&&&&&&&&&&&&&&&&&&&&&userlabhistrrr:${url}');
        print('&&&&&&&&&&&&&&&&&&&&&&userlabhisbodyy:${r.body}');
        var Labappointmentbyuserid = labappointmentbyuseridFromJson(r.body);
        // print(
        //     '############43322: ${Labappointmentbyuserid.labModel?[0].labName}');
        return Labappointmentbyuserid;
      }
    } catch (error) {
      print("okokokocr8ytviuobipnrr:${error}");
      return;
    }
  }

  ///checkup_history_3...........................
  static LabHistoryApi() async {
    var url =
        "http://test.pswellness.in/api/HealthCheckUpApi/H_CheckUpList?cityId=67";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var HealthCheckupListss = healthCheckupListssFromJson(r.body);
        return HealthCheckupListss;
      }
    } catch (error) {
      return;
    }
  }

  ///checkup_history_3...........................22 april....2023
  static HealthcheckuplistApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var healthchkpstateId = preferences.getString("healthchkpstateId");
    print("healthchkpstateId: ${healthchkpstateId}");
    var healthchkpcityId = preferences.getString("healthchkpcityId");
    print("healthchkpcityId: ${healthchkpcityId}");
    var healthchkptestId = preferences.getString("healthchkptestId");
    print("healthchkptestId: ${healthchkptestId}");

    var url =
        "http://test.pswellness.in/api/HealthCheckUpApi/HCheckUpList?StateId=$healthchkpstateId&CityId=$healthchkpcityId&testId=$healthchkptestId";

    //"http://test.pswellness.in/api/HealthCheckUpApi/HCheckUpList?StateId=2&CityId=66&testId=1";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("okokurlchkp:${url}");
        var HealthCheckupListss = healthCheckupListssFromJson(r.body);
        return HealthCheckupListss;
      }
    } catch (error) {
      return;
    }
  }

  //
  ///state Api get...........................
  static Future<List<StateModel>> getSatesApi() async {
    var url = "http://test.pswellness.in/api/CommonApi/GetStates";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var statesData = statesModelFromJson(r.body);
        return statesData.states;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///get_cities_api...........
  static Future<List<City>> getCitiesApi(String stateID) async {
    var url =
        "http://test.pswellness.in/api/CommonApi/GetCitiesByState?stateId=$stateID";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var citiesData = cityModelFromJson(r.body);
        return citiesData.cities;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///time slots Api get...........................26 april 2023.....slot........

  // static Future<List<TimeSlot>?> gettimeslotApi() async {
  //   var url = "http://test.pswellness.in/api/CommonApi/TimeSlot";
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       var timeslotData = timeSlotsFromJson(r.body);
  //       return timeslotData.timeSlots;
  //     } else {
  //       return [];
  //     }
  //   } catch (error) {
  //     return [];
  //   }
  // }

  ///ambulance catagary Api get...........................24 april 2023......yuibubu
  // static Future<List<Vehicle>> getambulancecatagaryApi() async {
  //   var url =
  //       "http://test.pswellness.in/api/VehicleTypeApi/Vehicle?id=1";
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       var AmbulancecatagaryListss = ambulancecatagarybyIdFromJson(r.body);
  //       return AmbulancecatagaryListss;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }
  ///todo: ambulance type api 1......
  static Future<List<Vehicle>?> getambulancecatagaryApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var AmbulancelistssId = preferences.getString("AmbulancelistssId");
    print("AmbulancelistssId: ${AmbulancelistssId}");
    var url = "http://test.pswellness.in/api/VehicleTypeApi/Vehicle?id=1";

    ///"http://test.pswellness.in/api/VehicleTypeApi/Vehicle?id=$AmbulancelistssId";
    //"1";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("AmbulancelistssIdsuccess: ${AmbulancelistssId}");
        print("AmbulancelistssIdurl: ${url}");

        var ambulanceData = ambulancecatagarybyIdFromJson(r.body);
        return ambulanceData.vehicle;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///todo: ambulance type api 1......
  static Future<List<Vehicle>?> getambulancecatagary2Api() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var AmbulancelistssId = preferences.getString("AmbulancelistssId");
    print("AmbulancelistssId: ${AmbulancelistssId}");
    var url = "http://test.pswellness.in/api/VehicleTypeApi/Vehicle?id=2";

    // "http://test.pswellness.in/api/VehicleTypeApi/Vehicle?id=$AmbulancelistssId";
    //"1";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("AmbulancelistssIdsuccess: ${AmbulancelistssId}");
        print("AmbulancelistssIdurl: ${url}");

        var ambulanceData = ambulancecatagarybyIdFromJson(r.body);
        return ambulanceData.vehicle;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///todo: ambulance type api 1......
  static Future<List<Vehicle>?> getambulancecatagary3Api() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var AmbulancelistssId = preferences.getString("AmbulancelistssId");
    print("AmbulancelistssId: ${AmbulancelistssId}");
    var url = "http://test.pswellness.in/api/VehicleTypeApi/Vehicle?id=3";

    //"http://test.pswellness.in/api/VehicleTypeApi/Vehicle?id=$AmbulancelistssId";
    //"1";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("AmbulancelistssIdsuccess: ${AmbulancelistssId}");
        print("AmbulancelistssIdurl: ${url}");

        var ambulanceData = ambulancecatagarybyIdFromJson(r.body);
        return ambulanceData.vehicle;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///get_vehicle_type_api...........24 april 2023........

  static
      //Future<List<VehicleDetaile>?>
      getvechilebyidApi(String ambulancecatagaryID) async {
    var url =
        "http://test.pswellness.in/api/VehicleTypeApi/VehicleType?id=$ambulancecatagaryID";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var vehiceData = vehicletypebycatagaryIdFromJson(r.body);
        return vehiceData.vehicleDetailes;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///get_vehicle_type_api 2...........14 july 2023........

  static
      //Future<List<VehicleDetaile>?>
      getvechilebyid2Api(String ambulancecatagaryID) async {
    var url =
        "http://test.pswellness.in/api/VehicleTypeApi/VehicleType?id=$ambulancecatagaryID";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var vehiceData = vehicletypebycatagaryIdFromJson(r.body);
        return vehiceData.vehicleDetailes;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///get_vehicle_type_api...........14 july 2023........

  static
      //Future<List<VehicleDetaile>?>
      getvechilebyid3Api(String ambulancecatagaryID) async {
    var url =
        "http://test.pswellness.in/api/VehicleTypeApi/VehicleType?id=$ambulancecatagaryID";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var vehiceData = vehicletypebycatagaryIdFromJson(r.body);
        return vehiceData.vehicleDetailes;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///doctor department Api get..dropdownapi user.........................
  static Future<List<DepartmentModel>> getDortorDepartmentApi() async {
    var url = "http://test.pswellness.in/api/CommonApi/GetDepartments";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var statesData = getdepartmentmodelFromJson(r.body);
        return statesData.departments;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///get_cities_api...........

  static Future<List<SpecialistModel>> getSpeaclistbyIdApi(String depId) async {
    var url =
        "http://test.pswellness.in/api/CommonApi/GetSpecialist?depId=$depId";
    //"http://test.pswellness.in/api/CommonApi/GetCitiesByState?stateId=$stateID";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var speclistData = getspecialistdeptbyIdFromJson(r.body);
        return speclistData.specialist;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///get_skils_api.....................

  static getSkillsApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&skilsprofiledetail:${userid}');
    print(userid);
    var url =
        'http://test.pswellness.in/api/DoctorApi/GetDoctorSkills?doctorId=$userid';
    //'111';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        GetskillsModel? viewSkilsReport = getskillsModelFromJson(r.body);
        return viewSkilsReport;
      }
    } catch (error) {
      return;
    }
  }

  ///

  ///nurse Api get...........................
  static Future<List<NurseModels>> getnursetypeApi() async {
    var url = "http://test.pswellness.in/api/CommonApi/NurseList";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var nursetypeData = getNurseTypeModelFromJson(r.body);
        return nursetypeData.nurse;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///todo:complain_subject..user.of...user...id.....getapidropdown...25apr...2023..
  static Future<List<Complaint41Patient>> getsubjecttypeApi() async {
    var url = "http://test.pswellness.in/api/CommonApi/PatientSubjects";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var subjecttypeData = complainSubjectModelFromJson(r.body);
        //ComplainSubjectModel hggh=complainSubjectModelFromJson(r.body);
        //return subjecttypeData.complaint41Patient;
        return subjecttypeData.complaint41Patient;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }
  // static Future<List<StateModel>> getSatesApi() async {
  //   var url = "http://test.pswellness.in/api/CommonApi/GetStates";
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       var statesData = statesModelFromJson(r.body);
  //       return statesData.states;
  //     } else {
  //       return [];
  //     }
  //   } catch (error) {
  //     return [];
  //   }
  //}

  ///nurse location Api get.........................................................
  static Future<List<NurseLocationModel>> getnurselocationtApi() async {
    var url = "http://pswellness.in/api/CommonApi/GetLocation";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var nurselocationData = getNurseLocationModelFromJson(r.body);
        return nurselocationData.location;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///add doctor's skils api...........

  static doctorSkillsApi(
    var DoctorId,
    var SkillName,
  ) async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&skilsprofiledetail:${userid}');
    print(userid);

    var url = baseUrl + 'api/DoctorApi/AddSkill';

    var body = {
      "Doctor_Id": "$userid",
      "SkillName": SkillName,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      //Get.snackbar("Skills added",r.body);
      var prefs = GetStorage();
      //saved id..........
      // prefs.write("Id".toString(), json.decode(r.body)['Id']);
      // Id = prefs.read("Id").toString();
      // print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');
      ///
      // //saved token.........
      // prefs.write("token".toString(), json.decode(r.body)['token']);
      // token = prefs.read("token").toString();
      // print(token);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo: Delete skills ......17 june....
  static doctorSkillDeleteApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var SkilsId = preferences.getString("SkilsId");
    print("SkilsId: ${SkilsId}");

    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&skilsprofiledetail:${userid}');
    print(userid);
    var url = baseUrl + 'api/DoctorApi/RemoveSkill?id=$SkilsId';

    http.Response r = await http.post(
      Uri.parse(url),
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      //Get.snackbar("Skills added",r.body);
      var prefs = GetStorage();
      //saved id..........
      // prefs.write("Id".toString(), json.decode(r.body)['Id']);
      // Id = prefs.read("Id").toString();
      // print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');
      ///
      // //saved token.........
      // prefs.write("token".toString(), json.decode(r.body)['token']);
      // token = prefs.read("token").toString();
      // print(token);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///book lab api...........6 march 2023

  static BooklabApi(
    var LabId,
    var TestId,
    var PatientId,
    var PatientName,
    var PatientAddress,
    var ContactNumber,
    var TestDate,
    var AvailabelTime1,
    var AvailableTime2,
    var Amount,
    var StateMasterId,
    var CityMasterId,
    var Patient,
  ) async {
    var url = baseUrl + 'api/LabApi/BookLabTest';

    var body = {
      "Lab_Id": "12",
      "Test_Id": "1",
      "Patient_Id": Id,
      "PatientName": PatientName,
      "PatientAddress": PatientAddress,
      "ContactNumber": "6398028236",
      "TestDate": TestDate,
      "AvailabelTime1": AvailabelTime1,
      "AvailableTime2": AvailableTime2,
      "Amount": Amount,
      "StateMaster_id": StateMasterId,
      "CityMaster_id": CityMasterId,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      var prefs = GetStorage();
      //saved id..........
      prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
      Id = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');
      //Get.snackbar("Skills added",r.body);

      //saved id..........
      // prefs.write("Id".toString(), json.decode(r.body)['Id']);
      // Id = prefs.read("Id").toString();
      // print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');
      ///
      // //saved token.........
      // prefs.write("token".toString(), json.decode(r.body)['token']);
      // token = prefs.read("token").toString();
      // print(token);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  //GetDoctorListHospitalModel...
  ///get_skils_api...........

  static getListOfDoctorApi() async {
    var url =
        'http://test.pswellness.in/api/HospitalAPI/DoctorList?hospitalId=209';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        GetDoctorListHospitalModel? viewdoctorlist =
            getDoctorListHospitalModelFromJson(r.body);
        return viewdoctorlist;
      }
    } catch (error) {
      return;
    }
  }

  ///Todo: from here ........

  //login user api ps welness api 1..................................

  static DoctorsSignUpApi(
    var DoctorName,
    var EmailId,
    var Password,
    var ConfirmPassword,
    var MobileNumber,
    var Fee,
    var PhoneNumber,
    var StartTime,
    var SlotTiming,
    var DepartmentId,
    var SpecialistId,
    var LicenceNumber,
    var LicenceImage,
    var LicenceImageName,
    var PinCode,
    var ClinicName,
    var Location,
    var StateMasterId,
    var CityMasterId,
    var EndTime,
    var LicenceBase64,
  ) async {
    var url = baseUrl + 'api/SignupApi/DoctorRegistration';
    var body = {
      "DoctorName": DoctorName,
      "EmailId": EmailId,
      "Password": Password,
      "ConfirmPassword": ConfirmPassword,
      "MobileNumber": MobileNumber,
      "Fee": Fee,
      "PhoneNumber": PhoneNumber,
      "StartTime": StartTime,
      "SlotTiming": SlotTiming,
      "Department_Id": DepartmentId,
      "Specialist_Id": SpecialistId,
      "LicenceNumber": LicenceNumber,
      "LicenceImage": LicenceImage,
      "LicenceImageName": LicenceImageName,
      "PinCode": PinCode,
      "ClinicName": ClinicName,
      "Location": Location,
      "StateMaster_Id": StateMasterId,
      "CityMaster_Id": CityMasterId,
      "EndTime": EndTime,
      "LicenceBase64": LicenceBase64,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else if (r.statusCode == 500) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo: banner Api for user.1....................

  static getbanneruserApi() async {
    //var url = 'https://api.gyros.farm/api/AdminApi/BannerImage';
    //var url = baseUrl + 'api/SignupApi/getBanner/?id=1';
    var url = "http://test.pswellness.in/api/SignupApi/getBanner/?id=1";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      print(url.toString());
      if (r.statusCode == 200) {
        BannerListModel bannerListModel = bannerListModelFromJson(r.body);
        //BannerListModel bannerListModel = bannerListModelFromJson(r.body);
        return bannerListModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: banner Api for franchies.2........

  static getbannerfrachiseApi() async {
    //var url = 'https://api.gyros.farm/api/AdminApi/BannerImage';
    //var url = baseUrl + 'api/SignupApi/getBanner/?id=2';
    var url = "http://test.pswellness.in/api/SignupApi/getBanner/?id=2";

    //var url = "http://test.pswellness.in/api/SignupApi/getBanner/?id=1";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      print(url.toString());
      if (r.statusCode == 200) {
        BannerListModel bannerListModel = bannerListModelFromJson(r.body);
        return bannerListModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: banner Api for healthcheckup.3........

  static getbannerhealthcheckupApi() async {
    //var url = 'https://api.gyros.farm/api/AdminApi/BannerImage';
    //var url = baseUrl + 'api/SignupApi/getBanner/?id=3';
    var url = "http://test.pswellness.in/api/SignupApi/getBanner/?id=3";
    //var url = "http://test.pswellness.in/api/SignupApi/getBanner/?id=1";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      print(url.toString());
      if (r.statusCode == 200) {
        BannerListModel bannerListModel = bannerListModelFromJson(r.body);
        return bannerListModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: banner Api for doctor..4.......

  static getbannerdoctorApi() async {
    //var url = 'https://api.gyros.farm/api/AdminApi/BannerImage';
    var url = baseUrl + 'api/SignupApi/getBanner/?id=4';
    //var url = "http://test.pswellness.in/api/SignupApi/getBanner/?id=1";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        BannerListModel bannerListModel = bannerListModelFromJson(r.body);
        return bannerListModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: banner Api for driver..5.......

  static getbannerdriverApi() async {
    //var url = 'https://api.gyros.farm/api/AdminApi/BannerImage';
    var url = baseUrl + 'api/SignupApi/getBanner/?id=5';
    //var url = "http://test.pswellness.in/api/SignupApi/getBanner/?id=1";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        BannerListModel bannerListModel = bannerListModelFromJson(r.body);
        return bannerListModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: banner Api for nurse..6.......

  static getbannernurseApi() async {
    //var url = 'https://api.gyros.farm/api/AdminApi/BannerImage';
    // var url = baseUrl + 'api/SignupApi/getBanner/?id=6';
    var url = "http://test.pswellness.in/api/SignupApi/getBanner/?id=6";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      print(url);
      if (r.statusCode == 200) {
        BannerListModel bannerListModel = bannerListModelFromJson(r.body);
        return bannerListModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: banner Api for rwa..7.......

  static getbannerrawApi() async {
    //var url = 'https://api.gyros.farm/api/AdminApi/BannerImage';
    // var url = baseUrl + 'api/SignupApi/getBanner/?id=7';
    var url = "http://test.pswellness.in/api/SignupApi/getBanner/?id=7";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      print(url);
      if (r.statusCode == 200) {
        BannerListModel bannerListModel = bannerListModelFromJson(r.body);
        return bannerListModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: banner Api for chemist.8........

  static getbannerchemistApi() async {
    //var url = 'https://api.gyros.farm/api/AdminApi/BannerImage';
    //var url = baseUrl + 'api/SignupApi/getBanner/?id=8';
    var url = "http://test.pswellness.in/api/SignupApi/getBanner/?id=8";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      print(url);
      if (r.statusCode == 200) {
        BannerListModel bannerListModel = bannerListModelFromJson(r.body);
        return bannerListModel;
      }
    } catch (error) {
      return;
    }
  }

  ///get wallet ammount section..................................from gyros........
  static walletAmountApi() async {
    var prefs = GetStorage();
    //read id..........
    Id = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&prince:${Id}');
    //var url = baseUrl + 'api/AdminApi/ListWalletMoney/27';
    //var url = baseUrl1 + 'api/AdminApi/ListWalletMoney/$Id';
    var url = baseUrl + 'api/Wallet/ListWalletMoney/$Id';

    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print('&&&&&&&&&&&&&&&&&&princeprint:${url}');
        WalletModel? walletlist = walletModelFromJson(r.body);
        return walletlist;
      }
    } catch (error) {
      print('Error5');

      return;
    }
  }
  //

  ///wallet post api..........................................wallet......section.....
  static WalletPostApi(var UserId, var walletAmount) async {
    //var url = baseUrl1 + 'api/AdminApi/AddWalletMoney';
    var url = baseUrl + 'api/Wallet/AddWalletMoney';
    var prefs = GetStorage();
    // saved id..........
    //prefs.write("Id".toString(), json.decode(r.body)['Id']);
    Id = prefs.read("Id").toString();
    print('kjkjkljjkl:${Id}');
    //
    // token = prefs.read("token").toString();
    // print('&&&&&&&&&&&&&&&&&&&&&&okok:${token}');

    var body = {
      // "UserId": UserId,
      "UserId": Id,
      "walletAmount": walletAmount,
    };
    // final headers = {"Authorization": "Bearer $token"};

    print(body);
    http.Response r = await http.post(Uri.parse(url), body: body);
    print(url);
    print(r.body);
    print(r.statusCode);

    if (r.statusCode == 200) {
      //  var prefs = GetStorage();
      // // saved id..........
      //  prefs.write("Id".toString(), json.decode(r.body)['Id']);
      //  Id = prefs.read("Id").toString();
      //  print('kjkjkljjkl:${Id}');
      // Get.snackbar('Sucess', 'Added cart Sucessfully');
      return r;
    } else if (r.statusCode == 200) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///wallet post update api..........................................11...april..2023....gyros..
  static WalletPostUpdateApi(var UserId, var walletAmount) async {
    var url = baseUrl + 'api/Wallet/UpdateWalletMoney';
    var prefs = GetStorage();
    // saved id..........
    //prefs.write("Id".toString(), json.decode(r.body)['Id']);
    Id = prefs.read("Id").toString();
    print('kjkjkljjkl:${Id}');
    //
    // token = prefs.read("token").toString();
    // print('&&&&&&&&&&&&&&&&&&&&&&okok:${token}');

    var body = {
      // "UserId": UserId,
      "UserId": Id,
      "walletAmount": walletAmount,
    };
    // final headers = {"Authorization": "Bearer $token"};

    print(body);
    http.Response r = await http.post(Uri.parse(url), body: body);
    print(url);
    print(r.body);
    print(r.statusCode);

    if (r.statusCode == 200) {
      return r;
    } else if (r.statusCode == 200) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///.............end of the wallet section...............from gyros...........

  ///list of doctor appointment history user section......
  static userdoctorApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercartplus:${userid}');
    print(userid);
    var url =
        "http://test.pswellness.in/api/PatientApi/DoctorAptP?PatientId=$userid";
    // var url = "http://test.pswellness.in/api/PatientApi/ShowAppointMent?PatientId=137";
    //var url = baseUrl + "api/PatientApi/ShowAppointMent?PatientId=137";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      print("doctoruserrr: ${url}");
      if (r.statusCode == 200) {
        UserDoctorAppointmentHistory? userdoctorappointment =
            userDoctorAppointmentHistoryFromJson(r.body);
        return userdoctorappointment;
      }
    } catch (error) {
      print("some errror ");
      return;
    }
  }

  ///todo: lab payment history..........by lab Id.......11 may 2023...prince..

  static LabpaymenthistoryApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labuserrr:${userid}');
    print(userid);
    var url =
        //"http://test.pswellness.in/api/PatientApi/PatientProfiledetail?PatientId=137";
        //"http://test.pswellness.in/api/PatientApi/PatientProfiledetail?PatientId=$userid";
        "http://test.pswellness.in/api/LabApi/LabPayHis?Id=$userid";

    //http://test.pswellness.in/api/PatientApi/PatientProfiledetail?PatientId=137
    //var url = baseUrl + 'api/PatientApi/PatientProfiledetail?PatientId=$userid';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        LabpaymentModel? labpaymentModel = labpaymentModelFromJson(r.body);
        return labpaymentModel;
      }
    } catch (error) {
      print("errorlabbb:${error.toString()}");
      return;
    }
  }

  ///todo: lab profile detail..........by lab Id.......12 may 2023...prince..

  static LabprofiledetailApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labprofiledetail:${userid}');
    print(userid);
    var url =
        "http://test.pswellness.in/api/LabApi/LabUpdateProfiledetail?Id=$userid";

    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        LabprofileModel? labprofieModel = labprofileModelFromJson(r.body);
        return labprofieModel;
      }
    } catch (error) {
      print("errorlabbbprofile:${error.toString()}");
      return;
    }
  }

  ///todo: lab appointment detail..........by lab Id.......12 may 2023...prince..

  static LabapointmentdetailApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labappointmentdetail:${userid}');
    print(userid);
    var url =
        "http://test.pswellness.in/api/LabApi/AppoinmentDetail?Id=$userid";

    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        LabappointmentdetailsModel? labappointmentdetailsModel =
            labappointmentdetailsModelFromJson(r.body);
        return labappointmentdetailsModel;
      }
    } catch (error) {
      print("errorlabdetailss:${error.toString()}");
      return;
    }
  }

  ///todo: lab appointment history..........by lab Id.......12 may 2023...prince..

  static LabapointmenthistoryApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labappointmenthistory:${userid}');
    print(userid);
    var url = "http://test.pswellness.in/api/LabApi/LabAppoinH?Id=$userid";

    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        LabappointmentHistoryModel? labappointmenthistoryModel =
            labappointmentHistoryModelFromJson(r.body);
        return labappointmenthistoryModel;
      }
    } catch (error) {
      print("errorlabdetailsshis:${error.toString()}");
      return;
    }
  }

  ///todo: lab about us..........by lab Id.......12 may 2023...prince..

  static LababoutusApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labappointmenthistory:${userid}');
    print(userid);
    var url = "http://test.pswellness.in/api/LabApi/LabAbout?Id=$userid";

    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        LababoutusModel? labapaboutusmodel = lababoutusModelFromJson(r.body);
        return labapaboutusmodel;
      }
    } catch (error) {
      print("errorlabdetailsshis:${error.toString()}");
      return;
    }
  }

  ///todo: lab about us..........by lab Id.......12 may 2023...prince..

  static DoctoraboutusApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&drr:${userid}');
    print(userid);
    var url = "http://test.pswellness.in/api/DoctorApi/DoctorAbout?Id=$userid";

    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        AboutUsModelDoctor? doctorapaboutusmodel =
            aboutUsModelDoctorFromJson(r.body);
        return doctorapaboutusmodel;
      }
    } catch (error) {
      print("errordeeeedrfrrr:${error.toString()}");
      return;
    }
  }

  ///todo: nurse about us..........by nurse Id.......5...june.. 2023...prince..

  static NurseaboutusApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&nurseabout:${userid}');
    print(userid);
    var url = "http://test.pswellness.in/api/NurseAPI/Nurse_About?Id=$userid";

    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        NurseaboutusModel nurseapaboutusmodel =
            nurseaboutusModelFromJson(r.body);
        return nurseapaboutusmodel;
      }
    } catch (error) {
      print("errornursedetailsshis:${error.toString()}");
      return;
    }
  }

  ///todo: user about us.................6..june.. 2023...prince..

  static UseraboutusApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&nurseabout:${userid}');
    print(userid);
    var url = "http://test.pswellness.in/api/PatientApi/User_About";

    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        UseraboutusModel userapaboutusmodel = useraboutusModelFromJson(r.body);
        return userapaboutusmodel;
      }
    } catch (error) {
      print("userabout:${error.toString()}");
      return;
    }
  }

  ///todo: aboutus.Rwa..........by lab Id.......3 june 2023...prince..

  static RwaaboutusApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labappointmenthistory:${userid}');
    print(userid);
    var url = "http://test.pswellness.in/api/PatientApi/RWA_About?Id=$userid";
    //http://test.pswellness.in/api/PatientApi/RWA_About?Id=12

    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        RwaaboutusModel? rwaapaboutusmodel = rwaaboutusModelFromJson(r.body);
        return rwaapaboutusmodel;
      }
    } catch (error) {
      print("errorlabdetailsshisfdfd:${error.toString()}");
      return;
    }
  }

  ///todo: chemist aboutus history.......by lab Id.......27 may 2023...prince..

  static ChemistboutusApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&chemistaboutus:${userid}');
    print(userid);
    var url =
        "http://test.pswellness.in/api/ChemistApi/ChemistAbout?Id=$userid";

    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        Chemistaboutus? chemistapaboutusmodel = chemistaboutusFromJson(r.body);
        return chemistapaboutusmodel;
      }
    } catch (error) {
      print("errorlabdetailsshis:${error.toString()}");
      return;
    }
  }

  /// todo LAb Signup api..........rahul .............
  static LabSignupApi(
    var LabName,
    var EmailId,
    var Password,
    var ConfirmPassword,
    var MobileNumber,
    var PhoneNumber,
    var Location,
    var StateMaster_Id,
    var CityMaster_Id,
    var LicenceNumber,
    var LicenceImage,
    var LicenceImageBase64,
    var PanImage,
    var PanImageBase64,
    var StartTime,
    var EndTime,
    var GSTNumber,
    var AadharNumber,
    var PinCode,
  ) async {
    var url = baseUrl + 'api/SignupApi/LabRegistration';
    var body = {
      "LabName": LabName,
      "EmailId": EmailId,
      "Password": Password,
      "ConfirmPassword": ConfirmPassword,
      "MobileNumber": MobileNumber,
      "PhoneNumber": PhoneNumber,
      "Location": Location,
      "StateMaster_Id": StateMaster_Id,
      "CityMaster_Id": CityMaster_Id,
      "LicenceNumber": LicenceNumber,
      "LicenceImage": "${LicenceImage}",
      "LicenceImageBase64": "${LicenceImageBase64}",
      "PanImage": "${PanImage}",
      "PanImageBase64": "${PanImageBase64}",
      "StartTime": "09:30:00.0000000",
      "EndTime": "21:40:00.0000000",
      "GSTNumber": GSTNumber,
      "AadharNumber": AadharNumber,
      "PinCode": PinCode,
    };

    http.Response r = await http.post(Uri.parse(url), body: body);
    print("Lab Signup Api: ${body}");
    if (r.statusCode == 200) {
      Get.snackbar('message', r.body);
      return r;
    } else {
      Get.snackbar('Error', r.body);
      print("Errorlabsignup: ${r.body}");
      return r;
    }
  }

  ///todo:this is the lab upload report api...26 april 2023...............
  static labuploadreportApi(
    var Patient_Id,
    var Test,
    var File,
    var FileBase64,
  ) async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labusereport:${userid}');
    print(userid);
    var body = {
      "Lab_Id": userid,
      "Patient_Id": Patient_Id,
      "Test": Test,
      "File": '$File',
      "FileBase64": '$FileBase64',
    };
    try {
      var url = baseUrl + 'api/LabApi/Lab_UploadReport';
      var r = await http.post(Uri.parse(url), body: body);
      if (r.statusCode == 200) {
        print("###3###3####1: ${r.body}");
        print("okokolanreportii: ${body}");

        return r;
      } else {
        CallLoader.hideLoader();
        Get.snackbar('Error', r.body);
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }

  ///todo:this is the nurse  upload report api...5  2023...............
  static nurseuploadreportApi(
    var Patient_Id,
    var File,
    var FileBase64,
  ) async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labusereport:${userid}');
    print(userid);
    var body = {
      "Nurse_Id": userid,
      "Patient_Id": Patient_Id,
      "File": '$File',
      "FileBase64": '$FileBase64',
    };
    try {
      var url = baseUrl + 'api/NurseAPI/Nurse_UploadReport';
      var r = await http.post(Uri.parse(url), body: body);
      if (r.statusCode == 200) {
        print("###3###3####1: ${r.body}");
        print("okokolanreportii: ${body}");

        return r;
      } else {
        CallLoader.hideLoader();
        Get.snackbar('Error', r.body);
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }

  ///todo:this is the doctor  upload report api...5  2023...............
  static doctorruploadreportApi(
    var Patient_Id,
    var Image1,
    var Image1Base64,
  ) async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&doctorusereport:${userid}');
    print(userid);
    var body = {
      "Doctor_Id": userid,
      "Patient_Id": Patient_Id,
      "Image1": '$Image1',
      "Image1Base64": '$Image1Base64',
    };
    try {
      var url = baseUrl + 'api/DoctorApi/Doctor_UploadReport';
      var r = await http.post(Uri.parse(url), body: body);
      if (r.statusCode == 200) {
        print("###3###3####1: ${r.body}");
        print("okokolanreportii: ${body}");

        return r;
      } else {
        CallLoader.hideLoader();
        Get.snackbar('Error', r.body);
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }

  ///todo:upload report..user.of......getapidropdown...15 may...2023..
  ///
  static Future<List<PatientdropdownName>?> getlabpatientApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labusereport:${userid}');
    print(userid);
    var url = baseUrl + "api/CommonApi/Lab_report?Id=$userid";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var patienttypeData = uploadReportdropdownModelFromJson(r.body);
        return patienttypeData.patientName;
      } else {
        return [];
      }
    } catch (error) {
      print("errorlabbbviewpatient:${error.toString()}");
      return [];
    }
  }

  ///todo:upload report.doctor.of......getapidropdown...8 june...2023..
  ///
  static Future<List<PatientDropdownDoctorName>?> getdoctorpatientApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&doctorereport:${userid}');
    print(userid);
    var url = baseUrl + "api/DoctorApi/DoctorPatientList?Id=$userid";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var patienttypeData = patientlistDoctorModelFromJson(r.body);
        return patienttypeData.patientName;
      } else {
        return [];
      }
    } catch (error) {
      print("errorlabbbxdasdviewpatient:${error.toString()}");
      return [];
    }
  }

  ///todo:upload report.nurse.user.of......getapidropdown...3..june...2023..
  ///
  static Future<List<PatientNameNurse>?> getnursepatientApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&doctorereport:${userid}');
    print(userid);
    var url = baseUrl + "api/NurseAPI/NursePatientList?Id=$userid";

    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      print("bodynursurl:${url}");

      if (r.statusCode == 200) {
        var patientdropdownnurse = patientlistNurseModelFromJson(r.body);
        print("bodynurseeee:${r.body}");

        return patientdropdownnurse.patientName;
      } else {
        return [];
      }
    } catch (error) {
      print("errorlabbbviewpatient:${error.toString()}");
      return [];
    }
  }

  ///todo:report view lab.................15 may 2023..

  static Labreportview1Api() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labuserrrview:${userid}');
    print(userid);
    var url = "http://test.pswellness.in/api/LabApi/Lab_ViewReport?Id=$userid";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print('&&&&&&&&&&&&&&&&&&&&&&labimageurl:${url}');
        ViewreportModel? labreportModel = viewreportModelFromJson(r.body);
        return labreportModel;
      }
    } catch (error) {
      print("errorlabbbview:${error.toString()}");
      return;
    }
  }

  ///todo:report view lab.................15 june 2023..

  static Labreportuserview1Api() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labuserrrview:${userid}');
    print(userid);
    var url =
        "http://test.pswellness.in/api/PatientApi/ViewLabReportByPatient?PatientId=$userid";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print('&&&&&&&&&&&&&&&&&&&&&&labimageurl:${url}');
        LabReportUserList? labuserreportModel =
            labReportUserListFromJson(r.body);
        return labuserreportModel;
      }
    } catch (error) {
      print("errorlabbbview:${error.toString()}");
      return;
    }
  }

  ///todo:report view lab.................15 june 2023..

  static Nurseportuserview1Api() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&nurseuserrrview:${userid}');
    print(userid);
    var url =
        "http://test.pswellness.in/api/PatientApi/NurseViewReportByPatient?PatientId=$userid";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print('&&&&&&&&&&&&&&&&&&&&&&nurseimageurl:${url}');
        NurseReportUserListView? nurseeuserreportModel =
            nurseReportUserListViewFromJson(r.body);
        return nurseeuserreportModel;
      }
    } catch (error) {
      print("errornursebview:${error.toString()}");
      return;
    }
  }

  ///todo:report view doctor.................15 june 2023....

  static Doctorreportuserview1Api() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&doctoruserrrview:${userid}');
    print(userid);
    var url =
        "http://test.pswellness.in/api/PatientApi/DoctorViewReportByPatient?PatientId=$userid";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print('&&&&&&&&&&&&&&&&&&&&&&doctorimageurl:${url}');
        print('&&&&&&&&&&&&&&&&&&&&&&doctorimagebdy:${r.body}');

        DoctorReportUserList? doctoruserreportModel =
            doctorReportUserListFromJson(r.body);
        return doctoruserreportModel;
      }
    } catch (error) {
      print("errordoctorbbview:${error.toString()}");
      return;
    }
  }

  ///todo:report view nurse.................3june---2023..

  static Nursereportview1Api() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labuserrrview:${userid}');
    print(userid);

    var url =
        "http://test.pswellness.in/api/NurseAPI/Nurse_ViewReport?Id=$userid";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print('&&&&&&&&&&&&&&&&&&&&&&nurseimageurl:${url}');
        NurseViewReportModel nursereportModel =
            nurseViewReportModelFromJson(r.body);
        return nursereportModel;
      }
    } catch (error) {
      print("errornurseview:${error.toString()}");
      return;
    }
  }

  ///todo:report view doctor.................3june---2023..
  static Doctorreportview1Api() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labuserrrview:${userid}');
    print(userid);
    var url =
        //'http://test.pswellness.in/api/DoctorApi/Doctor_ViewReport?Id=146'
        "http://test.pswellness.in/api/DoctorApi/Doctor_ViewReport?Id=$userid";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print('&&&&&&&&&&&&&&&&&&&&&&nurseimageurl:${url}');
        DoctorViewReportModel doctorreportModel =
            doctorViewReportModelFromJson(r.body);
        return doctorreportModel;
      }
    } catch (error) {
      print("errornurseview:${error.toString()}");
      return;
    }
  }

  ///todo:report view user lab.................16 june 2023..
  static LabreportimageApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var labreportlistId = preferences.getString("labreportlistId");
    print("labreportlistlisttIdhh: ${labreportlistId}");
    var url =
        "http://test.pswellness.in/api/LabApi/Lab_ViewReport_File?Id=$labreportlistId";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("labreportlistlistturl: ${url}");
        LabReportimage? labreportimageModel = labReportimageFromJson(r.body);
        return labreportimageModel;
      }
    } catch (error) {
      print("errorlabbbviewimage:${error.toString()}");
      return;
    }
  }

  ///todo:report view lab.................15 jun 2023..
  static LabuserreportimageApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var labuserreportlistId = preferences.getString("labuserreportlistId");
    print("labuserreportlistId: ${labuserreportlistId}");
    //http://test.pswellness.in/api/PatientApi/LabReport_File?Id=21
    var url =
        "http://test.pswellness.in/api/PatientApi/LabReport_File?Id=$labuserreportlistId";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("labreportlistlistturleee44: ${url}");
        LabReportUserImage? labuserreportimageModel =
            labReportUserImageFromJson(r.body);
        return labuserreportimageModel;
      }
    } catch (error) {
      print("errorlabbbviewimage3:${error.toString()}");
      return;
    }
  }

  ///todo:report view nurse.................15 jun 2023..
  static NurseuserreportimageApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var nurseuserreportlistId = preferences.getString("nurseuserreportlistId");
    print("nurseuserreportlistId: ${nurseuserreportlistId}");
    //http://test.pswellness.in/api/PatientApi/LabReport_File?Id=21
    var url =
        "http://test.pswellness.in/api/NurseAPI/Nurse_ViewReport_File?Id=$nurseuserreportlistId";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("nursereportlistlistturleee44: ${url}");
        NurseReportUserImageView? nurseuserreportimageModel =
            nurseReportUserImageViewFromJson(r.body);
        return nurseuserreportimageModel;
      }
    } catch (error) {
      print("errornursebbviewimage3:${error.toString()}");
      return;
    }
  }

  ///todo:report view lab.................15 june 2023..
  static DoctoruserreportimageApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var doctoruserreportlistId =
        preferences.getString("doctoruserreportlistId");
    print("doctoruserreportlistId: ${doctoruserreportlistId}");
    //http://test.pswellness.in/api/PatientApi/LabReport_File?Id=21
    var url =
        "http://test.pswellness.in/api/PatientApi/DoctorViewReportFile?Id=$doctoruserreportlistId";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("labreportlistlistturleee4334: ${url}");
        DoctorReportUserImageView? doctoruserreportimageModel =
            doctorReportUserImageViewFromJson(r.body);
        return doctoruserreportimageModel;
      }
    } catch (error) {
      print("errorlabbbviewimage333:${error.toString()}");
      return;
    }
  }

  ///todo:report view nurse.................5 june may 2023..
  static nursereportimageApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var nursereportlistId = preferences.getString("nursereportlistId");
    print("nursereportlistId: ${nursereportlistId}");
    var url =
        "http://test.pswellness.in/api/NurseAPI/Nurse_ViewReport_File?Id=$nursereportlistId";
    //"$nursereportlistId";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("nurseimagereport: ${r.body}");
        print("labreportlistlistturl: ${url}");
        NurseImageviewModel? nursereportimageModel =
            nurseImageviewModelFromJson(r.body);
        return nursereportimageModel;
      }
    } catch (error) {
      print("errorlabbbviewimage:${error.toString()}");
      return;
    }
  }

  ///todo:report view doctor...............8 june may 2023..
  static doctorreportimageApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var doctorreportlistId = preferences.getString("doctorreportlistId");
    print("doctorreportlistId: ${doctorreportlistId}");
    var url =
        "http://test.pswellness.in/api/DoctorApi/Doctor_ViewReport_File?Id=$doctorreportlistId";
    //"$nursereportlistId";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("drrimagereport: ${r.body}");
        print("drrreportlistlistturl: ${url}");
        DoctorImageviewModel? doctorreportimageModel =
            doctorImageviewModelFromJson(r.body);
        return doctorreportimageModel;
      }
    } catch (error) {
      print("errordrrbbviewimage:${error.toString()}");
      return;
    }
  }

  ///todo: providers: 19 may 2023 prince review ,,from here new 3 api and this is from previous api providers not provider
  ///todo: this is the review rating post for nurse.....
  static postReviewRating(
    var Rating1,
    var Rating2,
    var Rating3,
    var Rating4,
    var Rating5,
    var Name,
    var Description,
    var pro_Id,
    var Image,
    var ImageBase,
    var Professional,
    //var Patient_Id,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var NurseuserListId = preferences.getString("NurseuserListId");
    print("nurseuserlistIdrriview: ${NurseuserListId}");

    ///
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labusereport:${userid}');
    print(userid);
    var body = {
      'Rating1': Rating1 ? "1" : "0",
      'Rating2': Rating2 ? "1" : "0",
      'Rating3': Rating3 ? "1" : "0",
      'Rating4': Rating4 ? "1" : "0",
      'Rating5': Rating5 ? "1" : "0",
      'Name': '$Name',
      'Description': '$Description',
      'ImageBase': '$ImageBase',
      'Image': '$Image',
      'pro_Id': '$NurseuserListId',
      'Professional': "Nurse",
      "Patient_Id": userid
    };

    try {
      var url = 'http://test.pswellness.in/api/PatientApi/DoctorRatingReview';
      var r = await http.post(Uri.parse(url), body: body);
      print("###3###3####1rrrerertt: ${body}");
      if (r.statusCode == 200) {
        print("###3###3####1rrr: ${r.body}");
        print('&&&&&&&&&&&&&&&&&&&&&&labusereportrerer:${userid}');
        //print("####userid: ${r.Patient_Id}");

        return r;
      } else {
        CallLoader.hideLoader();
        Get.snackbar('Error', r.body);
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
      print("###3###3####1error: ${e}");
    }
  }

  ///todo: this is the review rating post for doctor.....
  static postDoctorReviewRating(
    var Rating1,
    var Rating2,
    var Rating3,
    var Rating4,
    var Rating5,
    var Name,
    var Description,
    var pro_Id,
    var Image,
    var ImageBase,
    var Professional,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var DoctorListId = preferences.getString("DoctorListId");
    print("DoctorListId: ${DoctorListId}");

    ///
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labusereportdr:${userid}');
    var body = {
      'Rating1': Rating1 ? "1" : "0",
      'Rating2': Rating2 ? "1" : "0",
      'Rating3': Rating3 ? "1" : "0",
      'Rating4': Rating4 ? "1" : "0",
      'Rating5': Rating5 ? "1" : "0",
      'Name': '$Name',
      'Description': '$Description',
      'ImageBase': '$ImageBase',
      'Image': '$Image',
      'pro_Id': '$DoctorListId',
      'Professional': "Doctor",
      "Patient_Id": userid
    };

    try {
      var url = 'http://test.pswellness.in/api/PatientApi/DoctorRatingReview';
      var r = await http.post(Uri.parse(url), body: body);
      print("###3###3####1rrrererttdoctor: ${body}");
      if (r.statusCode == 200) {
        print("###3###3####1rrrddrr: ${r.body}");

        return r;
      } else {
        CallLoader.hideLoader();
        Get.snackbar('Error', r.body);
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
      print("###3###3####1errordrr: ${e}");
    }
  }

  ///todo: this is the review rating post for lab.....
  static postLabReviewRating(
    var Rating1,
    var Rating2,
    var Rating3,
    var Rating4,
    var Rating5,
    var Name,
    var Description,
    var pro_Id,
    var Image,
    var ImageBase,
    var Professional,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var LablistssId = preferences.getString("LablistssId");
    print("LablistssId: ${LablistssId}");
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labusereportdr:${userid}');
    var body = {
      'Rating1': Rating1 ? "1" : "0",
      'Rating2': Rating2 ? "1" : "0",
      'Rating3': Rating3 ? "1" : "0",
      'Rating4': Rating4 ? "1" : "0",
      'Rating5': Rating5 ? "1" : "0",
      'Name': '$Name',
      'Description': '$Description',
      'ImageBase': '$ImageBase',
      'Image': '$Image',
      'pro_Id': '$LablistssId',
      'Professional': "Lab",
      "Patient_Id": userid
    };

    try {
      var url = 'http://test.pswellness.in/api/PatientApi/DoctorRatingReview';
      var r = await http.post(Uri.parse(url), body: body);
      print("###3###3####1rrrererttdoctor: ${body}");
      if (r.statusCode == 200) {
        print("###3###3####ttdoctor: ${body}");
        print("###3###3####1rrrddrr: ${r.body}");

        return r;
      } else {
        CallLoader.hideLoader();
        Get.snackbar('Error', r.body);
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
      print("###3###3####1errordrr: ${e}");
    }
  }

  ///...post_health_chkp...api......

  ///todo: this is the review rating post for lab.....
  static postHealthchkpReviewRating(
    var Rating1,
    var Rating2,
    var Rating3,
    var Rating4,
    var Rating5,
    var Name,
    var Description,
    var pro_Id,
    var Image,
    var ImageBase,
    var Professional,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var HealthchkpListId = preferences.getString("HealthchkpListId");
    print("HealthchkpListId: ${HealthchkpListId}");
    var body = {
      'Rating1': Rating1 ? "1" : "0",
      'Rating2': Rating2 ? "1" : "0",
      'Rating3': Rating3 ? "1" : "0",
      'Rating4': Rating4 ? "1" : "0",
      'Rating5': Rating5 ? "1" : "0",
      'Name': '$Name',
      'Description': '$Description',
      'ImageBase': '$ImageBase',
      'Image': '$Image',
      'pro_Id': '$HealthchkpListId',
      'Professional': "HealthCheckup",
      "Patient_Id": userid
    };

    try {
      var url = 'http://test.pswellness.in/api/PatientApi/DoctorRatingReview';
      var r = await http.post(Uri.parse(url), body: body);
      print("###3###3####1rrrererttdoctor: ${body}");
      if (r.statusCode == 200) {
        print("###3###3####1rrrddrr: ${r.body}");

        return r;
      } else {
        CallLoader.hideLoader();
        Get.snackbar('Error', r.body);
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
      print("###3###3####1errordrr: ${e}");
    }
  }

  ///todo:view review nurse.....20 may 2023...

  static ViewnursereviiewApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var NurseuserListId = preferences.getString("NurseuserListId");
    print("NurseuserListId: ${NurseuserListId}");
    //NurseuserListId
    var url =
        "http://test.pswellness.in/api/PatientApi/GetTotalRating?pro_Id=$NurseuserListId&Professional=Nurse";
    // "http://test.pswellness.in/api/PatientApi/GETDoctorRatingReview?Professional=Nurse";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        NurseRatingView? nurseRatingViewmodel = nurseRatingViewFromJson(r.body);
        return nurseRatingViewmodel;
      }
    } catch (error) {
      print("errorlabdetailsshisnurse:${error.toString()}");
      return;
    }
  }

  ///todo:view review doctor.....22 may 2023...

  static ViewDoctorreviewApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var DoctorListId = preferences.getString("DoctorListId");
    print("DoctorListId: ${DoctorListId}");
    // var url =
    //"http://test.pswellness.in/api/PatientApi/GetTotalRating?Professional=Doctor&Pro_Id=$DoctorListId";
    var url =
        "http://test.pswellness.in/api/PatientApi/GetTotalRating?Professional=Doctor&Pro_Id=$DoctorListId";

    //"http://test.pswellness.in/api/PatientApi/GETDoctorRatingReview?Professional=Doctor";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("printdrbodydr:${r.body}");
        DoctorRatingView? doctorRatingViewmodel =
            doctorRatingViewFromJson(r.body);
        return doctorRatingViewmodel;
      }
    } catch (error) {
      print("errorlabdetailssdoctor:${error.toString()}");
      return;
    }
  }

  ///todo:view review lab.....22 may 2023...

  static ViewLabreviewApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var LablistssId = preferences.getString("LablistssId");
    print("LablistssId: ${LablistssId}");
    var url =
        "http://test.pswellness.in/api/PatientApi/GetTotalRating?pro_Id=$LablistssId&Professional=Lab";
    // "http://test.pswellness.in/api/PatientApi/GETDoctorRatingReview?Professional=Lab";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("printdrbodydrlab:${r.body}");
        LabRatingView? labRatingViewmodel = labRatingViewFromJson(r.body);
        return labRatingViewmodel;
      }
    } catch (error) {
      print("errorlabdetailslabb:${error.toString()}");
      return;
    }
  }

  ///todo:view review doctor.....23 may 2023...

  static ViewHealthchkpreviewApi() async {
    var url =
        "http://test.pswellness.in/api/PatientApi/GETDoctorRatingReview?Professional=HealthCheckup";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("printdrbodyhealth:${r.body}");
        HealthchkpRatingView? healthchkpRatingViewmodel =
            healthchkpRatingViewFromJson(r.body);
        return healthchkpRatingViewmodel;
      }
    } catch (error) {
      print("errorlabdetailshealthchkp:${error.toString()}");
      return;
    }
  }

  ///.....chemist...
  static chemistProfileDetailApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labappointmenthistory:${userid}');
    print(userid);

    var url = '${baseUrl}api/ChemistApi/chemistprofiledetail?id=${userid}';
    //'$userid'; //22
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        print("urrllllrrr:${url}");
        final chemistProfileDetail = chemistProfileDetailFromJson(r.body);
        print("ChemistProfileDetail: ${chemistProfileDetail.chemistName}");
        return chemistProfileDetail;
      }
    } catch (error) {
      print('ChemistProfileDetailRRRErrorrr: ${error}');
      return;
    }
  }

  ///todo: accept ambulance api on of user.......14 july 2023.......,,,,,,.....................

  static AcceptrequestdriverApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var driacceptrejectlistid = preferences.getString("driacceptrejectlistid");
    print("driacceptrejectlistid: ${driacceptrejectlistid}");
    var url = '${baseUrl}api/DriverApi/BookingAmbulanceAcceptReject';
    // http://test.pswellness.in/api/DriverApi/BookingAmbulanceAcceptReject
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usergoogle:${userid}');

    var body = {
      "Id": "${driacceptrejectlistid}",
      "DriverId": userid,
      "StatusId": "${1}",

      ///for testing perpose i am....up...0
      ///

      ///this is the main actual down..1
      //"StatusId": "${1}",
    };
    //
    print("acceptttt:${body}");
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    //print(r.body);
    if (r.statusCode == 200) {
      ///ambulance..
      //saved id..........
      // var prefs = GetStorage();
      // prefs.write("ambulancetypeid".toString(),
      //     json.decode(r.body)['AmbulanceType_id']);
      // ambulancetypeid = prefs.read("AmbulanceType_id").toString();
      // print('&userdriambulance:${AmbulanceType_id}');

      print(r.body);
      print(r.statusCode);
      Get.snackbar("Booking Status", 'Request Accept Successfully');
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errorgoogle', r.body);
      return r;
    }
  }

  ///todo: reject ambulance api on of user.......14 july 2023.......,,,,,,.....................

  static RejectrequestdriverApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var driacceptrejectlistid = preferences.getString("driacceptrejectlistid");
    print("driacceptrejectlistid: ${driacceptrejectlistid}");
    var url = '${baseUrl}api/DriverApi/BookingAmbulanceAcceptReject';
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usergoogle:${userid}');

    var body = {
      "Id": "${driacceptrejectlistid}",
      "DriverId": userid,
      "StatusId": "${0}",
    };
    //
    print("rejectt:${body}");
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    //print(r.body);
    if (r.statusCode == 200) {
      ///ambulance..
      //saved id..........
      // var prefs = GetStorage();
      // prefs.write("ambulancetypeid".toString(),
      //     json.decode(r.body)['AmbulanceType_id']);
      // ambulancetypeid = prefs.read("AmbulanceType_id").toString();
      // print('&userdriambulance:${AmbulanceType_id}');

      print(r.body);
      print(r.statusCode);
      Get.snackbar("Booking Status", 'Request Reject Successfully');
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errorgoogle', r.body);
      return r;
    }
  }

  ///todo: accepted driver list  17 july 2023....user api...
  static AcceptDriverDetailUserApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var driverlistbookingId = preferences.getString("driverlistbookingId");
    print("driverlistbookingId: ${driverlistbookingId}");
    //driverlistbookingId
    var url =
        '${baseUrl}api/DriverApi/GetAcceptedReqDriverDetail?Id=$driverlistbookingId';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        print("ambulanceonlinerrreeeww:${r.body}");
        print("ambulanceonlinerrreeeww:${url}");

        DriveracceptModeluser driveracceptuserDetail =
            driveracceptModeluserFromJson(r.body);
        return driveracceptuserDetail;
      }
    } catch (error) {
      return;
    }
  }

  ///ambulance_paynow.ONLINE.lab....api..of...user........29 april 2023...........

  static AmbulancepaynowOnlineApi() async {
    var url = baseUrl + 'api/DriverApi/DriverPayNow';
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&user:${userid}');

    SharedPreferences preferences = await SharedPreferences.getInstance();
    var driverlistssId = preferences.getString("driverlistssId");
    print("driverlistssId: ${driverlistssId}");
    //doctor fees.....
    var drivertotalamount = preferences.getString("drivertotalamount");
    print("drivertotalamount: ${drivertotalamount}");

    //Labfeess......

    var body = {
      "PatientId": userid,
      "Driver_Id": "$driverlistssId",
      "Amount": "$drivertotalamount",
    };
    print("ambulanceonline444:${body}");

    // print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId
      print("ambulanceonline:${body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error1088', r.body);
      return r;
    }
  }
  //http://test.pswellness.in/api/LabApi/LabUpdateProfiledetail?Id=16

}
//$nurseLocationId
