import 'package:Nectar/logic/providers/locationprovider.dart';
import 'package:Nectar/services/providers/productsprovider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:Nectar/ui/widgets/productitemsgridview.dart';
import 'package:Nectar/ui/widgets/searchbox.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Shopscreen extends StatefulWidget {
  const Shopscreen({super.key});

  @override
  State<Shopscreen> createState() => _ShopscreenState();
}

class _ShopscreenState extends State<Shopscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
          child: Column(
            children: [
              Image(
                image: AssetImage("lib/assets/icons/nectar_icon_red.png"),
                height: 28.dg,
                width: 22.dg,
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("lib/assets/icons/location_icon.png"),
                    height: 16.dg,
                    width: 14.dg,
                  ),
                  SizedBox(width: 10),
                  Consumer<Locationprovider>(
                    builder: (ctx, provider, _) {
                      provider.setlicationfromgetstorate();
                      String location = provider.locationdetails;
                      return Text(location, style: TextStyle(fontSize: 14.sp));
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              const Searchbox(),
              SizedBox(height: 5.h),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 115,
                      width: double.infinity,
                      child: CarouselSlider(
                        items: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusGeometry.circular(18),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(18),
                              child: Image(
                                image: AssetImage(
                                  "lib/assets/images/banner.png",
                                ),
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          autoPlay: true,
                          height: 130.h,
                          viewportFraction: 1,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Products",
                          style: TextStyle(
                            fontSize: 22.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Consumer<Productsprovider>(
                      builder: (_, provider, _) {
                        List<Map<String, dynamic>> allproducts =
                            provider.allproducts;
                        return ProductItemsGridview(productmodel: allproducts);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
