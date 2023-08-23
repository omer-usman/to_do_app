import 'package:flutter/material.dart';
import '../models/todoes.dart';
import '../widgets/to_do_items.dart';
import '../screen/input.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ToDoes> toDo = ToDoes.listtodo;
  void _del(String id) {
    setState(() {
      ToDoes.listtodo.removeWhere((listtodo) => listtodo.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: refresh(),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 22,
        elevation: 0,
        backgroundColor: Colors.transparent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded), label: ''),
        ],
      ),
    );
  }

  Column refresh() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _searchField(),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 50, left: 25),
                child: const Text(
                  'on going tasks:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              if (toDo.isEmpty)
                const Text(
                  'No More\nTasks for Today',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 10, 10, 10),
                      fontSize: 35,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500),
                ),
              if (toDo.isEmpty)
                const Image(
                  image: AssetImage('assets/noTask.png'),
                  height: 300,
                ),
              for (ToDoes x in toDo) ToDoItems(toDoes: x, onDel: _del)
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Input(refresh: refresh)),
            );
          },
          child: AddNewButton(),
        ),
      ],
    );
  }

  Container AddNewButton() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 14, bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(50, 0, 230, 119),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(2, 5),
          ),
        ],
        color: Colors.greenAccent[400],
      ),
      child: const Text(
        'Add New Task',
        style: TextStyle(
          letterSpacing: 1.5,
          color: Colors.white,
          fontSize: 15,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  AppBar appbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'My Tasks',
        style: TextStyle(
          color: Color.fromARGB(255, 10, 10, 10),
          fontSize: 20,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w500,
        ),
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: const Color.fromARGB(0, 255, 0, 0),
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          color: const Color.fromARGB(255, 10, 10, 10),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Input(refresh: refresh),
              ),
            );
          },
        ),
      ],
    );
  }

  void _runFilter(String enterKeyword) {
    List<ToDoes> results = [];
    if (enterKeyword.isEmpty) {
      results = ToDoes.listtodo;
    } else {
      results = ToDoes.listtodo
          .where((toDoes) =>
              toDoes.toDo.toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      toDo = results;
    });
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Search',
          hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: Container(
            width: 100,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
