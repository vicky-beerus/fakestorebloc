import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../MODEL/model_product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductReposiry {

 List  cartItems = [];

  Future getProducts() async {
    final responce =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));

    if (responce.statusCode == 200) {
      return json.decode(responce.body);
    } else {
      throw Exception("failed");
    }
  }


  getCartItmes()=> Future.delayed(Duration(microseconds: 800),()=>cartItems);


  addItems(item)=> cartItems.add(item);


  removeItem(item)=> cartItems.remove(item);
}
