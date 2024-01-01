import 'package:bloc_fetch_api/bloc/live_game_bloc.dart';
import 'package:bloc_fetch_api/cubit/genre_cubit.dart';
import 'package:bloc_fetch_api/pages/live_game_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LiveGameBloc()),
        BlocProvider(create: (context) => GenreCubit()),
      ],
      child: const MaterialApp(
        home: LiveGamePage(),
      ),
    );
  }
}
