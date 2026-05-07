import 'package:states/models/todo.dart';

class TodoState {
  const TodoState({this.todos = const []});

  final List<Todo> todos;

  TodoState copyWith({List<Todo>? todos}) =>
      TodoState(todos: todos ?? this.todos);
}
