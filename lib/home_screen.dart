import 'package:flutter/material.dart';
import 'package:product_list/product_list_provider.dart';
import 'package:provider/provider.dart';

import 'cart_screen.dart';
import 'product_list_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          Consumer<ProductListProvider>(
            builder: (context, provider, _) {
              return Badge(
                label: Text(
                  provider.cartItemCount.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(1),

                child: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
                  },
                  icon: Icon(Icons.add_shopping_cart, color: Colors.white),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ProductListProvider>(
          builder: (context, provider, _) {
            return GridView.builder(
              itemCount: provider.productsList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                final product = provider.productsList[index];
                final isProductInCart = provider.isProductInCart(product);
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 3,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Text(
                        product.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        product.price,
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                      FilledButton(
                        onPressed: () {
                          if (isProductInCart) {
                            context.read<ProductListProvider>().removeFromCart(
                                  product,
                                );
                            return;
                          } else {
                            context.read<ProductListProvider>().addToCart(
                                  product,
                                );
                          }
                        },
                        child: Text(isProductInCart ? 'Remove' : 'Add to Cart'),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
