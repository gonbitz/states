import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/cubit/todo_cubit.dart';
import 'package:states/cubit/todo_state.dart';
import 'package:states/widgets/todo_widgets.dart';

class CubitPage extends StatelessWidget {
  const CubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoCubit(),
      child: const _CubitPageContent(),
    );
  }
}

class _CubitPageContent extends StatefulWidget {
  const _CubitPageContent();

  @override
  State<_CubitPageContent> createState() => _CubitPageContentState();
}

class _CubitPageContentState extends State<_CubitPageContent> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;
    context.read<TodoCubit>().add(text);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit (flutter_bloc)'),
        backgroundColor: Colors.orange.shade100,
      ),
      body: Column(
        children: [
          const TodoInfoChip(
            label: 'emit(lista) → BlocBuilder reconstruye',
            color: Colors.orange,
          ),
          Expanded(
            child: BlocBuilder<TodoCubit, TodoState>(
              builder: (context, state) {
                return TodoList(
                  todos: state.todos,
                  onToggle: context.read<TodoCubit>().toggle,
                  onDelete: context.read<TodoCubit>().remove,
                  accentColor: Colors.orange,
                );
              },
            ),
          ),
          TodoInputBar(
            controller: _textController,
            onSubmit: _submit,
            accentColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}
