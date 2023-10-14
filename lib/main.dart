import 'package:flutter/material.dart';
import 'package:learn_flutter_basic/jokiw/azza%20t2/to_do_list.dart';
import 'package:learn_flutter_basic/jokiw/racel%20t2/todolistracel.dart';
import 'package:learn_flutter_basic/praktikum04/to_do_list_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoList(),
    );
  }
} 
