import 'package:fake_store_app/widgets/quantity_selector.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../services/api_service.dart';

class ProductDetailScreen extends StatefulWidget {
  final int productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late Future<Product> product;

  @override
  void initState() {
    super.initState();
    // getProduct로 특정 id의 상품 정보를 불러옴
    product = ApiService().getProduct(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('상품 상세')),
      body: FutureBuilder(
        future: product,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}, 상품을 불러오는 중에 오류가 발생했습니다.'),
            );
          }
          // 상품 상세
          return _buildProductDetail(snapshot.data as Product);
        },
      ),
    );
  }

  Widget _buildProductDetail(Product data) {
    return SingleChildScrollView(
      // 화면이 깨지지 않도록 스크롤 지원
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
          children: [
            Image.network(
              data.image,
              width: double.infinity,
              height: 300,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Text(
              data.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${data.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 8),
            Text(data.description),
            const SizedBox(height: 8),

            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(height: 4),
                Text(
                  '${data.rating['rate']} (${data.rating['count']})',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),

                // 수량 선택
                QuantitySelector(),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {},
                    child: const Text(
                      '장바구니에 담기',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
