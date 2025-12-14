import 'package:Nectar/services/providers/productsprovider.dart';
import 'package:Nectar/ui/pages/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Categoriesproduct extends StatefulWidget {
  final String categoriesname;
  const Categoriesproduct({super.key, required this.categoriesname});

  @override
  State<Categoriesproduct> createState() => _CategoriesproductState();
}

class _CategoriesproductState extends State<Categoriesproduct> {
  @override
  void initState() {
    super.initState();
    Provider.of<Productsprovider>(
      context,
      listen: false,
    ).updateandsavecategories(widget.categoriesname);
  }

  @override
  Widget build(BuildContext context) {
    // print(categoriesname);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            widget.categoriesname,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.filter_list))],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
        child: Consumer<Productsprovider>(
          builder: (_, provider, _) {
            List<Map<String, dynamic>> categoriesproducts =
                provider.cateoriesproduct;
            return GridView.builder(
              itemCount: categoriesproducts.length,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisExtent: 250,
                mainAxisSpacing: 15.h,
                crossAxisSpacing: 15.w,
                childAspectRatio: 0.75,
                maxCrossAxisExtent: 250,
              ),
              itemBuilder: (context, index) => Container(
                height: 250,
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
                              builder: (context) => Productdetails(
                                id: categoriesproducts[index]['id'],
                              ),
                            ),
                          );
                        },
                        child: Center(
                          child: AspectRatio(
                            aspectRatio: 200 / 80,
                            child: Image(
                              image: AssetImage(
                                categoriesproducts[index]['image'],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        categoriesproducts[index]['name'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        categoriesproducts[index]['stock'] == 1
                            ? "In Stock"
                            : "Out of Stock",
                        style: TextStyle(fontSize: 14),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${categoriesproducts[index]['price'].toString()} BDT",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              bool status =
                                  Provider.of<Productsprovider>(
                                    context,
                                    listen: false,
                                  ).addproducttocart(
                                    categoriesproducts[index]['id'],
                                  );
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
          },
        ),
      ),
    );
  }
}
