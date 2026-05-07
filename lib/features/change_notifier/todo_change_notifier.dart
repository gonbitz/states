import 'package:flutter/foundation.dart';
import 'package:states/core/models/todo.dart';

class TodoChangeNotifier extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => List.unmodifiable(_todos);

  void add(String text) {
    _todos.add(Todo(id: DateTime.now().toIso8601String(), text: text));
    notifyListeners();
  }

  void remove(String id) {
    _todos.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  void toggle(String id) {
    final index = _todos.indexWhere((t) => t.id == id);
    if (index == -1) return;
    _todos[index] = _todos[index].copyWith(done: !_todos[index].done);
    notifyListeners();
  }
}
