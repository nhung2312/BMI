import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
class MyApp3 extends StatelessWidget {
  const MyApp3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data = ["Nguyen Van A", "Nguyen Thi B", "Tran Van C"];
  var lsEnglishWord = generateWordPairs().take(10).toList();

  createHeader() {
    return AppBar(
      title: Text(
        "Trang chủ",
        style: TextStyle(color: Colors.amber, fontSize: 30),
      ),
      leading: Icon(
        Icons.home,
        size: 30,
        color: Colors.amber,
      ),
    );
  }

  /*createBody() {
    return Center(
      child: Text("Hello, good night", style: TextStyle(fontSize: 30),),
    );
  }*/

  /*createBody() {
    return ListView(
      children: [
        Text(data[0], style: TextStyle(fontSize: 30),),
        Text(data[1], style: TextStyle(fontSize: 30),),
        Text(data[2], style: TextStyle(fontSize: 30),)
      ],
    );
  }*/

  /*createBody() {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
      return Text(data[index], style: TextStyle(fontSize: 30, color: Colors.red),);
    });
  }*/

  createBody() {
    return ListView.builder(
        itemCount: lsEnglishWord.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 0,
            child: ListTile(
              //leading: Icon(Icons.favorite_border),
                leading: CircleAvatar(child: Text((index+1).toString())),
                title: Text(lsEnglishWord[index].asString, style: TextStyle(fontSize: 20, color: Colors.red),),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.favorite)
                    ),
                    GestureDetector(
                        onTap: (){
                          print("Da nhan vao day");
                        },
                        child: Icon(Icons.linked_camera)
                    )
                  ],
                )
            ),
          );
        });
  }

  createBottom() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Colors.indigo,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.call, color: Colors.orange, size: 40,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.messenger, color: Colors.orange, size: 40,)),
        ],
      ),
    );
  }

  createFloatAction() {
    return FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {  },
        child: Icon(Icons.add, color: Colors.white,)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createHeader(),
      body: createBody(),
      bottomNavigationBar: createBottom(),
      floatingActionButton: createFloatAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}