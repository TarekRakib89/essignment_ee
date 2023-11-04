import 'dart:convert';

import 'package:essignment_ee/model/product.dart';
import 'package:essignment_ee/screen/product_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<Product> productList = [];

  void getData() async {
    http.Response res = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/photos"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (res.statusCode == 200) {
      for (int i = 0; i < jsonDecode(res.body).length; i++) {
        productList.add(
          Product.fromJson(
            jsonEncode(
              jsonDecode(res.body)[i],
            ),
          ),
        );
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo GaLLery App"),
      ),
      body: ListView.separated(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PrdouctDetails(
                          product: productList[index],
                        )),
              );
            },
            leading: Image.network(
              productList[index].url,
              width: 100,
            ),
            title: Text(productList[index].title),
          );
        },
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
