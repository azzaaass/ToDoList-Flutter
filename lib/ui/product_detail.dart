import 'package:flutter/material.dart';

class ProdukDetail extends StatefulWidget {
  final String? kodeProduk;
  final String? namaProduk;
  final int? harga;

  const ProdukDetail({super.key, this.kodeProduk, this.namaProduk, this.harga});

  @override
  State<ProdukDetail> createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
      ),
      body: Column(
        children: [
          Text("Kode produk : " + widget.kodeProduk.toString()),
          Text("Kode produk : " + widget.namaProduk.toString()),
          Text("Kode produk : " + widget.harga.toString()),
        ],
      ),
    );
  }
}