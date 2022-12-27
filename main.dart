import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolistapp/style.dart';

main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List <String> ToDoList=[];
  String item ="";

  MyInputChange(content){
    setState(() {
      item = content;
    });
  }

  AddItem(){
    setState(() {
      ToDoList.add(item);
    });
  }

  RemoveItem(index){
    setState(() {
      ToDoList.removeAt(index);
    });
  }

  final TextEditingController _controller = new TextEditingController();


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                      flex: 70,
                      child: TextFormField(
                        controller: _controller,
                        onChanged: (content){
                          MyInputChange(content);
                        },
                        decoration: MyTextField('Item Here'),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        flex: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            _controller.clear();
                            AddItem();
                          },
                          child: Text('Add Item'),
                          style: MyButtonStyle(),
                        ))
                  ],
                )),
            Expanded(
              flex: 90,
              child: ListView.builder(
                  itemCount: ToDoList.length,
                  itemBuilder: (context, index) {
                return SizedBox(
                  child: Column(
                    children: [
                      Card(
                          child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                            child: Row(
                              children: [
                                Expanded(flex: 80, child: Text(
                                  ToDoList[index]
                                )),
                                Expanded(
                                  flex: 20,
                                  child: IconButton(
                                      onPressed: () {
                                        RemoveItem(index);
                                      },
                                      icon: Icon(Icons.delete, color: Colors.green)),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
