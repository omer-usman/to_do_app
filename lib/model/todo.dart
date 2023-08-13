class Todo {
  String? id;
  String? ToDoText;
  bool? isDone;
  Todo({
    required this.id,
    required this.ToDoText,
    this.isDone = false,
  });

  static List<Todo> todosList() {
    return [
      Todo(
        id: '1',
        ToDoText: 'Buy Milk',
        isDone: true,
      ),
      Todo(
        id: '2',
        ToDoText: 'Buy Eggs',
        isDone: true,
      ),
      Todo(
        id: '3',
        ToDoText: 'Buy Bread',
        isDone: false,
      ),
    ];
  }
}
