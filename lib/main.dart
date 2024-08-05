import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'profile_page.dart'; // Importar a tela de perfil

void main() {
  runApp(LojaHardwareApp());
}


class LojaHardwareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja de Hardware',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loja de Hardware'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          HeroSection(),
          FeaturedProductsSection(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrinho',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
        ],
        selectedItemColor: Colors.orange,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      color: Colors.grey[900],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Bem-vindo à Loja de Hardware',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Os melhores produtos de hardware para você!',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {},
            child: Text('Ver Produtos'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturedProductsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Produtos em Destaque',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                ProductCard(
                  imageUrl: 'img/gtx4090ti.png',
                  title: 'GTX4090ti',
                  description: 'A RTX 4090 é uma placa de vídeo de alto desempenho desenvolvida pela Nvidia. Construída na nova arquitetura Lovelace, a GPU conta com 16.384 núcleos CUDA, 128 núcleos de Ray Tracing e 512 núcleos Tensor.',
                  price: 10.0,
                ),
                ProductCard(
                  imageUrl: 'img/rtx2060.png',
                  title: 'rtx2060.png',
                  description: 'A placa de vídeo RTX 2060 possui 6 GB de memória GDDR6 e é capaz de processar até 240 núcleos de tensor para acelerar as tarefas de aprendizado de máquina.',
                  price: 20.0,
                ),
                ProductCard(
                  imageUrl: 'img/rx5600.jpg',
                  title: 'rx5600',
                  description: 'Placa de vídeo AMD Radeon RX 5600 XT, interface PCI Express x16, clock Boost até 1.620MHz, memória padrão GDDR6 de 6GB, interface de memória 192-bits, 3x DisplayPort, 1x HDMI.',
                  price: 15.0,
                ),
                // Adicione mais produtos conforme necessário
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double price;

  ProductCard({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      width: 150.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(imageUrl, fit: BoxFit.cover),
          SizedBox(height: 10.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            description,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              // Adicionar produto ao carrinho
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('$title adicionado ao carrinho!'),
              ));
            },
            child: Text('Comprar'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
