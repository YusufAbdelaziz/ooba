part of 'favorite_switcher_cubit.dart';

abstract class FavoriteSwitcherState extends Equatable {
  const FavoriteSwitcherState();
}

class FavoriteSwitcherInitial extends FavoriteSwitcherState {
  @override
  List<Object> get props => [];
}

class FavoriteSwitchSuccess extends FavoriteSwitcherState {
  final bool switchStatus;

  FavoriteSwitchSuccess({@required this.switchStatus});

  @override
  List<Object> get props => [];
}

class FavoriteSwitchFail extends FavoriteSwitcherState {

  FavoriteSwitchFail();

  @override
  List<Object> get props => [];
}