import 'package:Nectar/services/models/addressmode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressCard extends StatelessWidget {
  final AddressModel address;

  const AddressCard({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 22.sp),
              SizedBox(width: 8.w),
              Text(
                address.title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              if (address.isDefault) _defaultBadge(),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            address.address,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: 14.h),
          Row(
            children: [
              TextButton.icon(
                onPressed: () {
                  // Edit Address
                },
                icon: Icon(Icons.edit, size: 16.sp),
                label: Text(
                  'Edit',
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
              const Spacer(),
              Icon(Icons.arrow_forward_ios, size: 14.sp),
            ],
          ),
        ],
      ),
    );
  }

  Widget _defaultBadge() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF53B175).withOpacity(0.15),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        'Default',
        style: TextStyle(
          fontSize: 12.sp,
          color: const Color(0xFF53B175),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
