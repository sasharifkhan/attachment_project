import 'package:flutter/material.dart';
import 'package:Nectar/ui/pages/loginpage.dart';
import 'package:Nectar/ui/widgets/rectangleroundedbutton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboardingscreen extends StatelessWidget {
  const Onboardingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboarding_bg_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 60.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(
                image: AssetImage("assets/icons/nectar_icon.png"),
                height: 48.dg,
                width: 38.dg,
              ),
              SizedBox(height: 10.h),
              Text(
                "Welcome\nto our store",
                style: TextStyle(fontSize: 35.sp, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Text(
                "Ger your groceries in as fast as one hour",
                style: TextStyle(fontSize: 16.sp, color: Colors.grey),
              ),
              SizedBox(height: 25.h),
              Rectangleroundedbutton(
                buttonName: "Get Started",
                buttonbgcolor: Color(0xFF53B175),
                callback: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Loginpage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
