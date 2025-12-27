import 'package:Nectar/services/models/notificationsmodel.dart';
import 'package:Nectar/ui/widgets/notificationcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreen extends StatelessWidget {
   NotificationsScreen({super.key});

  final List<NotificationModel> notifications =  [
    NotificationModel(
      title: 'Order Delivered',
      message: 'Your order ORD-1023 has been delivered.',
      time: '2h ago',
      icon: Icon(Icons.local_shipping_outlined),
    ),
    NotificationModel(
      title: 'Promo Available',
      message: 'Get 20% off on your next order.',
      time: '1d ago',
      icon: Icon(Icons.card_giftcard),
      isRead: true,
    ),
    NotificationModel(
      title: 'Payment Successful',
      message: 'Payment for ORD-1024 was successful.',
      time: '2d ago',
      icon: Icon(Icons.credit_card),
      isRead: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(fontSize: 18.sp),
        ),
        centerTitle: true,
      ),
      body: notifications.isEmpty
          ? _emptyState()
          : ListView.separated(
              padding: EdgeInsets.all(16.w),
              itemCount: notifications.length,
              separatorBuilder: (_, __) =>
                  SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                return NotificationCard(
                  notification: notifications[index],
                );
              },
            ),
    );
  }

  Widget _emptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_none,
              size: 90.sp, color: Colors.grey),
          SizedBox(height: 16.h),
          Text(
            'No notifications yet',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'We’ll notify you when something arrives',
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
