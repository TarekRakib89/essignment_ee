import 'package:essignment_ee/model/product.dart';
import 'package:flutter/material.dart';

class PrdouctDetails extends StatelessWidget {
  const PrdouctDetails({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product details"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                child: Image.network(product.url),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text("title:${product.title}"),
                  Text(
                    "Id:${product.id.toString()}",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
