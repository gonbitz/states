import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:states/cubit/todo_state.dart';
import 'package:states/models/todo.dart';

class TodoNotifier extends Notifier<TodoState> {
  @override
  TodoState build() => const TodoState();

  void add(String text) {
    state = state.copyWith(
      todos: [
        ...state.todos,
        Todo(id: DateTime.now().toIso8601String(), text: text),
      ],
    );
  }

  void remove(String id) {
    state = state.copyWith(
      todos: state.todos.where((t) => t.id != id).toList(),
    );
  }

  void toggle(String id) {
    state = state.copyWith(
      todos: state.todos
          .map((t) => t.id == id ? t.copyWith(done: !t.done) : t)
          .toList(),
    );
  }
}

final todoNotifierProvider = NotifierProvider<TodoNotifier, TodoState>(
  TodoNotifier.new,
);
