class AddressModel {
  final String title;
  final String address;
  final bool isDefault;

  AddressModel({
    required this.title,
    required this.address,
    this.isDefault = false,
  });
}
