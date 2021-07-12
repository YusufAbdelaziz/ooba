import 'package:Ooba/repos/user_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/address.dart';
import '../../repos/address_repo.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());
  List<Address> _addresses;

  void fetchAddresses({@required String token}) async {
    emit(LoadingAddresses());
    try {
      final addresses = await AddressRepo.fetchAddresses(token: token);
      _addresses = [...addresses];

      emit(GetAddressesSuccess(addresses: addresses));
    } catch (e, stacktrace) {
      print(stacktrace);
      emit(GetAddressesFail(errorMsg: e.toString()));
    }
  }

  void addAddress({@required Address address}) async {
    emit(LoadingAddAddress());
    try {
      final addresses = await AddressRepo.addAddress(address: address);
      _addresses = [...addresses];
      emit(AddAddressSuccess());
      emit(GetAddressesSuccess(addresses: addresses));
    } catch (e, stacktrace) {
      print(stacktrace);
      emit(AddAddressFail(errorMsg: e.toString()));
      emit(GetAddressesSuccess(addresses: _addresses));
    }
  }

  void setDefaultAddress({@required Address address}) async {
    var oldDefaultAddressIndex =
        _addresses.indexWhere((element) => element.id == UserRepo.getUser().defaultAddress.id);
    _addresses[oldDefaultAddressIndex] =
        _addresses[oldDefaultAddressIndex].copyWith(isDefault: false);
    var newDefaultAddressIndex = _addresses.indexWhere((element) => element.id == address.id);
    _addresses[newDefaultAddressIndex] =
        _addresses[newDefaultAddressIndex].copyWith(isDefault: true);
    await AddressRepo.setDefaultAddress(address: address);

    emit(AddressInitial());
    emit(GetAddressesSuccess(addresses: _addresses));
  }
}
