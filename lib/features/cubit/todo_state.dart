import 'package:equatable/equatable.dart';
import 'package:states/core/models/todo.dart';

class TodoState extends Equatable {
  const TodoState({this.todos = const []});

  final List<Todo> todos;

  TodoState copyWith({List<Todo>? todos}) =>
      TodoState(todos: todos ?? this.todos);

  @override
  List<Object> get props => [todos];
}
