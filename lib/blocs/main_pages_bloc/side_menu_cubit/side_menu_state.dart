part of 'side_menu_cubit.dart';

abstract class SideMenuState extends Equatable {
  const SideMenuState();
}

class SideMenuInitial extends SideMenuState {
  @override
  List<Object> get props => [];
}

class LoadingCategories extends SideMenuState {
  @override
  List<Object> get props => [];
}

class CategoriesFetch extends SideMenuState {
  final List<Category> categories;

  CategoriesFetch({@required this.categories});

  @override
  String toString() => '{CategoriesFetch : categories.length: ${categories.length}';

  @override
  List<Object> get props => [];
}
