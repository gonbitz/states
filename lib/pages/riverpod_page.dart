import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:states/riverpod/todo_notifier.dart';
import 'package:states/widgets/todo_widgets.dart';

class RiverpodPage extends ConsumerStatefulWidget {
  const RiverpodPage({super.key});

  @override
  ConsumerState<RiverpodPage> createState() => _RiverpodPageState();
}

class _RiverpodPageState extends ConsumerState<RiverpodPage> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;
    ref.read(todoNotifierProvider.notifier).add(text);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(todoNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod — NotifierProvider'),
        backgroundColor: Colors.green.shade100,
      ),
      body: Column(
        children: [
          const TodoInfoChip(
            label: 'ref.watch(provider) → ConsumerWidget reconstruye',
            color: Colors.green,
          ),
          Expanded(
            child: TodoList(
              todos: state.todos,
              onToggle: ref.read(todoNotifierProvider.notifier).toggle,
              onDelete: ref.read(todoNotifierProvider.notifier).remove,
              accentColor: Colors.green,
            ),
          ),
          TodoInputBar(
            controller: _textController,
            onSubmit: _submit,
            accentColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
