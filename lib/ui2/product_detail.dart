import 'package:flutter/material.dart';

class ProductDetail2 extends StatefulWidget {
  final String? kodeProduk;
  final String? namaProduk;
  final int? harga;

  const ProductDetail2(
      {super.key, this.kodeProduk, this.namaProduk, this.harga});

  @override
  State<ProductDetail2> createState() => _ProductDetail2State();
}

class _ProductDetail2State extends State<ProductDetail2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Text("Kode produk : " + widget.kodeProduk.toString()),
          Text("Nama produk : " + widget.namaProduk.toString()),
          Text("Harga produk : " + widget.harga.toString()),
        ],
      ),
    );
  }
}
