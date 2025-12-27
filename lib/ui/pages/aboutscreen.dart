import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'About',
          style: TextStyle(fontSize: 18.sp),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20.w),
        children: [
          _appHeader(),
          SizedBox(height: 24.h),
          _aboutSection(),
          SizedBox(height: 24.h),
          _infoTile(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
            onTap: () {},
          ),
          _divider(),
          _infoTile(
            icon: Icons.description_outlined,
            title: 'Terms & Conditions',
            onTap: () {},
          ),
          _divider(),
          _infoTile(
            icon: Icons.info_outline,
            title: 'App Version',
            trailing: Text(
              'v1.0.0',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appHeader() {
    return Column(
      children: [
        Container(
          width: 90.w,
          height: 90.w,
          decoration: BoxDecoration(
            color: const Color(0xFF53B175).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.shopping_cart,
            size: 44.sp,
            color: const Color(0xFF53B175),
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          'Nectar',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Fresh groceries delivered to your door',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey.shade600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _aboutSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Text(
        'Nectar is your trusted grocery delivery app, offering fresh '
        'products, fast delivery, and seamless shopping experience. '
        'We aim to make your daily shopping easier and faster.',
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.grey.shade700,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _infoTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        child: Row(
          children: [
            Icon(icon, size: 22.sp),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
            trailing ??
                Icon(Icons.arrow_forward_ios, size: 14.sp),
          ],
        ),
      ),
    );
  }

  Widget _divider() =>
      Divider(height: 1.h, color: Colors.grey.shade300);
}
