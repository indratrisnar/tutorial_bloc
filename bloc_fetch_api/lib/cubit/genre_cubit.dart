import 'package:flutter_bloc/flutter_bloc.dart';

class GenreCubit extends Cubit<String> {
  GenreCubit() : super('Shooter');

  onSelected(String newGenre) {
    emit(newGenre);
  }
}
