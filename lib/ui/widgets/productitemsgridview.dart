// import 'package:Nectar/services/models/allproductmodel.dart';
import 'package:Nectar/services/providers/productsprovider.dart';
import 'package:Nectar/ui/pages/productdetails.dart';
import 'package:flutter/material.dart';
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // mainAxisExtent: 174,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        crossAxisCount: 2,
        mainAxisExtent: 250,
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
                  child: Image(
                    image: NetworkImage(widget.productmodel[index]['image']),
                    height: 80,
                    width: 99,
                  ),
                ),
              ),
              Text(
                widget.productmodel[index]['name'],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.productmodel[index]['stock'] == 1
                    ? "In Stock"
                    : "Out of Stock",
                style: TextStyle(fontSize: 14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.productmodel[index]['price'].toString()} BDT",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  IconButton(
                    onPressed: () {
                      Provider.of<Productsprovider>(
                        context,
                        listen: false,
                      ).addproducttocart(widget.productmodel[index]['id']);
                    },
                    icon: Image(
                      image: AssetImage("lib/assets/icons/add_button.png"),
                      height: 45,
                      width: 45,
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
