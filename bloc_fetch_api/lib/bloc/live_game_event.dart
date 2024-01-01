part of 'live_game_bloc.dart';

@immutable
sealed class LiveGameEvent {}

class OnFetchLiveGame extends LiveGameEvent {}
