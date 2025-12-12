import 'package:Nectar/services/providers/productsprovider.dart';
import 'package:flutter/material.dart';
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
                child: Text("No Items is Cart", style: TextStyle(fontSize: 18)),
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
                          height: 70,
                          width: 70,
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
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              cartitems[index]['stock'] == 1
                                  ? "In Stock"
                                  : "Out of Stock",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Image(
                                    image: (AssetImage(
                                      "lib/assets/icons/minusicon.png",
                                    )),
                                    height: 45,
                                    width: 45,
                                  ),
                                ),
                                Text("1", style: TextStyle(fontSize: 16)),
                                IconButton(
                                  onPressed: () {},
                                  icon: Image(
                                    image: (AssetImage(
                                      "lib/assets/icons/plusicon.png",
                                    )),
                                    height: 45,
                                    width: 45,
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
                            provider.removeproducttocart(
                              cartitems[index]['id'],
                            );
                          },
                          icon: Icon(Icons.close),
                        ),
                        Text(
                          "${cartitems[index]['price'].toString()} BDT",
                          style: TextStyle(fontSize: 18),
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
