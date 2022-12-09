// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:flutter_lab_4/main.dart';

ListView Category(data) {
  Shop items = data.data;
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    shrinkWrap: true,
    itemCount: items.categories == null ? 0 : items.categories!.length,
    itemBuilder: (context, index) {
      return Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(20, 0, 0, 0),
                    blurRadius: 10,
                    offset: Offset(0, 6),),],
                // border: Border.all(width: 1),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                height: 50,
                width: 50,
                child: Center(
                  child: Image.network(
                    items.categories![index].icon.toString(),
                    width: 35,
                    // height: 20,
                    fit: BoxFit.cover,),),)),
          SizedBox(height: 10,),
          Text(items.categories![index].title.toString(), style: TextStyle(fontSize: 11),),],
      );
    },
  );
}
