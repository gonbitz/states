import 'package:rxdart/rxdart.dart';
import 'package:states/core/models/todo.dart';
import 'package:states/features/cubit/todo_state.dart';

class TodoRxController {
  final _subject = BehaviorSubject<TodoState>.seeded(const TodoState());

  Stream<TodoState> get stream => _subject.stream;
  TodoState get current => _subject.value;

  void add(String text) {
    _subject.add(
      current.copyWith(
        todos: [
          ...current.todos,
          Todo(id: DateTime.now().toIso8601String(), text: text),
        ],
      ),
    );
  }

  void remove(String id) {
    _subject.add(
      current.copyWith(todos: current.todos.where((t) => t.id != id).toList()),
    );
  }

  void toggle(String id) {
    _subject.add(
      current.copyWith(
        todos: current.todos
            .map((t) => t.id == id ? t.copyWith(done: !t.done) : t)
            .toList(),
      ),
    );
  }

  void dispose() => _subject.close();
}
