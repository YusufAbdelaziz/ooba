import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final int id;
  final String contactName;
  final String email;
  final String phone;
  final String addressLine1;
  final String addressLine2;
  final String country;
  final String city;
  final String zipCode;
  final bool isDefault;

  Address(
      {this.contactName,
      this.email,
      this.id,
      this.phone,
      this.addressLine1,
      this.addressLine2,
      this.city,
      this.country,
      this.isDefault,
      this.zipCode});

  Address copyWith(
      {String contactName,
      String email,
      int id,
      String phone,
      String addressLine1,
      String addressLine2,
      String city,
      String country,
      bool isDefault,
      String zipCode}) {
    return Address(
        isDefault: isDefault ?? this.isDefault,
        country: country ?? this.country,
        phone: phone ?? this.phone,
        addressLine1: addressLine1 ?? this.addressLine1,
        addressLine2: addressLine2 ?? this.addressLine2,
        city: city ?? this.city,
        id: id ?? this.id,
        contactName: contactName ?? this.contactName,
        email: email ?? this.email,
        zipCode: zipCode ?? this.zipCode);
  }

  @override
  List<Object> get props => [
        this.contactName,
        this.email,
        this.phone,
        this.addressLine1,
        this.addressLine2,
        this.city,
        this.country,
        this.zipCode
      ];
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'] ?? '',
      id: json['id'] ?? -1,
      country: json['country'],
      contactName: json["contact_name"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
      addressLine1: json["address_line_1"] ?? "",
      addressLine2: json["address_line_2"] ?? "",
      isDefault: json["isDefault"] ?? false,
      zipCode: json["zip_code"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = this.city;
    map['id'] = this.id;
    map['country'] = this.country;
    map["contact_name"] = this.contactName;
    map["email"] = this.email;
    map["phone"] = this.phone;
    map["address_line_1"] = this.addressLine1;
    map["address_line_2"] = this.addressLine2;
    map["isDefault"] = this.isDefault;
    map["zip_code"] = this.zipCode;
    return map;
  }

  @override
  String toString() {
    return '{ID : $id , City : $city , Email : $email , Phone : $phone, Contact Name : $contactName}';
  }
}
