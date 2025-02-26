import 'package:fake_store_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Image.network(
          product.image,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: const Text('상품 이름'),
        subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      ),
    );
  }
}
