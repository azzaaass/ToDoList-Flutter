import 'package:flutter/material.dart';

class MyList4 extends StatefulWidget {
  const MyList4({super.key});

  @override
  State<MyList4> createState() => _MyList4State();
}

class _MyList4State extends State<MyList4> {
  List<String> data = <String>[];
  final dataController = TextEditingController();

  void addData(String value) {
    setState(() {
      this.data.add(value);
      this.dataController.clear();
    });
  }

  void deleteData(int index) {
    setState(() {
      this.data.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do List Detail"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Nama"),
            controller: dataController,
          ),
          TextButton(
              onPressed: () {
                addData(dataController.text);
              },
              child: Text("Add")),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: FlutterLogo(
                      size: 50,
                    ),
                    title: Text("Nama : " + data[index]),
                    trailing: IconButton(
                        onPressed: () {
                          deleteData(index);
                        },
                        icon: Icon(Icons.delete_forever)),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailList(
                                text1: "ini matkul",
                                text2: "",
                                text3: data[index],
                              )),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailList extends StatelessWidget {
  final String? text1;
  final String? text2;
  final String? text3;

  const DetailList({super.key, this.text1, this.text2, this.text3});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Column(
        children: [
          Text(text1.toString()),
          Text(text2.toString()),
          Text(text3.toString()),
        ],
      ),
    );
  }
}
