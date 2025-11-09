import 'package:flutter/material.dart';
import 'package:product_list/product_list_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text('Cart')),
      body: Consumer<ProductListProvider>(
        builder: (context, provider, _) {
          return ListView.builder(
            itemCount: provider.cartList.length,
            itemBuilder: (context, index) {
              final product = provider.cartList[index];
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
                    ListTile(
                      leading: Image.asset(product.image),
                      title: Text(product.name),
                      subtitle: Text(product.price),
                      trailing: IconButton(
                        onPressed: () {
                          context.read<ProductListProvider>().removeFromCart(
                            product,
                          );
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
