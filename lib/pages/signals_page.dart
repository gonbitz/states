import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:states/signals/todo_signals_controller.dart';
import 'package:states/widgets/todo_widgets.dart';

class SignalsPage extends StatefulWidget {
  const SignalsPage({super.key});

  @override
  State<SignalsPage> createState() => _SignalsPageState();
}

class _SignalsPageState extends State<SignalsPage> {
  final _controller = TodoSignalsController();
  final _textController = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;
    _controller.add(text);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signals'),
        backgroundColor: Colors.red.shade100,
      ),
      body: Column(
        children: [
          const TodoInfoChip(
            label: 'signal.value = ... → Watch reconstruye',
            color: Colors.red,
          ),
          Expanded(
            child: Watch(
              (context) => TodoList(
                todos: _controller.todos.value,
                onToggle: _controller.toggle,
                onDelete: _controller.remove,
                accentColor: Colors.red,
              ),
            ),
          ),
          TodoInputBar(
            controller: _textController,
            onSubmit: _submit,
            accentColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
