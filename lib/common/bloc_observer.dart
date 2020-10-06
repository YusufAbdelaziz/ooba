import 'package:Ooba/blocs/main_pages_bloc/gallery_switcher_cubit/gallery_switcher_cubit.dart';
import 'package:Ooba/utilities/timer/timer_bloc.dart';
import 'package:bloc/bloc.dart';

/// Used to observe state transition and fired events.
class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    if (bloc is! TimerBloc && bloc is! GallerySwitcherCubit) {
      print(event);
    }
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    if (cubit is! TimerBloc && cubit is! GallerySwitcherCubit) {
      print(change);
    }
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (bloc is! TimerBloc && bloc is! GallerySwitcherCubit) {
      print(transition);
    }
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(cubit, error, stackTrace);
  }
}
