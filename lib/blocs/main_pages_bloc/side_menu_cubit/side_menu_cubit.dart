import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../models/category.dart';
import '../../../repos/categories_repo/categories_repo.dart';

part 'side_menu_state.dart';

class SideMenuCubit extends Cubit<SideMenuState> {
  SideMenuCubit() : super(SideMenuInitial());

  void getCategories() async {
    emit(LoadingCategories());
    final categories = await CategoriesRepo.fetchCategories();
    emit(CategoriesFetch(categories: categories));
  }
}
