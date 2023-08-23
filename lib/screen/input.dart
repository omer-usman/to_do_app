import 'package:flutter/material.dart';
import '../models/todoes.dart';
import '../screen/home.dart';

class Input extends StatefulWidget {
  final Function() refresh;
  Input({required this.refresh});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final _toDoController = TextEditingController();
  int imp = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            addNewTask();
            setState(() {
              _toDoController.clear();
              //widget.refresh();
            });
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 10, 10, 10),
          ),
        ),
        title: const Text(
          'Add New Task',
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
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            width: 400,
            child: TextField(
              controller: _toDoController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(15),
                hintText: 'Add New Task',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 10, 10, 10),
                  fontSize: 18,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: important(),
          ),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       cardDec('Home', 0),
          //       cardDec('Personal', 0),
          //       cardDec('Meet', 0),
          //       cardDec('Work', 0),
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              addNewTask();
              setState(() {
                _toDoController.clear();
                //widget.refresh();
              });
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: AddNewButton(),
          ),
        ],
      ),
    );
  }

  Color getColor(int selector) {
    if (selector == 0) {
      return Colors.white;
    } else if (selector == 1) {
      return Color.fromARGB(255, 157, 187, 202);
    } else if (selector == 2) {
      return const Color.fromRGBO(229, 115, 115, 1);
    } else if (selector == -1) {
      return const Color.fromRGBO(200, 230, 201, 1);
    } else if (selector == 3) {
      return const Color.fromRGBO(255, 183, 77, 1);
    }
    return Colors.white;
  }

  Card cardDec(String text, int x) {
    return Card(
      margin: const EdgeInsets.all(5),
      color: getColor(x),
      child: Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
        child: Text(
          text,
          style: TextStyle(
            letterSpacing: 1.5,
            fontSize: 16,
            fontFamily: 'Raleway',
          ),
        ),
      ),
    );
  }

  Row important() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            imp = 3;
          },
          child: cardDec('Critical', 3),
        ),
        InkWell(
          onTap: () {
            imp = 2;
          },
          child: cardDec('High', 2),
        ),
        InkWell(
          onTap: () {
            imp = 1;
          },
          child: cardDec('Medium', 1),
        ),
        InkWell(
          onTap: () {
            imp = 0;
          },
          child: cardDec('Low', 0),
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

  void addNewTask() {
    if (_toDoController.text.isEmpty) {
      return;
    }
    ToDoes newTask = ToDoes(
      toDo: _toDoController.text,
      dueDate: DateTime.now(),
      id: DateTime.now().toString(),
      difficulty: imp,
    );
    ToDoes.listtodo.add(newTask);
  }
}
