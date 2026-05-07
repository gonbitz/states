import 'package:signals_flutter/signals_flutter.dart';
import 'package:states/models/todo.dart';

class TodoSignalsController {
  final todos = signal<List<Todo>>([]);

  void add(String text) {
    todos.value = [
      ...todos.value,
      Todo(id: DateTime.now().toIso8601String(), text: text),
    ];
  }

  void remove(String id) {
    todos.value = todos.value.where((t) => t.id != id).toList();
  }

  void toggle(String id) {
    todos.value = todos.value
        .map((t) => t.id == id ? t.copyWith(done: !t.done) : t)
        .toList();
  }

  void dispose() => todos.dispose();
}
