part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

/// Used to load the stored language.
class LanguageLoadStarted extends LanguageEvent {}

/// Used to switch to new language using language code.
class LanguageSelected extends LanguageEvent {
  final Language languageCode;

  LanguageSelected({@required this.languageCode}) : assert(languageCode != null);

  @override
  List<Object> get props => [languageCode];

  @override
  String toString() {
    return 'LanguageSelected : languageCode : $languageCode';
  }
}
