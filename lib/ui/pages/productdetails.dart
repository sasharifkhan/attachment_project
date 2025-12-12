import 'package:Nectar/services/providers/getsingleproduct.dart';
import 'package:Nectar/services/providers/productsprovider.dart';
import 'package:Nectar/ui/widgets/rectangleroundedbutton.dart';
import 'package:flutter/material.dart';
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
          return Column(
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Color(0xFFF2F3F2)),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(15),
                        child: Image(
                          image: AssetImage(productinfo[0]['image']),

                          height: 200,
                          width: 330,
                          fit: BoxFit.fill,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productinfo[0]['name'],
                              style: TextStyle(fontSize: 24),
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
                          style: TextStyle(fontSize: 16),
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
                                Text("1", style: TextStyle(fontSize: 18)),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add),
                                ),
                              ],
                            ),
                            Text(
                              "${productinfo[0]['price'].toString()} BDT",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(height: 1, color: Colors.grey.shade300),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Product Details",
                              style: TextStyle(fontSize: 16),
                            ),
                            // IconButton(
                            //   onPressed: () {},
                            //   icon: Icon(Icons.keyboard_arrow_down_sharp),
                            // ),
                          ],
                        ),
                        Text(
                          productinfo[0]['desc'],
                          style: TextStyle(fontSize: 13),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(height: 1, color: Colors.grey.shade300),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Nutritions", style: TextStyle(fontSize: 16)),
                            Row(
                              children: [
                                Text(productinfo[0]['nutrition'].toString()),
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
                            Text("Review", style: TextStyle(fontSize: 16)),
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
