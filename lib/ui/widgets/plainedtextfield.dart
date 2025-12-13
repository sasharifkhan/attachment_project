import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Plainedtextfield extends StatelessWidget {
  final String textboxHintText;
  final Icon? textboxIcon;
  final TextEditingController? controller;
  final bool? obs;
  final VoidCallback? callback;
  final TextInputType keyboardType;

  const Plainedtextfield({
    super.key,
    required this.textboxHintText,
    this.textboxIcon,
    this.controller,
    this.obs,
    this.callback,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return textboxIcon != null
        ? TextField(
            style: TextStyle(fontSize: 14.sp),
            keyboardType: keyboardType,
            controller: controller,
            decoration: InputDecoration(
              hintText: textboxHintText,
              suffixIcon: IconButton(onPressed: callback, icon: textboxIcon!),
            ),
            obscureText: obs!,
          )
        : TextField(
            style: TextStyle(fontSize: 14.sp),
            controller: controller,
            decoration: InputDecoration(hintText: textboxHintText),
          );
  }
}
