// ignore_for_file: avoid_print

import 'package:Nectar/services/apiservices/apirequest/userregister.dart';
import 'package:Nectar/ui/pages/loginpage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:Nectar/logic/auth/providerdata.dart';
import 'package:Nectar/ui/pages/selectlocation.dart';
import 'package:Nectar/ui/widgets/plainedtextfield.dart';
import 'package:Nectar/ui/widgets/rectangleroundedbutton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Singuppage extends StatefulWidget {
  const Singuppage({super.key});

  @override
  State<Singuppage> createState() => _SinguppageState();
}

class _SinguppageState extends State<Singuppage> {
  var signupUserphone = TextEditingController();
  var signupUserfullname = TextEditingController();
  var signupEmail = TextEditingController();
  var signupPassword = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_page_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  top: 40.h,
                  bottom: 50.h,
                ),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Image(
                            image: AssetImage(
                              "assets/icons/nectar_icon_red.png",
                            ),
                            height: 50.dg,
                            width: 42.dg,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Sign Up", style: TextStyle(fontSize: 22.sp)),
                            Text(
                              "Enter your credentials to continue",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Full Name",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            Plainedtextfield(
                              keyboardType: TextInputType.name,
                              controller: signupUserfullname,
                              textboxHintText: "Enter your full name.",
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email", style: TextStyle(fontSize: 15.sp)),
                            Plainedtextfield(
                              keyboardType: TextInputType.emailAddress,
                              controller: signupEmail,
                              textboxHintText: "email@example.com",
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Phone", style: TextStyle(fontSize: 15.sp)),
                            Plainedtextfield(
                              keyboardType: TextInputType.number,
                              controller: signupUserphone,
                              textboxHintText: "+8801xxxxxxxx",
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Password", style: TextStyle(fontSize: 15.sp)),
                            Consumer<Providerdata>(
                              builder: (ctx, provider, child) {
                                bool passwordshowdetais =
                                    provider.passwordshowloigndetaisreg;
                                return Plainedtextfield(
                                  keyboardType: TextInputType.visiblePassword,
                                  callback: () {
                                    provider.tooglePasswordShowHideReg();
                                  },
                                  obs: passwordshowdetais,
                                  controller: signupPassword,
                                  textboxHintText: "*********",
                                  textboxIcon: passwordshowdetais == false
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off),
                                );
                              },
                            ),
                            SizedBox(height: 30.h),
                            Consumer<Providerdata>(
                              builder: (ctx, provider, _) {
                                String message = provider.message;
                                return Text(
                                  message,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                  ),
                                );
                              },
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "By continuing you agree to our ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Terms of Service",
                                    style: TextStyle(
                                      color: Color(0xFF53B175),
                                      fontSize: 14.sp,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                  ),
                                  TextSpan(
                                    text: " and ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Privacy Policy.",
                                    style: TextStyle(
                                      color: Color(0xFF53B175),
                                      fontSize: 14.sp,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30),
                          ],
                        ),

                        Consumer<Providerdata>(
                          builder: (ctx, provider, _) {
                            return Rectangleroundedbutton(
                              buttonName: 'Sign Up',
                              buttonbgcolor: Color(0xFF53B175),
                              callback: () async {
                                if (signupUserfullname.text.isNotEmpty &&
                                    signupEmail.text.isNotEmpty &&
                                    signupPassword.text.isNotEmpty &&
                                    signupUserphone.text.isNotEmpty) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  var message = await Userregister()
                                      .userregister(
                                        signupUserfullname.text,
                                        signupEmail.text,
                                        signupPassword.text,
                                        signupUserphone.text,
                                      );

                                  provider.registrationcheck(message);
                                  setState(() {
                                    isLoading = false;
                                  });
                                  if (message == 'Registration successful') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Selectlocation(),
                                      ),
                                    );
                                  }
                                }
                              },
                            );
                          },
                        ),
                        SizedBox(height: 30),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Already have an account? ",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "Login",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Color(0xFF53B175),
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Loginpage(),
                                        ),
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (isLoading == true)
            Container(
              decoration: BoxDecoration(color: Colors.black45),
              child: Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
