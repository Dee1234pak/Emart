
class Product {
  final String name;
  final String description;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

List<Product> getRecommendedProducts() {
  return [
    Product(
      name: 'Watch',
      description: 'this is a new watch with 5 star',
      imageUrl: 'https://th.bing.com/th/id/R.135b6cea008c8f78fab59819b0e2bc9c?rik=ZJMsQFJYNf9CnQ&riu=http%3a%2f%2fpngimg.com%2fuploads%2fwatches%2fwatches_PNG101423.png&ehk=7oTNnIsR%2fgpcb8VXjfPSb8V%2bQ35anzK5W8RBOAlU65A%3d&risl=&pid=ImgRaw&r=0',
    ),
    // Product(
    //   name: 'Product B',
    //   description: 'Description for Product B',
    //   imageUrl: 'https://example.com/productB.jpg',
    // ),
    // Product(
    //   name: 'Product C',
    //   description: 'Description for Product C',
    //   imageUrl: 'https://example.com/productC.jpg',
    // ),
    // Add more products as needed
  ];
}
