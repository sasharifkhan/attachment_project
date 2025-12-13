import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Rectangleroundedbutton extends StatelessWidget {
  final String buttonName;
  final Image? buttonicon;
  final Color buttonbgcolor;
  final VoidCallback callback;

  const Rectangleroundedbutton({
    super.key,
    required this.buttonName,
    this.buttonicon,
    required this.buttonbgcolor,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 67.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(15),
          ),
          backgroundColor: buttonbgcolor,
        ),
        onPressed: () {
          callback();
        },
        child: buttonicon != null
            ? Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    buttonName,
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    textAlign: TextAlign.center,
                  ),
                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: buttonicon!,
                  ),
                ],
              )
            : SizedBox(
                width: double.infinity,
                child: Text(
                  buttonName,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
              ),
      ),
    );
  }
}
