import 'package:Nectar/services/models/paymentmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentCard extends StatelessWidget {
  final PaymentMethodModel payment;

  const PaymentCard({super.key, required this.payment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          _paymentIcon(),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      payment.title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    if (payment.isDefault) _defaultBadge(),
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                  payment.lastFour.isNotEmpty
                      ? '**** ${payment.lastFour}'
                      : 'Wallet',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 14.sp),
        ],
      ),
    );
  }

  Widget _paymentIcon() {
    IconData icon;

    switch (payment.type) {
      case 'card':
        icon = Icons.credit_card;
        break;
      case 'wallet':
        icon = Icons.account_balance_wallet;
        break;
      default:
        icon = Icons.payment;
    }

    return Container(
      width: 44.w,
      height: 44.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Icon(icon, size: 24.sp),
    );
  }

  Widget _defaultBadge() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 3.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF53B175).withOpacity(0.15),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        'Default',
        style: TextStyle(
          fontSize: 11.sp,
          color: const Color(0xFF53B175),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
