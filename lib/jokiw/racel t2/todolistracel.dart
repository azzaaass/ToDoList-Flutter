import 'package:flutter/material.dart';

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  List<String> dataList1 = <String>[];
  List<String> dataList2 = <String>[];
  List<String> dataList3 = <String>[];

  final dataController1 = TextEditingController();
  final dataController2 = TextEditingController();
  final dataController3 = TextEditingController();

  void addData(String data1, String data2, String data3) {
    setState(() {
      this.dataList1.add(data1);
      this.dataList2.add(data2);
      this.dataList3.add(data3);
      this.dataController1.clear();
      this.dataController2.clear();
      this.dataController3.clear();
    });
  }

  void deleteData(int index) {
    setState(() {
      this.dataList1.removeAt(index);
      this.dataList2.removeAt(index);
      this.dataList3.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Nama"),
              controller: dataController1,
            ),
            TextField(
              decoration: InputDecoration(labelText: "NIM"),
              controller: dataController2,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Umur"),
              controller: dataController3,
            ),
            TextButton(
              onPressed: () {
                addData(dataController1.text, dataController2.text,
                    dataController3.text);
              },
              child: Text("Add"),
            ),
            Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.custom(
                childrenDelegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ListTile(
                      title: Text(dataList1[index]),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("NIM : " + dataList2[index]),
                          Text("Umur : " + dataList3[index]),
                        ],
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            deleteData(index);
                          },
                          icon: Icon(Icons.delete)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyListDetail(text1: dataList1[index], text2: dataList2[index], text3: dataList3[index],)),
                        );
                      },
                    );
                  },
                  childCount: dataList1.length,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class MyListDetail extends StatelessWidget {
  final String? text1;
  final String? text2;
  final String? text3;
  const MyListDetail({super.key, this.text1, this.text2, this.text3});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text1.toString()),
          Text(text2.toString()),
          Text(text3.toString()),
        ],
      ),
    );
  }
}
