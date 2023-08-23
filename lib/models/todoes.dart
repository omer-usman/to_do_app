import 'package:flutter/material.dart';

class ToDoes {
  final String toDo;
  final DateTime dueDate;
  final String id;
  bool isDone;
  int difficulty = 0;
  static List<ToDoes> listtodo = [
    ToDoes(
        toDo: "Football Practice",
        dueDate: DateTime.now(),
        id: "1",
        difficulty: 2,
        isDone: true),
    ToDoes(
        toDo: "Cricket Practice",
        dueDate: DateTime.now(),
        id: "2",
        difficulty: 1),
    ToDoes(
        toDo: "Swimming Practice",
        dueDate: DateTime.now(),
        id: "3",
        difficulty: 3),
    ToDoes(toDo: "Basketball Practice", dueDate: DateTime.now(), id: "4"),
    ToDoes(toDo: "Volleyball Practice", dueDate: DateTime.now(), id: "5"),
  ];
  ToDoes(
      {required this.toDo,
      required this.dueDate,
      required this.id,
      this.isDone = false,
      this.difficulty = 0});

  static List<ToDoes> toDoesList() {
    return listtodo;
  }

  void setDone() {
    if (isDone) {
      isDone = false;
      difficulty = 0;
    } else {
      isDone = true;
      difficulty = -1;
    }
  }

  static void Delete(String id) {
    listtodo.removeWhere((listtodo) => listtodo.id == id);
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
}
