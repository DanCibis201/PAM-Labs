import 'package:flutter/material.dart';
import 'package:flutter_lab_4/model/products.dart';
import 'package:flutter_lab_4/model/categories.dart';
import 'package:flutter_lab_4/main.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: FutureBuilder(
          future: readJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              return ListView(
                padding: EdgeInsets.all(5),
                children: [
                  Text(" Categories", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 100,
                    child: Category(data),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(" Best Selling", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      Text("See all ", style: TextStyle(fontSize: 17),),],),
                  SizedBox(
                    child: products(data),),],);
            }
            else {
              return Center(
                child: CircularProgressIndicator(),);
            }}),
    );
  }
}









































// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables