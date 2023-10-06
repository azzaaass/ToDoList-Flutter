import 'package:flutter/material.dart';
import 'package:learn_flutter_basic/ui/product_form.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({super.key});

  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Produk"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProdukForm()));
            },
          )
        ],
      ),
      body: ListView(
        children: const [
          Card(
            child: ListTile(
              title: Text("Kulkas"),
              subtitle: Text("250000"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Tv"),
              subtitle: Text("25000"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Mesin Cuci"),
              subtitle: Text("2500"),
            ),
          ),
        ],
      ),
    );
  }
}
