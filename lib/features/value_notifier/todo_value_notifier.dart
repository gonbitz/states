import 'package:flutter/foundation.dart';
import 'package:states/core/models/todo.dart';
import 'package:states/features/cubit/todo_state.dart';

class TodoValueNotifier extends ValueNotifier<TodoState> {
  TodoValueNotifier() : super(const TodoState());

  void add(String text) {
    value = value.copyWith(
      todos: [
        ...value.todos,
        Todo(id: DateTime.now().toIso8601String(), text: text),
      ],
    );
  }

  void remove(String id) {
    value = value.copyWith(
      todos: value.todos.where((t) => t.id != id).toList(),
    );
  }

  void toggle(String id) {
    value = value.copyWith(
      todos: value.todos
          .map((t) => t.id == id ? t.copyWith(done: !t.done) : t)
          .toList(),
    );
  }
}
