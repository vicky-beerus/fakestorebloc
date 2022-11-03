import 'package:flutter/material.dart';

class ProductModel {
  String? productName;
  double? productPrice;
  String? productImage;

  ProductModel({this.productName, this.productPrice, this.productImage});

  factory ProductModel.fromJson(json) => ProductModel(
      productName: json[0]["title"],
      productPrice: json[0]["price"],
      productImage: json[0]["image"]);

  Map<String, dynamic> toJson() => {
        "productName": productName,
        "productPrice": productPrice,
        "productImage": productImage,
      };
}
