import 'package:flutter/material.dart';
import 'package:states/core/models/todo.dart';
import 'package:states/core/widgets/todo_widgets.dart';

class SetStatePage extends StatefulWidget {
  const SetStatePage({super.key});

  @override
  State<SetStatePage> createState() => _SetStatePageState();
}

class _SetStatePageState extends State<SetStatePage> {
  final List<Todo> _todos = [];
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _add(String text) {
    setState(() {
      _todos.add(Todo(id: DateTime.now().toIso8601String(), text: text));
    });
  }

  void _remove(String id) {
    setState(() => _todos.removeWhere((t) => t.id == id));
  }

  void _toggle(String id) {
    setState(() {
      final index = _todos.indexWhere((t) => t.id == id);
      if (index == -1) return;
      _todos[index] = _todos[index].copyWith(done: !_todos[index].done);
    });
  }

  void _submit() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;
    _add(text);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('setState'),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Column(
        children: [
          const TodoInfoChip(
            label: 'setState(() {}) → rebuild del widget completo',
            color: Colors.grey,
          ),
          Expanded(
            child: TodoList(
              todos: _todos,
              onToggle: _toggle,
              onDelete: _remove,
              accentColor: Colors.grey,
            ),
          ),
          TodoInputBar(
            controller: _textController,
            onSubmit: _submit,
            accentColor: Colors.grey.shade700,
          ),
        ],
      ),
    );
  }
}
