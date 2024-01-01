import 'package:d_method/d_method.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    DMethod.logTitle(
      bloc.runtimeType.toString(),
      transition.toString(),
    );
    super.onTransition(bloc, transition);
  }

}
