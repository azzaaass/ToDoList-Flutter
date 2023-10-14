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
  // List<String> data = <String>[];
  List<Person> dataList = <Person>[];
  // Bikin controller di parent
  TextEditingController dataController = TextEditingController();
  TextEditingController dataController2 = TextEditingController();
  TextEditingController dataController3 = TextEditingController();

  addData(Person personData) {
    setState(() {
      this.dataList.add(personData);
      this.dataController.clear();
      this.dataController2.clear();
      this.dataController3.clear();
    });
  }

  void deleteData(int index) {
    setState(() {
      this.dataList.removeAt(index);
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
          Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              children: [
                TextFieldCustom(
                  controller: dataController,
                ),
                TextFieldCustom(
                  controller: dataController2,
                ),
                TextFieldCustom(
                  controller: dataController3,
                ),
                // IconButton(
                //     onPressed: () {
                //       addData(Person(
                //           name: dataController.text,
                //           nim: dataController2.text,
                //           umur: dataController3.text));
                //     },
                //     icon: Icon(Icons.add)),
                IconButtonCustom(
                    icon1: Icon(Icons.add),
                    onPress: (Person) {
                      addData(Person);
                    })
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue[50],
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: FlutterLogo(size: 60),
                      title: Text(dataList[index].name.toString()),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(dataList[index].nim.toString()),
                          Text(dataList[index].umur.toString()),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_forever),
                        onPressed: () {
                          deleteData(index);
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TodoListDetail(
                                  text1: dataList[index].name,
                                  text2: dataList[index].nim,
                                  text3: dataList[index].umur),
                            ));
                      },
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldCustom extends StatelessWidget {
  // jadikan controller sebagai property untuk nerima value dari parent
  final TextEditingController controller;

  const TextFieldCustom({
    super.key,
    required this.controller,
  });
  // const TextFieldCustom({Key? key}) : super(key: key);

  // jangan taruh di state
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, bottom: 5),
      margin: const EdgeInsets.only(bottom: 5),
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.white),
      width: MediaQuery.of(context).size.width / 1.7,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Add New",
          hintStyle: textStyleHint,
        ),
      ),
    );
  }
}

class Person {
  final String? name;
  final String? nim;
  final String? umur;
  Person({required this.name, required this.nim, required this.umur});
}

class TodoListDetail extends StatelessWidget {
  final String? text1, text2, text3;
  const TodoListDetail(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail List"),
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

class IconButtonCustom extends StatefulWidget {
  final Icon icon1;
  final Function (Person) onPress;
  const IconButtonCustom(
      {super.key, required this.icon1, required this.onPress});

  @override
  State<IconButtonCustom> createState() => _IconButtonCustomState();
}

class _IconButtonCustomState extends State<IconButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      widget.onPress(Person(name: "tt", nim: "sss", umur: "liil"));
    }, icon: widget.icon1);
  }
}
