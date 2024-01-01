part of 'live_game_bloc.dart';

@immutable
sealed class LiveGameState {}

final class LiveGameInitial extends LiveGameState {}

final class LiveGameLoading extends LiveGameState {}

final class LiveGameFailure extends LiveGameState {
  final String message;

  LiveGameFailure(this.message);
}

final class LiveGameLoaded extends LiveGameState {
  final List<Game> games;

  LiveGameLoaded(this.games);
}
