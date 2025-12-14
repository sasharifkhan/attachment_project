import 'package:Nectar/services/providers/productsprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "My Cart",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade300, height: 2.0),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Consumer<Productsprovider>(
          builder: (_, provider, _) {
            List<Map<String, dynamic>> cartitems = provider.cart;
            if (cartitems.isEmpty) {
              return Center(
                child: Text(
                  "No Items is Cart",
                  style: TextStyle(fontSize: 18.sp),
                ),
              );
            }
            return ListView.separated(
              itemCount: cartitems.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => SizedBox(
                height: 157,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage(cartitems[index]['image']),
                          height: 70.dg,
                          width: 70.dg,
                        ),
                        SizedBox(width: 18),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartitems[index]['name'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              cartitems[index]['stock'] == 1
                                  ? "In Stock"
                                  : "Out of Stock",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Image(
                                    image: (AssetImage(
                                      "assets/icons/minusicon.png",
                                    )),
                                    height: 35.dg,
                                    width: 35.dg,
                                  ),
                                ),
                                Text("1", style: TextStyle(fontSize: 16.sp)),
                                IconButton(
                                  onPressed: () {},
                                  icon: Image(
                                    image: (AssetImage(
                                      "assets/icons/plusicon.png",
                                    )),
                                    height: 35.dg,
                                    width: 35.dg,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            bool status = provider.removeproducttocart(
                              cartitems[index]['id'],
                            );
                            if (status == true) {
                              Fluttertoast.showToast(
                                msg: "Product removed from Cart",
                                gravity: ToastGravity.TOP,
                              );
                            }
                          },
                          icon: Icon(Icons.close),
                        ),
                        Text(
                          "${cartitems[index]['price'].toString()} BDT",
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              separatorBuilder: (BuildContext context, int index) {
                return Divider(height: 2, color: Colors.grey.shade300);
              },
            );
          },
        ),
      ),
    );
  }
}
