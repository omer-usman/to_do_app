import 'package:flutter/material.dart';
import '../models/todoes.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ToDoItems extends StatefulWidget {
  final onDel;
  ToDoes toDoes;
  ToDoItems({required this.toDoes, required this.onDel});

  @override
  State<ToDoItems> createState() => _ToDoItemsState(onDel);
}

class _ToDoItemsState extends State<ToDoItems> {
  final onDel;
  _ToDoItemsState(this.onDel);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          // color: toDoes.isDone ? Colors.green[100] : Colors.white,
          color: widget.toDoes.getColor(widget.toDoes.difficulty),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              shape: CircleBorder(),
              checkColor: Colors.white,
              value: widget.toDoes.isDone ? true : false,
              onChanged: (value) {
                setState(() {
                  widget.toDoes.setDone();
                });
                print('object');
              },
            ),
            Column(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    widget.toDoes.toDo,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Raleway',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  DateFormat.yMMMMEEEEd().format(widget.toDoes.dueDate),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Raleway',
                  ),
                ),
              ],
            ),
            IconButton(
              alignment: Alignment.centerRight,
              icon: const Icon(Icons.delete),
              onPressed: () {
                onDel(widget.toDoes.id);
              },
            ),
          ],
        ));
  }
}
