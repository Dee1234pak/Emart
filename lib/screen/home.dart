import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:world/screen/product.dart';

class Home extends StatelessWidget {
  final User? user;

  const Home({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    List<Product> recommendedProducts = getRecommendedProducts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search button press
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome, ${user?.displayName ?? 'User'}!',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CardWithImage(
                imageUrl:
                "https://th.bing.com/th/id/R.a1b8b75fbde16a117d84114859fe779c?rik=8lc9Wv78hoOXyQ&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fclothing-hd-png-dress-shirt-png-image-798.png&ehk=Pkh8Jem6dS27er2FoJX02fzreCEKTb1xJNROUAzfyU0%3d&risl=&pid=ImgRaw&r=0",
              ),
              SizedBox(width: 8), // Add a small gap between images
              CardWithImage(
                imageUrl:
                "https://th.bing.com/th/id/OIP.xP47nWwfpDyUztYI5MPEZwHaHa?pid=ImgDet&w=166&h=166&c=7&dpr=1.3",
              ),
              SizedBox(width: 8), // Add a small gap between images
              CardWithImage(
                imageUrl:
                "https://th.bing.com/th/id/OIP.pqRT1s2VWLeH0eD6K8kLpQHaHa?rs=1&pid=ImgDetMain",
              ),
              SizedBox(width: 8), // Add a small gap between images
              CardWithImage(
                imageUrl:
                "https://th.bing.com/th/id/OIP.LVSFBMQhaHGoiAIaIniWpQAAAA?w=230&h=195&rs=1&pid=ImgDetMain",
              ),
              SizedBox(width: 8), // Add a small gap between images
              CardWithImage(
                imageUrl:
                "https://th.bing.com/th/id/R.8bc86e6e6816ef4c8ce2699ddeef2ae7?rik=4B6tyELzKyXEjg&riu=http%3a%2f%2fbrain-images.cdn.dixons.com%2f9%2f3%2f10132639%2fu_10132639.jpg&ehk=fNoSSomoeB5V8yjCNr38qB5Obv8DXxcLbXOXMQqucjA%3d&risl=&pid=ImgRaw&r=0",
              ),
            ],
          ),
          const SizedBox(height: 16), // Add some spacing
          const Text(
            'Recommended Products',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          // Display recommended products directly on the home page
          Expanded(
            child: ListView.builder(
              itemCount: recommendedProducts.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                      NetworkImage(recommendedProducts[index].imageUrl),
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
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<Product> allProducts = getRecommendedProducts(); 

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Product> searchResults = allProducts
        .where((product) =>
        product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(searchResults[index].imageUrl),
            ),
            title: Text(searchResults[index].name),
            subtitle: Text(searchResults[index].description),
            onTap: () {
              // Handle tap on a product (if needed)
            },
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> searchResults = allProducts
        .where((product) =>
        product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index].name),
          onTap: () {
            // You can handle suggestion tap here
            showResults(context);
          },
        );
      },
    );
  }
}


class CardWithImage extends StatelessWidget {
  final String imageUrl;

  const CardWithImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(color: Colors.black),
      ),
      elevation: 5.0,
      child: Container(
        height: 110,
        width: 110,
        alignment: Alignment.center,
        child: Image.network(
          imageUrl,
          height: 90,
          width: 90,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
