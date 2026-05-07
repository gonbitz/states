import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/cubit/todo_state.dart';
import 'package:states/models/todo.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(const TodoState());

  void add(String text) {
    emit(
      state.copyWith(
        todos: [
          ...state.todos,
          Todo(id: DateTime.now().toIso8601String(), text: text),
        ],
      ),
    );
  }

  void remove(String id) {
    emit(state.copyWith(
      todos: state.todos.where((t) => t.id != id).toList(),
    ));
  }

  void toggle(String id) {
    emit(
      state.copyWith(
        todos: state.todos
            .map((t) => t.id == id ? t.copyWith(done: !t.done) : t)
            .toList(),
      ),
    );
  }
}
