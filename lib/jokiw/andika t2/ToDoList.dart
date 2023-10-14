import 'package:flutter/material.dart';

class MyToDoList extends StatefulWidget {
  const MyToDoList({super.key});

  @override
  State<MyToDoList> createState() => _MyToDoListState();
}

class _MyToDoListState extends State<MyToDoList> {
  List<String> list = <String>[];

  addData(String input) {
    setState(() {
      list.add(input);
    });
  }
  deleteData(int index) {
    setState(() {
      list.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _TextField(
              clickButton: (String input) {
                addData(input);
              },
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(list[index]),
                        trailing: IconButton(onPressed: (){
                          deleteData(index);
                        }, icon: Icon(Icons.delete)),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  final void Function(String) clickButton;
  TextEditingController textEditing = TextEditingController();

  _TextField({super.key, required this.clickButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                clickButton(textEditing.text);
              },
              icon: Icon(Icons.add)),
          // Text("ini text"),
          Expanded(child: TextField(
            controller: textEditing,
          )),
        ],
      ),
    );
  }
}
