// todo_item.dart
import 'package:flutter/material.dart';
import 'package:todolist/model/todo.dart';
import 'package:todolist/constants/colors.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  final Function(ToDo) onEditItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
    required this.onEditItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onToDoChanged(todo);
      },
      leading: Icon(
        todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
        color: tdBlue,
      ),
      title: Text(
        todo.todoText ?? '',
        style: TextStyle(
          decoration: todo.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Wrap(
        spacing: 12,
        children: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.green),
            onPressed: () {
              onEditItem(todo);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              onDeleteItem(todo.id);
            },
          ),
        ],
      ),
    );
  }
}
