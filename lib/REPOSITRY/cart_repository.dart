import "package:flutter/material.dart";


class CartRepository {

  List addCartProducts = [];


  Future loadCartItems()async{
    return addCartProducts;
  }


  addItemsCart({itemName})async{
 return addCartProducts.add(itemName);

 }

 removeItemsCart({itemIndex})async{

    return addCartProducts.remove(itemIndex);

 }

}