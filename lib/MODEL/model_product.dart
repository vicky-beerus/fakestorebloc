import 'package:flutter/material.dart';

class ProductModel {
  String? productName;
  String? productPrice;
  String? productImage;

  ProductModel({this.productName, this.productPrice, this.productImage});

  factory ProductModel.fromJson(json) => ProductModel(
      productName: json["title"],
      productPrice: json["price"],
      productImage: json["image"]);

  Map<String, dynamic> toJson() => {
        "productName": productName,
        "productPrice": productPrice,
        "productImage": productImage,
      };
}
