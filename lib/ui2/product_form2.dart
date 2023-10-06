import 'package:flutter/material.dart';
import 'package:learn_flutter_basic/ui2/product_detail.dart';

class ProductForm2 extends StatefulWidget {
  const ProductForm2({super.key});

  @override
  State<ProductForm2> createState() => _ProductForm2State();
}

class _ProductForm2State extends State<ProductForm2> {
  final _kodeProductTextBoxController = TextEditingController();
  final _namaProductTextBoxController = TextEditingController();
  final _hargaProductTextBoxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _textBoxKodeProduct(),
        _textBoxNamaProduct(),
        _textBoxHargaProduct(),
        _tombolSimpan(),
      ],
    );
  }

  _textBoxKodeProduct() {
    return TextField(
      decoration: const InputDecoration(labelText: "Kode Produk"),
      controller: _kodeProductTextBoxController,
    );
  }

  _textBoxNamaProduct() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Produk"),
      controller: _namaProductTextBoxController,
    );
  }

  _textBoxHargaProduct() {
    return TextField(
      decoration: const InputDecoration(labelText: "Harga Produk"),
      controller: _hargaProductTextBoxController,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        String kodeProduk = _kodeProductTextBoxController.text;
        String namaProduk = _namaProductTextBoxController.text;
        int harga = int.parse(_hargaProductTextBoxController.text);

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ProductDetail2(
              harga: harga, kodeProduk: kodeProduk, namaProduk: namaProduk,
            )));
      },
      child: const Text("Simpan"),
    );
  }
}
