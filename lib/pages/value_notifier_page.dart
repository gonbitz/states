import 'package:flutter/material.dart';
import 'package:states/cubit/todo_state.dart';
import 'package:states/value_notifier/todo_value_notifier.dart';
import 'package:states/widgets/todo_widgets.dart';

class ValueNotifierPage extends StatefulWidget {
  const ValueNotifierPage({super.key});

  @override
  State<ValueNotifierPage> createState() => _ValueNotifierPageState();
}

class _ValueNotifierPageState extends State<ValueNotifierPage> {
  final _notifier = TodoValueNotifier();
  final _textController = TextEditingController();

  @override
  void dispose() {
    _notifier.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;
    _notifier.add(text);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueNotifier'),
        backgroundColor: Colors.teal.shade100,
      ),
      body: Column(
        children: [
          const TodoInfoChip(
            label: 'value = lista → ValueListenableBuilder reconstruye',
            color: Colors.teal,
          ),
          Expanded(
            child: ValueListenableBuilder<TodoState>(
              valueListenable: _notifier,
              builder: (context, state, child) {
                return TodoList(
                  todos: state.todos,
                  onToggle: _notifier.toggle,
                  onDelete: _notifier.remove,
                  accentColor: Colors.teal,
                );
              },
            ),
          ),
          TodoInputBar(
            controller: _textController,
            onSubmit: _submit,
            accentColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
