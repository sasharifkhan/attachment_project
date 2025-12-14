import 'package:Nectar/logic/applogic/appscreenswitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BottomNavItems extends StatelessWidget {
  const BottomNavItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Appscreenswitch>(
      builder: (ctx, provider, _) {
        return Container(
          height: 100.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Color(0xFF53B175),
              backgroundColor: Colors.white,
              currentIndex: provider.selectedIndex,
              onTap: (index) => provider.appscreenswitch(index),
              items: [
                BottomNavigationBarItem(
                  label: "Shop",
                  icon: ImageIcon(
                    AssetImage("assets/icons/shop.png"),
                    size: 24,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Explore",
                  icon: ImageIcon(
                    AssetImage("assets/icons/explore.png"),
                    size: 24,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Cart",
                  icon: ImageIcon(
                    AssetImage("assets/icons/cart.png"),
                    size: 24,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Favorite",
                  icon: ImageIcon(
                    AssetImage("assets/icons/favorite.png"),
                    size: 24,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Account",
                  icon: ImageIcon(
                    AssetImage("assets/icons/account.png"),
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
