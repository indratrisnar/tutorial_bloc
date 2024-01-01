import 'package:bloc_fetch_api/models/game.dart';
import 'package:bloc_fetch_api/sources/game_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'live_game_event.dart';
part 'live_game_state.dart';

class LiveGameBloc extends Bloc<LiveGameEvent, LiveGameState> {
  LiveGameBloc() : super(LiveGameInitial()) {
    on<OnFetchLiveGame>((event, emit) async {
      emit(LiveGameLoading());
      List<Game>? result = await GameSource.getLiveGames();
      if (result == null) {
        emit(LiveGameFailure('Something went wrong'));
      } else {
        emit(LiveGameLoaded(result));
      }
    });
  }
}
