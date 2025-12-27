import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDetailsScreen extends StatefulWidget {
  const MyDetailsScreen({super.key});

  @override
  State<MyDetailsScreen> createState() => _MyDetailsScreenState();
}

class _MyDetailsScreenState extends State<MyDetailsScreen> {
  final TextEditingController nameController =
      TextEditingController(text: 'John Doe');
  final TextEditingController emailController =
      TextEditingController(text: 'john@email.com');
  final TextEditingController phoneController =
      TextEditingController(text: '+880 123456789');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'My Details',
          style: TextStyle(fontSize: 18.sp),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20.w),
        children: [
          _profileImage(),
          SizedBox(height: 24.h),
          _inputField(
            label: 'Full Name',
            controller: nameController,
            icon: Icons.person_outline,
          ),
          SizedBox(height: 16.h),
          _inputField(
            label: 'Email',
            controller: emailController,
            icon: Icons.email_outlined,
            enabled: false,
          ),
          SizedBox(height: 16.h),
          _inputField(
            label: 'Phone',
            controller: phoneController,
            icon: Icons.phone_outlined,
          ),
          SizedBox(height: 32.h),
          _saveButton(),
        ],
      ),
    );
  }

  Widget _profileImage() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 48.r,
            backgroundImage:
                const AssetImage('assets/icons/profile.png'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: const Color(0xFF53B175),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.camera_alt,
                size: 16.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    bool enabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 6.h),
        TextField(
          controller: controller,
          enabled: enabled,
          style: TextStyle(fontSize: 14.sp),
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _saveButton() {
    return SizedBox(
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF53B175),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
        onPressed: () {
          // Save profile logic (Provider / API)
        },
        child: Text(
          'Save Changes',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
