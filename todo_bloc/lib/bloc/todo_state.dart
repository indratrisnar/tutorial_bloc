part of 'todo_bloc.dart';

enum TodoStatus { init, loading, success, failed }

class TodoState {
  final List<Todo> todos;
  final TodoStatus status;

  const TodoState(this.todos, this.status);
}
