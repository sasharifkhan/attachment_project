import 'package:Nectar/services/models/helpmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpScreen extends StatelessWidget {
   HelpScreen({super.key});

  final List<FaqModel> faqs =  [
    FaqModel(
      question: 'How do I place an order?',
      answer:
          'Browse products, add them to your cart, and proceed to checkout.',
    ),
    FaqModel(
      question: 'How can I track my order?',
      answer:
          'You can track your order from the Orders section in your account.',
    ),
    FaqModel(
      question: 'What payment methods are accepted?',
      answer:
          'We accept Visa, MasterCard, and digital wallets.',
    ),
    FaqModel(
      question: 'How do I contact support?',
      answer:
          'Use the contact options below to reach our support team.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Help & Support',
          style: TextStyle(fontSize: 18.sp),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          _contactSection(),
          SizedBox(height: 24.h),
          Text(
            'Frequently Asked Questions',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),
          ...faqs.map((faq) => _faqTile(faq)).toList(),
        ],
      ),
    );
  }

  Widget _contactSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Need Help?',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Contact our support team using any option below.',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: 14.h),
          Row(
            children: [
              _contactButton(
                icon: Icons.call,
                label: 'Call',
                onTap: () {},
              ),
              SizedBox(width: 12.w),
              _contactButton(
                icon: Icons.chat,
                label: 'Chat',
                onTap: () {},
              ),
              SizedBox(width: 12.w),
              _contactButton(
                icon: Icons.email,
                label: 'Email',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _contactButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: [
              Icon(icon, size: 22.sp),
              SizedBox(height: 6.h),
              Text(
                label,
                style: TextStyle(fontSize: 13.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _faqTile(FaqModel faq) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ExpansionTile(
        title: Text(
          faq.question,
          style: TextStyle(fontSize: 14.sp),
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(14.w),
            child: Text(
              faq.answer,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
