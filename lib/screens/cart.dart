import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Color.fromARGB(255, 41, 40, 40))),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 254, 245),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            const Divider(height: 4, color: Color.fromARGB(255, 113, 113, 113)),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.titleLarge;
    var cart = context.watch<CartProvider>();

    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(
            Icons.remove_circle_outline,
            color: Color.fromARGB(255, 237, 53, 62),
          ),
          onPressed: () {
            cart.remove(cart.items[index]);
          },
        ),
        title: Text(
          cart.items[index].name,
          style: itemNameStyle,
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CartProvider>(
                builder: (context, cart, child) => Text('₹${cart.totalPrice}',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 46,
                          color: const Color.fromARGB(255, 41, 40, 40),
                        ))),
            const SizedBox(width: 24),
            ElevatedButton(
              onPressed: () => _showPopup(context),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              child: const Text('BUY'),
            ),
          ],
        ),
      ),
    );
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Order Success", style: TextStyle(color: Color.fromARGB(255, 75, 189, 101)),),
          content: const Text("Your products are on the way!"),
          actions: [
            TextButton(
              child: const Text("Okay"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
