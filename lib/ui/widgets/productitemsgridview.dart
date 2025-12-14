// import 'package:Nectar/services/models/allproductmodel.dart';
import 'package:Nectar/services/providers/productsprovider.dart';
import 'package:Nectar/ui/pages/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ProductItemsGridview extends StatefulWidget {
  final List<Map<String, dynamic>> productmodel;
  const ProductItemsGridview({super.key, required this.productmodel});

  @override
  State<ProductItemsGridview> createState() => _ProductItemsGridviewState();
}

class _ProductItemsGridviewState extends State<ProductItemsGridview> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: widget.productmodel.length,
      padding: EdgeInsets.all(10),
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 20.w,
        childAspectRatio: 0.75,
        maxCrossAxisExtent: 250,
      ),
      itemBuilder: (context, index) => Container(
        // height: 1000,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFFE2E2E2)),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Productdetails(id: widget.productmodel[index]['id']),
                    ),
                  );
                },
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 150 / 80,
                    child: Image(
                      image: AssetImage(widget.productmodel[index]['image']),
                    ),
                  ),
                ),
              ),
              Text(
                widget.productmodel[index]['name'],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.productmodel[index]['stock'] == 1
                    ? "In Stock"
                    : "Out of Stock",
                style: TextStyle(fontSize: 12.sp),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.productmodel[index]['price'].toString()} BDT",
                    style: TextStyle(fontSize: 13.sp, color: Colors.black),
                  ),
                  IconButton(
                    onPressed: () {
                      bool status = Provider.of<Productsprovider>(
                        context,
                        listen: false,
                      ).addproducttocart(widget.productmodel[index]['id']);
                      if (status == true) {
                        Fluttertoast.showToast(
                          msg: "Product added to Cart",
                          gravity: ToastGravity.TOP,
                        );
                      } else if (status == false) {
                        Fluttertoast.showToast(
                          msg: "Product already added to Cart",
                          gravity: ToastGravity.TOP,
                        );
                      }
                    },
                    icon: Image(
                      image: AssetImage("assets/icons/add_button.png"),
                      height: 35,
                      width: 35,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
