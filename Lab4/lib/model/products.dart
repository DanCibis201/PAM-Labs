import 'package:flutter/material.dart';
import 'package:flutter_lab_4/main.dart';

GridView products(data) {
  Shop items = data.data;
  return GridView.builder(
    physics: ScrollPhysics(),
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 1 / 1.7,
    ),
    itemCount: items.products == null ? 0 : items.products!.length,
    itemBuilder: (context, index) {
      return Card(
        elevation: 0,
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Container(
          padding: const EdgeInsets.all(6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(3.0),
                        child: Image.network(
                          items.products![index].cover.toString(),),),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(7),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              height: 25,
                              width: 25,
                              child: const Center(
                                child: Icon(
                                  Icons.star_border_rounded,
                                  size: 18,),),),],),)],),
                  const SizedBox(height: 5),
                  Text(items.products![index].title.toString()),
                  Text(
                    items.products![index].sub_title.toString(),
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text("${items.products![index].price} ${items.products![index].currency}",
                    style: const TextStyle(color: Color.fromARGB(255, 0, 197, 105),),),],),],
          ),
        ),
      );
    },
  );
}
