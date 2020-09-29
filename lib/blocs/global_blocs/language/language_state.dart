part of 'language_bloc.dart';

class LanguageState extends Equatable {
  final Locale locale;

  LanguageState({@required this.locale}) : assert(locale != null);

  @override
  List<Object> get props => [locale];
}
