
import 'package:flutter/material.dart';
import 'package:world/screen/product.dart';

class RecommendationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Product> recommendedProducts = getRecommendedProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text('Recommended Products'),
      ),
      body: ListView.builder(
        itemCount: recommendedProducts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(recommendedProducts[index].imageUrl),
              ),
              title: Text(recommendedProducts[index].name),
              subtitle: Text(recommendedProducts[index].description),
              onTap: () {
                // Handle tap on a product (if needed)
              },
            ),
          );
        },
      ),
    );
  }
}
