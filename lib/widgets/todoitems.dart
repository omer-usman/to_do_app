import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/model/todo.dart';

class TodoItems extends StatelessWidget {
  final Todo todo;
  final OnToDoChange;
  final OnToDoDelete;

  const TodoItems(
      {Key? key, required this.todo, this.OnToDoChange, this.OnToDoDelete})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: ListTile(
          onTap: () {
            OnToDoChange(todo);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.white,
          leading: Icon(
            todo.isDone!
                ? Icons.check_circle_outline
                : Icons.radio_button_unchecked_rounded,
            color: Colors.black,
            size: 30,
          ),
          title: Text(
            todo.ToDoText!,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              decoration: todo.isDone! ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: Icon(Icons.delete),
              color: Colors.white,
              iconSize: 20,
              onPressed: () {
                OnToDoDelete(todo.id);
              },
            ),
          ),
        ));
  }
}
