import 'package:flutter/material.dart';

class PurchaseCompletePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compra Finalizada'),
      ),
      body: Center(
        child: Text(
          'Obrigado pela sua compra!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [];

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void _addItem(CartItem item) {
    setState(() {
      cartItems.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    double total = cartItems.fold(
      0,
      (sum, item) => sum + item.price * item.quantity,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho de Compras'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return CartItemWidget(
                    cartItem: cartItems[index],
                    onRemove: () => _removeItem(index),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Total: \$${total.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Redirecionar para a tela de compra finalizada
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PurchaseCompletePage()),
                );
              },
              child: Text('Finalizar Compra'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem {
  final String name;
  final double price;
  final int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onRemove;

  CartItemWidget({
    required this.cartItem,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  cartItem.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  'Quantidade: ${cartItem.quantity}',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
            Text(
              '\$${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            IconButton(
              icon: Icon(Icons.remove_shopping_cart, color: Colors.red),
              onPressed: onRemove,
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CartPage(),
  ));
}
