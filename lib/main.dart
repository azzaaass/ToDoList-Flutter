import 'package:flutter/material.dart';
import 'package:learn_flutter_basic/azza%20t2/to_do_list.dart';
import 'package:learn_flutter_basic/ui2/product_form2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TodoList()
    );
  }
  // _textField (String text) {
  //   return TextField(decoration: InputDecoration(labelText: text),);
  // }
} 


