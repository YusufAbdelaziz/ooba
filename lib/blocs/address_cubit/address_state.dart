part of 'address_cubit.dart';

abstract class AddressState extends Equatable {
  const AddressState();
}

class AddressInitial extends AddressState {
  @override
  List<Object> get props => [];
}

class LoadingAddresses extends AddressState {
  @override
  List<Object> get props => [];
}

class GetAddressesSuccess extends AddressState {
  final List<Address> addresses;

  GetAddressesSuccess({@required this.addresses});

  GetAddressesSuccess copyWith({List<Address> addresses}) {
    return GetAddressesSuccess(addresses: addresses ?? addresses);
  }

  @override
  List<Object> get props => [addresses];
}

class GetAddressesFail extends AddressState {
  final String errorMsg;

  GetAddressesFail({@required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

class LoadingAddAddress extends AddressState {
  @override
  List<Object> get props => [];
}

class AddAddressSuccess extends AddressState {
  @override
  List<Object> get props => [];
}

class AddAddressFail extends AddressState {
  final String errorMsg;
  AddAddressFail({@required this.errorMsg});
  @override
  List<Object> get props => [this.errorMsg];
}
