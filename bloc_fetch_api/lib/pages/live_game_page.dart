import 'package:bloc_fetch_api/bloc/live_game_bloc.dart';
import 'package:bloc_fetch_api/models/game.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LiveGamePage extends StatefulWidget {
  const LiveGamePage({super.key});

  @override
  State<LiveGamePage> createState() => _LiveGamePageState();
}

class _LiveGamePageState extends State<LiveGamePage> {
  @override
  void initState() {
    context.read<LiveGameBloc>().add(OnFetchLiveGame());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Games'),
        centerTitle: true,
      ),
      body: BlocBuilder<LiveGameBloc, LiveGameState>(
        builder: (context, state) {
          if (state is LiveGameLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is LiveGameFailure) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is LiveGameLoaded) {
            List<Game> list = state.games;
            if (list.isEmpty) {
              return const Center(child: Text('Empty'));
            }
            return GridView.builder(
              itemCount: list.length,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(2),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
              ),
              itemBuilder: (context, index) {
                Game game = list[index];
                return Stack(
                  children: [
                    Positioned.fill(
                      child: ExtendedImage.network(
                        game.thumbnail!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment(0, -0.2),
                            colors: [
                              Colors.black,
                              Colors.transparent,
                            ],
                          ),
                        ),
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          game.title ?? "",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
