class PaymentMethodModel {
  final String type;      // card / wallet
  final String title;     // Visa, MasterCard, Apple Pay
  final String lastFour;  // **** 4242
  final bool isDefault;

  PaymentMethodModel({
    required this.type,
    required this.title,
    required this.lastFour,
    this.isDefault = false,
  });
}
