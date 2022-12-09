import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter_lab_4/screen/main_screen.dart';
import 'package:flutter/services.dart' as rootBundle;

void main() {
  runApp(const MyApp());
}

Future readJsonData() async {
  final jsonData = await rootBundle.rootBundle.loadString('lib/assets/shop.json');
  final list = json.decode(jsonData);
  return Shop.fromJson(list);
}

class Shop {
  List<Categories>? categories;
  List<Products>? products;

  Shop({this.categories, this.products});

  factory Shop.fromJson(Map<String, dynamic> json) {
    var list1 = json['categories'] as List;
    List<Categories> listCategories =
    list1.map((e) => Categories.fromJson(e)).toList();

    var list2 = json['products'] as List;
    List<Products> listProducts =
    list2.map((e) => Products.fromJson(e)).toList();

    return Shop(
      categories: listCategories,
      products: listProducts,
    );
  }
}

class Categories {
  String? title;
  String? icon;

  Categories({
    this.title,
    this.icon,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      title: json['title'],
      icon: json['icon'],
    );
  }
}

class Products {
  String? cover;
  String? title;
  String? sub_title;
  int? price;
  String? currency;

  Products({
    this.cover,
    this.title,
    this.sub_title,
    this.price,
    this.currency,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      cover: json['cover'],
      title: json['title'],
      sub_title: json['sub_title'],
      price: json['price'],
      currency: json['currency'],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Online Shop",
      home: MainScreen(),
    );
  }
}
