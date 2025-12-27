import 'package:Nectar/services/providers/getsingleproduct.dart';
import 'package:Nectar/services/providers/productsprovider.dart';
import 'package:Nectar/ui/widgets/rectangleroundedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Productdetails extends StatefulWidget {
  final int id;
  const Productdetails({super.key, required this.id});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  @override
  void initState() {
    super.initState();
    Provider.of<Getsingleproduct>(
      context,
      listen: false,
    ).getsingleproduct(widget.id, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F3F2),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
        ],
      ),
      body: Consumer<Getsingleproduct>(
        builder: (_, provider, __) {
          final productinfo = provider.productinfo;

          /// ✅ SAFE CHECK
          if (productinfo.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          final product = productinfo[0];

          return Column(
            children: [
              /// ================= IMAGE SECTION =================
              Container(
                height: 260.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F3F2),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.r),
                    bottomRight: Radius.circular(40.r),
                  ),
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.asset(
                      product['image'],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              /// ================= DETAILS SECTION =================
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// NAME + FAVORITE
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              product['name'],
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Consumer<Productsprovider>(
                            builder: (_, provider, __) {
                              final exists = provider.favorite
                                  .any((p) => p['id'] == widget.id);

                              return IconButton(
                                icon: Icon(
                                  exists
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  final status = provider
                                      .addproducttofavorite(widget.id);
                                  Fluttertoast.showToast(
                                    msg: status
                                        ? "Added to Favorite"
                                        : "Removed from Favorite",
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: 6.h),

                      /// STOCK
                      Text(
                        product['stock'] == 1
                            ? "In Stock"
                            : "Out of Stock",
                        style: TextStyle(fontSize: 14.sp),
                      ),

                      SizedBox(height: 10.h),

                      /// QUANTITY + PRICE
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {},
                              ),
                              Text("1", style: TextStyle(fontSize: 16.sp)),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          Text(
                            "${product['price']} BDT",
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      Divider(),

                      /// DESCRIPTION
                      Text(
                        "Product Details",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        product['desc'],
                        style: TextStyle(fontSize: 14.sp),
                      ),

                      Divider(),

                      /// NUTRITION
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Nutritions", style: TextStyle(fontSize: 14.sp)),
                          Row(
                            children: [
                              Text(
                                product['nutrition'].toString(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_right),
                            ],
                          ),
                        ],
                      ),

                      Divider(),

                      /// REVIEW
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Review", style: TextStyle(fontSize: 14.sp)),
                          Row(
                            children: List.generate(
                              5,
                              (_) => const Icon(
                                Icons.star,
                                color: Color(0xFFF3603F),
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 30.h),

                      /// ADD TO CART
                      Rectangleroundedbutton(
                        buttonName: "Add To Basket",
                        buttonbgcolor: const Color(0xFF53B175),
                        callback: () {
                          final status =
                              Provider.of<Productsprovider>(
                            context,
                            listen: false,
                          ).addproducttocart(widget.id);

                          Fluttertoast.showToast(
                            msg: status
                                ? "Added to Cart"
                                : "Already in Cart",
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
