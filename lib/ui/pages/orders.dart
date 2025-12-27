import 'package:Nectar/services/models/ordersmodel.dart';
import 'package:Nectar/ui/widgets/ordercard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});

  final List<OrderModel> orders = [
    OrderModel(
      orderId: 'ORD-1023',
      date: '12 Sep 2025',
      status: 'Delivered',
      total: 45.99,
    ),
    OrderModel(
      orderId: 'ORD-1024',
      date: '15 Sep 2025',
      status: 'Processing',
      total: 23.50,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'My Orders',
          style: TextStyle(fontSize: 18.sp),
        ),
        centerTitle: true,
      ),
      body: orders.isEmpty
          ? _emptyState()
          : ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return OrderCard(order: orders[index]);
              },
            ),
    );
  }

  Widget _emptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_bag_outlined,
              size: 90.sp, color: Colors.grey),
          SizedBox(height: 16.h),
          Text(
            'No orders yet',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'Your orders will appear here',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
