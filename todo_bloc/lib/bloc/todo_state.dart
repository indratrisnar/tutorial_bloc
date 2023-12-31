part of 'todo_bloc.dart';

@immutable
sealed class TodoState {
  final List<Todo> todos;

  const TodoState(this.todos);
}

final class TodoInitial extends TodoState {
  const TodoInitial(super.todos);
}

final class TodoLoading extends TodoState {
  const TodoLoading(super.todos);
}

final class TodoAdded extends TodoState {
  const TodoAdded(super.todos);
}

final class TodoRemoved extends TodoState {
  const TodoRemoved(super.todos);
}

final class TodoUpdated extends TodoState {
  const TodoUpdated(super.todos);
}
