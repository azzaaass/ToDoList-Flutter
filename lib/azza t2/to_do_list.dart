import 'package:flutter/material.dart';

typedef MyCallback = void Function(String);

TextStyle textStyleH1 = const TextStyle(
    fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white);
TextStyle textStyleP = const TextStyle(
    fontSize: 13, fontWeight: FontWeight.normal, color: Colors.white);
TextStyle textStyleHint = const TextStyle(
    fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black87);

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> data = <String>["data1", "data2", "data3", "data3"];
  // Bikin controller di parent
  final dataController = TextEditingController();

  void addData(String data) {
    setState(() {
      this.data.add(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("To-Do List"),
        leading: const Icon(Icons.notes_rounded),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.timer_outlined),
          ),
        ],
        elevation: 0.0,
        backgroundColor: const Color(0XFF3e42c2),
      ),
      body: Column(
        children: [
          TextFieldCustom(
            controller: dataController,
            onTap: (String dataFromChild) {
              // ambil data dari child pake Higher Order Function
              // add data dari data dari child
              addData(dataFromChild);
            },
          ),
          Expanded(
            child: Container(
              color: Colors.blue[50],
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text(data[index]));
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldCustom extends TodoList {
  // jadikan controller sebagai property untuk nerima value dari parent
  final TextEditingController controller;
  // callbacknya untuk eksekusi addData
  final void Function(String) onTap;

  const TextFieldCustom({
    super.key,
    required this.controller,
    required this.onTap,
  });
  // const TextFieldCustom({Key? key}) : super(key: key);

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  // jangan taruh di state
  // TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width,
      color: const Color(0XFF3e42c2),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Senin",
                    style: textStyleH1,
                  ),
                  Text(
                    "30 Agustus",
                    style: textStyleP,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, bottom: 5),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              width: MediaQuery.of(context).size.width / 1.7,
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  icon: InkWell(
                    child: const Icon(
                      Icons.add_circle,
                      color: Color(0XFF3e42c2),
                    ),
                    onTap: () {
                      // mengambil data controller di child untuk dikirim ke parent
                      widget.onTap(widget.controller.text);
                    },
                  ),
                  border: InputBorder.none,
                  hintText: "Add New",
                  hintStyle: textStyleHint,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
