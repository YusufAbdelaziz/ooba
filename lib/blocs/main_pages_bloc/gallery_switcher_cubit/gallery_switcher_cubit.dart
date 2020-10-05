import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


class GallerySwitcherCubit extends Cubit<int> {
  GallerySwitcherCubit() : super(0);

  void thumbnailBorderSwitched({@required int index}) {
    emit(index);
  }
}
