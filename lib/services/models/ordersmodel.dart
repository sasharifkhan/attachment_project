class OrderModel {
  final String orderId;
  final String date;
  final String status;
  final double total;

  OrderModel({
    required this.orderId,
    required this.date,
    required this.status,
    required this.total,
  });
}
