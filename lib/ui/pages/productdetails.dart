import 'package:Nectar/services/providers/getsingleproduct.dart';
import 'package:Nectar/services/providers/productsprovider.dart';
import 'package:Nectar/ui/widgets/rectangleroundedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        backgroundColor: Color(0xFFF2F3F2),
        automaticallyImplyLeading: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
      ),
      body: Consumer<Getsingleproduct>(
        builder: (_, provider, _) {
          List<Map<String, dynamic>> productinfo = provider.productinfo;
          return ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.only(
                    bottomRight: Radius.circular(40.r),
                    bottomLeft: Radius.circular(40).r,
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Color(0xFFF2F3F2)),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(15),
                        child: AspectRatio(
                          aspectRatio: 250 / 140,
                          child: Image(
                            image: AssetImage(productinfo[0]['image']),

                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 40,
                  ),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productinfo[0]['name'],
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Consumer<Productsprovider>(
                              builder: (_, provider, _) {
                                List<Map<String, dynamic>> favlist =
                                    provider.favorite;
                                final exists = favlist.any(
                                  (p) => p['id'] == widget.id,
                                );
                                return IconButton(
                                  onPressed: () {
                                    provider.addproducttofavorite(widget.id);
                                  },
                                  icon: Icon(
                                    size: 24.dg,
                                    exists
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),

                        Text(
                          productinfo[0]['stock'] == 1
                              ? "In Stock"
                              : "Out of Stock",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.remove),
                                ),
                                Text("1", style: TextStyle(fontSize: 16.sp)),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add),
                                ),
                              ],
                            ),
                            Text(
                              "${productinfo[0]['price'].toString()} BDT",
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(height: 1, color: Colors.grey.shade300),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Product Details:",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // IconButton(
                            //   onPressed: () {},
                            //   icon: Icon(Icons.keyboard_arrow_down_sharp),
                            // ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          productinfo[0]['desc'],
                          style: TextStyle(fontSize: 14.sp),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5.h),
                        Container(height: 1, color: Colors.grey.shade300),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Nutritions",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            Row(
                              children: [
                                Text(
                                  productinfo[0]['nutrition'].toString(),
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.keyboard_arrow_right),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(height: 1, color: Colors.grey.shade300),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Review", style: TextStyle(fontSize: 14.sp)),
                            Row(
                              children: [
                                Icon(Icons.star, color: Color(0xFFF3603F)),
                                Icon(Icons.star, color: Color(0xFFF3603F)),
                                Icon(Icons.star, color: Color(0xFFF3603F)),
                                Icon(Icons.star, color: Color(0xFFF3603F)),
                                Icon(Icons.star, color: Color(0xFFF3603F)),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.keyboard_arrow_right),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Container(height: 1, color: Colors.grey.shade300),
                        SizedBox(height: 22.h),
                        Rectangleroundedbutton(
                          buttonName: "Add To Basket",
                          buttonbgcolor: Color(0xFF53B175),
                          callback: () {
                            Provider.of<Productsprovider>(
                              context,
                              listen: false,
                            ).addproducttocart(widget.id);
                          },
                        ),
                      ],
                    ),
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
