import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/core/widgets/todo_widgets.dart';
import 'package:states/features/change_notifier/todo_change_notifier.dart';

class ChangeNotifierPage extends StatelessWidget {
  const ChangeNotifierPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoChangeNotifier(),
      child: const _ChangeNotifierContent(),
    );
  }
}

class _ChangeNotifierContent extends StatefulWidget {
  const _ChangeNotifierContent();

  @override
  State<_ChangeNotifierContent> createState() => _ChangeNotifierContentState();
}

class _ChangeNotifierContentState extends State<_ChangeNotifierContent> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;
    context.read<TodoChangeNotifier>().add(text);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<TodoChangeNotifier>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifier + Provider'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Column(
        children: [
          const TodoInfoChip(
            label: 'notifyListeners() → context.watch reconstruye',
            color: Colors.blue,
          ),
          Expanded(
            child: TodoList(
              todos: notifier.todos,
              onToggle: context.read<TodoChangeNotifier>().toggle,
              onDelete: context.read<TodoChangeNotifier>().remove,
              accentColor: Colors.blue,
            ),
          ),
          TodoInputBar(
            controller: _textController,
            onSubmit: _submit,
            accentColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
