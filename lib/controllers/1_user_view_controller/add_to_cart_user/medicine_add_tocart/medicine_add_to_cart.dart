// import 'package:get/get.dart';
//
// import 'package:http/http.dart' as http;
// import 'package:ps_welness/servicess_api/api_services_all_api.dart';
//
// //import '../../../controllers/flash_sale_product_by_id_controllers/flash_product_by_id_controller.dart';
//
// class MedicineUserCartController extends GetxController {
//   //class CartController extends GetxController with StateMixin<CartListModel> {
//   RxBool isLoading = true.obs;
//   String cartlistid = '';
//   String productid = '';
//
//   // add  a dict  to store the products in the cart .
//
//   var _products = {}.obs;
//   int get count => _products.length;
//
//   ///
//
//   // void CartListgApi() async {
//   //   try {
//   //     isLoading(true);
//   //
//   //     cartListModel = await ApiProvider.GetCartApi();
//   //     if (cartListModel != null) {
//   //       //Get.to(() => ItemDetailss());
//   //       isLoading(false);
//   //
//   //       //Get.to(()=>Container());
//   //     }
//   //   } finally {
//   //     isLoading(false);
//   //   }
//   //   update();
//   // }
//
//   ///implement through Api in cart list get.........
//
//   // CartListModel? cartListModel;
//   // //late final CartListModel cartListModel;
//   //
//   // void CartListgApi() async {
//   //   isLoading(true);
//   //
//   //   cartListModel = await ApiProvider.GetCartApi();
//   //   if (cartListModel != null) {
//   //     //Get.to(() => ItemDetailss());
//   //     isLoading(false);
//   //
//   //     //Get.to(()=>Container());
//   //   }
//   // }
//
//   ///add to cart...api................
//
//   //var Id = '';
//
//   void addtocartApi(var PatientId,MedicineId,Quantity) async {
//     //CallLoader.loader();
//     isLoading(true);
//     http.Response r = await ApiProvider.AddToCartMedicineApi(PatientId,MedicineId,Quantity);
//
//     if (r.statusCode == 200) {
//       CartListgApi();
//
//
//       ///TODO: we can navigate directly this page through this navigation with add to cart with Id.
//       Get.to(
//             () => Cartproducts(), //next page class
//         duration: Duration(
//             milliseconds: 300), //duration of transitions, default 1 sec
//         transition:
//         // Transition.leftToRight //transition effect
//         // Transition.fadeIn
//         //Transition.size
//         Transition.zoom,
//       );
//
//       //CallLoader.hideLoader();
//       //isLoading(false);
//     }
//   }
//
//   ///no of cart item...get api...........
//
//   // NoOfCartModel? NoOfcartitem;
//   //
//   // void cartlistnoApi() async {
//   //   isLoading(false);
//   //
//   //   NoOfcartitem = await ApiProvider.NoOfCartApi();
//   //   if (NoOfcartitem != null) {
//   //     //Get.to(() => ItemDetailss());
//   //     isLoading(false);
//   //
//   //     //Get.to(()=>Container());
//   //   }
//   // }
//
//   ///increment plus add to cart......post api........
//
//   // void pluscartApi(var Id) async {
//   //   //CallLoader.loader();
//   //   http.Response r = await ApiProvider.cartplusApi(Id);
//   //
//   //   if (r.statusCode == 200) {
//   //     CallLoader.hideLoader();
//   //     CartListgApi();
//   //
//   //     //Get.to(() => Cartproducts());
//   //   }
//   // }
//
//   ///decrenment minus add to cart......post api........
//   //
//   // void minuscartApi(var Id) async {
//   //   //CallLoader.loader();
//   //   http.Response r = await ApiProvider.cartminusApi(Id);
//   //   if (r.statusCode == 200) {
//   //     // CallLoader.hideLoader();
//   //     CartListgApi();
//   //     //Get.to(() => Cartproducts());
//   //   }
//   // }
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     //CartListgApi();
//     //cartlistnoApi();
//     //addtocartApi();
//   }
//
//   @override
//   void dispose() {
//     Get.delete<CartController>();
//     super.dispose();
//   }
//
//   ///......................................................
//
//   ///
//
//   void addProduct(Productss product) {
//     if (_products.containsKey(product)) {
//       _products[product] += 1;
//     } else {
//       _products[product] = 1;
//     }
//     Get.snackbar(
//       "Product Added",
//       "You have added the ${product.name} to the cart ",
//       snackPosition: SnackPosition.BOTTOM,
//       duration: Duration(seconds: 2),
//     );
//   }
//
//   void removeProduct(Productss product) {
//     if (_products.containsKey(product) && _products[product] == 1) {
//       _products.removeWhere((key, value) => key == product);
//     } else {
//       _products[product] -= 1;
//     }
//   }
//
//   //get products
//   get products => _products;
//
//   //get productSubtotal
//
//   get productSubtotal => _products.entries
//       .map((product) => product.key.price * product.value)
//       .toList();
//
//   //get total
//
//   get total => _products.entries
//       .map((product) => product.key.price * product.value)
//       .toList()
//       .reduce((value, element) => value + element)
//       .toStringAsFixed(2);
// }
