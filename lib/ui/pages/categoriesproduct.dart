import 'package:Nectar/services/providers/productsprovider.dart';
import 'package:Nectar/ui/pages/productdetails.dart';
import 'package:flutter/material.dart';
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
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.filter_list))],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: Consumer<Productsprovider>(
          builder: (_, provider, _) {
            List<Map<String, dynamic>> categoriesproducts =
                provider.cateoriesproduct;
            return GridView.builder(
              itemCount: categoriesproducts.length,
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 250,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
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
                          child: Image(
                            image: AssetImage(
                              categoriesproducts[index]['image'],
                            ),
                            height: 80,
                            width: 99,
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
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          IconButton(
                            onPressed: () {
                              Provider.of<Productsprovider>(
                                context,
                                listen: false,
                              ).addproducttocart(
                                categoriesproducts[index]['id'],
                              );
                            },
                            icon: Image(
                              image: AssetImage(
                                "lib/assets/icons/add_button.png",
                              ),
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
          },
        ),
      ),
    );
  }
}
