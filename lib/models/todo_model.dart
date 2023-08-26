// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TodoListProvider extends ChangeNotifier {
  final List<Todo> todoList = [];

  void addNewTodo(Todo todo) {
    todoList.add(todo);
    notifyListeners();
  }

  void deleteATodo(int index) {
    todoList.removeAt(index);
    notifyListeners();
  }

  void updateATodo(Todo updatedTodo, int index) {
    todoList.removeAt(index);
    todoList.insert(index, updatedTodo);
    notifyListeners();
  }

  void todoDone(Todo currentTodo, int index) {
    todoList.removeAt(index);
    todoList.insert(
        index, currentTodo.copyWith(isCompleted: !currentTodo.isCompleted!));
    notifyListeners();
  }
}

class Todo {
  final String head;
  final String body;
  final bool? isCompleted;
  const Todo({required this.head,required this.body, this.isCompleted = false});

  Todo copyWith({
    String? head,
    String? body,
    bool? isCompleted,
  }) {
    return Todo(
      head: head ?? this.head,
      body: body ?? this.body,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
