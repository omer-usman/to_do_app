import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/todoitems.dart';
import 'package:to_do_app/model/todo.dart';

final todosList = Todo.todosList();
final _todoController = TextEditingController();

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> foundTodos = [];

  @override
  void initState() {
    foundTodos = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 179, 231, 255),
        appBar: _buildAppBar(),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  searchBox(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50, bottom: 20),
                          child: Text('All Tasks',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                        ),
                        for (Todo todoo in foundTodos)
                          TodoItems(
                            todo: todoo,
                            OnToDoChange: _handelTodoItem,
                            OnToDoDelete: _handelTodoDelete,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          margin:
                              EdgeInsets.only(bottom: 20, right: 20, left: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                  offset: Offset(0, 0),
                                )
                              ]),
                          child: TextField(
                            controller: _todoController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(20),
                              border: InputBorder.none,
                              hintText: 'Add a new task',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ))),
                  Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20),
                    child: FloatingActionButton(
                      onPressed: () {
                        _addTodoItem(_todoController.text);
                      },
                      backgroundColor: Colors.black,
                      child: Icon(Icons.add),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  void _handelTodoItem(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone!;
    });
  }

  void _runFilter(String enteredKeyword) {
    List<Todo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((todo) => todo.ToDoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundTodos = results;
    });
  }

  void _addTodoItem(String todoText) {
    setState(() {
      todosList.add(Todo(
        id: DateTime.now().toString(),
        ToDoText: todoText,
        isDone: false,
      ));
    });
    _todoController.clear();
  }

  void _handelTodoDelete(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) {
          _runFilter(value);
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 20,
              minHeight: 25,
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.black, fontSize: 16)),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 179, 231, 255),
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: Color.fromARGB(255, 0, 0, 0),
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/me.jpeg')),
          )
        ],
      ),
    );
  }
}
