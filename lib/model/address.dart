class AddressModel {
  String name = "";
  String email = "";
  String phone = "";
  String addressLine1 = "";
  String addressLine2 = "";
  String country = "";
  String city = "";
  String zipCode = "";
  bool isDefault = false;

  AddressModel(
      {this.name,
      this.email,
      this.phone,
      this.addressLine1,
      this.addressLine2,
      this.city,
      this.country,
      this.isDefault,
      this.zipCode});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
      addressLine1: json["addressLine1"] ?? "",
      addressLine2: json["addressLine2"] ?? "",
      isDefault: json["isDefault"] ?? false,
      zipCode: json["zipCode"] ?? "",
    );
  }
}
