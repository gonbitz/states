import 'package:flutter/material.dart';
import 'package:states/models/todo.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    required this.todos,
    required this.onToggle,
    required this.onDelete,
    required this.accentColor,
    super.key,
  });

  final List<Todo> todos;
  final void Function(String id) onToggle;
  final void Function(String id) onDelete;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    if (todos.isEmpty) {
      return const Center(
        child: Text(
          'No hay tareas.\nAgregá una abajo.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: todos.length,
      itemBuilder: (_, i) {
        final todo = todos[i];
        return ListTile(
          leading: Checkbox(
            value: todo.done,
            activeColor: accentColor,
            onChanged: (_) => onToggle(todo.id),
          ),
          title: Text(
            todo.text,
            style: TextStyle(
              decoration: todo.done ? TextDecoration.lineThrough : null,
              color: todo.done ? Colors.grey : null,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => onDelete(todo.id),
          ),
        );
      },
    );
  }
}

class TodoInputBar extends StatelessWidget {
  const TodoInputBar({
    required this.controller,
    required this.onSubmit,
    required this.accentColor,
    super.key,
  });

  final TextEditingController controller;
  final VoidCallback onSubmit;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                onSubmitted: (_) => onSubmit(),
                decoration: InputDecoration(
                  hintText: 'Nueva tarea...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            FilledButton(
              onPressed: onSubmit,
              style: FilledButton.styleFrom(backgroundColor: accentColor),
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

class TodoInfoChip extends StatelessWidget {
  const TodoInfoChip({
    required this.label,
    required this.color,
    super.key,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Chip(
        label: Text(label, style: const TextStyle(fontSize: 11)),
        backgroundColor: color.withValues(alpha: 0.12),
        side: BorderSide(color: color.withValues(alpha: 0.3)),
      ),
    );
  }
}
