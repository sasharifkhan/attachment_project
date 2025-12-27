import 'package:Nectar/services/models/addressmode.dart';
import 'package:Nectar/ui/widgets/addresscard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryAddressScreen extends StatelessWidget {
  DeliveryAddressScreen({super.key});

  final List<AddressModel> addresses = [
    AddressModel(
      title: 'Home',
      address: 'House 12, Road 5, Dhanmondi, Dhaka',
      isDefault: true,
    ),
    AddressModel(
      title: 'Office',
      address: 'Level 4, Software Park, Mirpur',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Delivery Address',
          style: TextStyle(fontSize: 18.sp),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.w),
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          return AddressCard(address: addresses[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF53B175),
        onPressed: () {
          // Add Address page navigation
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
