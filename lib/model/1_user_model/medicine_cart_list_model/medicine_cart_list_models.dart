// To parse this JSON data, do
//
//     final medicineCartListModel = medicineCartListModelFromJson(jsonString);

import 'dart:convert';

MedicineCartListModel medicineCartListModelFromJson(String str) =>
    MedicineCartListModel.fromJson(json.decode(str));

String medicineCartListModelToJson(MedicineCartListModel data) =>
    json.encode(data.toJson());

class MedicineCartListModel {
  MedicineCartListModel({
    required this.medicineCartDetail,
  });

  MedicineCartDetail medicineCartDetail;

  factory MedicineCartListModel.fromJson(Map<String, dynamic> json) =>
      MedicineCartListModel(
        medicineCartDetail:
            MedicineCartDetail.fromJson(json["MedicineCartDetail"]),
      );

  Map<String, dynamic> toJson() => {
        "MedicineCartDetail": medicineCartDetail.toJson(),
      };
}

class MedicineCartDetail {
  MedicineCartDetail({
    required this.totalProductsInCart,
    required this.grandTotal,
    required this.medicineCart,
  });

  int totalProductsInCart;
  double grandTotal;
  List<MedicineCart> medicineCart;

  factory MedicineCartDetail.fromJson(Map<String, dynamic> json) =>
      MedicineCartDetail(
        totalProductsInCart: json["TotalProductsInCart"],
        grandTotal: json["GrandTotal"],
        medicineCart: List<MedicineCart>.from(
            json["MedicineCart"].map((x) => MedicineCart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "TotalProductsInCart": totalProductsInCart,
        "GrandTotal": grandTotal,
        "MedicineCart": List<dynamic>.from(medicineCart.map((x) => x.toJson())),
      };
}

class MedicineCart {
  MedicineCart({
    required this.cartId,
    required this.medicineId,
    required this.medicineName,
    required this.brandName,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
  });

  int cartId;
  int medicineId;
  String medicineName;
  String brandName;
  int quantity;
  double unitPrice;
  double totalPrice;

  factory MedicineCart.fromJson(Map<String, dynamic> json) => MedicineCart(
        cartId: json["CartId"],
        medicineId: json["Medicine_Id"],
        medicineName: json["MedicineName"],
        brandName: json["BrandName"],
        quantity: json["Quantity"],
        unitPrice: json["UnitPrice"],
        totalPrice: json["TotalPrice"],
      );

  Map<String, dynamic> toJson() => {
        "CartId": cartId,
        "Medicine_Id": medicineId,
        "MedicineName": medicineName,
        "BrandName": brandName,
        "Quantity": quantity,
        "UnitPrice": unitPrice,
        "TotalPrice": totalPrice,
      };
}
