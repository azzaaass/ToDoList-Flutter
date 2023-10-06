import 'package:flutter/material.dart';
import 'package:learn_flutter_basic/ui/product_detail.dart';

class ProdukForm extends StatefulWidget {
  const ProdukForm({super.key});

  @override
  State<ProdukForm> createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _kodeProdukTextBoxController = TextEditingController();
  final _namaProdukTextBoxController = TextEditingController();
  final _hargaProdukTextBoxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Produk"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _textBoxKodeProduk(),
            _textBoxNamaProduk(),
            _textBoxHargaProduk(),
            _tombolSimpan(),
          ],
        ),
      ),
    );
  }

  _textBoxKodeProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: "Kode Produk"),
      controller: _kodeProdukTextBoxController,
    );
  }

  _textBoxNamaProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Produk"),
      controller: _namaProdukTextBoxController,
    );
  }

  _textBoxHargaProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: "Harga Produk"),
      controller: _hargaProdukTextBoxController,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () {
          String kodeProduk = _kodeProdukTextBoxController.text;
          String namaProduk = _namaProdukTextBoxController.text;
          int harga = int.parse(_hargaProdukTextBoxController.text);
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProdukDetail(
            kodeProduk: kodeProduk,
            namaProduk: namaProduk,
            harga: harga,
          )));
        },
        child: const Text("Simpan"));
  }
}
