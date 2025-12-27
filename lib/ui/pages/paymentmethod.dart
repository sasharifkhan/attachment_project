import 'package:Nectar/services/models/paymentmodel.dart';
import 'package:Nectar/ui/widgets/paymentcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodsScreen extends StatelessWidget {
  PaymentMethodsScreen({super.key});

  final List<PaymentMethodModel> payments = [
    PaymentMethodModel(
      type: 'card',
      title: 'Visa',
      lastFour: '4242',
      isDefault: true,
    ),
    PaymentMethodModel(
      type: 'card',
      title: 'MasterCard',
      lastFour: '8899',
    ),
    PaymentMethodModel(
      type: 'wallet',
      title: 'Apple Pay',
      lastFour: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Payment Methods',
          style: TextStyle(fontSize: 18.sp),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.w),
        itemCount: payments.length,
        itemBuilder: (context, index) {
          return PaymentCard(payment: payments[index]);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF53B175),
        onPressed: () {
          // Navigate to Add Payment Method
        },
        icon: const Icon(Icons.add),
        label: Text(
          'Add New',
          style: TextStyle(fontSize: 14.sp),
        ),
      ),
    );
  }
}
