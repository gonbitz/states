import 'package:flutter/foundation.dart';

@immutable
class Todo {
  const Todo({required this.id, required this.text, this.done = false});

  final String id;
  final String text;
  final bool done;

  Todo copyWith({String? id, String? text, bool? done}) => Todo(
        id: id ?? this.id,
        text: text ?? this.text,
        done: done ?? this.done,
      );
}
