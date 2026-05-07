import 'package:flutter/material.dart';
import 'package:states/core/widgets/todo_widgets.dart';
import 'package:states/features/cubit/todo_state.dart';
import 'package:states/features/rxdart/todo_rx_controller.dart';

class RxDartPage extends StatefulWidget {
  const RxDartPage({super.key});

  @override
  State<RxDartPage> createState() => _RxDartPageState();
}

class _RxDartPageState extends State<RxDartPage> {
  final _controller = TodoRxController();
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
        title: const Text('RxDart — BehaviorSubject'),
        backgroundColor: Colors.purple.shade100,
      ),
      body: Column(
        children: [
          const TodoInfoChip(
            label: 'subject.add(lista) → StreamBuilder reconstruye',
            color: Colors.purple,
          ),
          Expanded(
            child: StreamBuilder<TodoState>(
              stream: _controller.stream,
              builder: (context, snapshot) {
                return TodoList(
                  todos: snapshot.data?.todos ?? [],
                  onToggle: _controller.toggle,
                  onDelete: _controller.remove,
                  accentColor: Colors.purple,
                );
              },
            ),
          ),
          TodoInputBar(
            controller: _textController,
            onSubmit: _submit,
            accentColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
