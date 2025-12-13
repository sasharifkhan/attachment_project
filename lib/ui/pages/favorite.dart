import 'package:Nectar/services/providers/productsprovider.dart';
import 'package:Nectar/ui/pages/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Favorite",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.grey.shade300, height: 2),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Consumer<Productsprovider>(
          builder: (_, provider, _) {
            List<Map<String, dynamic>> favlist = provider.favorite;
            if (favlist.isEmpty) {
              return Center(
                child: Text(
                  "No Items in Favorite",
                  style: TextStyle(fontSize: 18.sp),
                ),
              );
            }
            return ListView.separated(
              itemCount: favlist.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => Dismissible(
                key: Key(favlist[index]['id'].toString()),
                onDismissed: (direction) {
                  provider.addproducttofavorite(favlist[index]['id']);
                },
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  minTileHeight: 80,
                  leading: Image(
                    image: AssetImage(favlist[index]['image']),
                    height: 55,
                    width: 55,
                  ),
                  title: Text(favlist[index]['name']),
                  subtitle: Text(
                    favlist[index]['stock'] == 1 ? "In Stock" : "Out of Stock",
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${favlist[index]['price'].toString()} BDT",
                        style: TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Productdetails(id: favlist[index]['id']),
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_right, size: 40),
                      ),
                    ],
                  ),
                ),
              ),
              separatorBuilder: (BuildContext context, int index) {
                return Divider(height: 2);
              },
            );
          },
        ),
      ),
    );
  }
}
