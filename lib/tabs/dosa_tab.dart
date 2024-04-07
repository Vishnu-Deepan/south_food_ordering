import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../util/item_tille.dart';

class DosaTab extends StatefulWidget {
  @override
  _DosaTabState createState() => _DosaTabState();
}

class _DosaTabState extends State<DosaTab> {
  List itemsOnSale = [];

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    final List<dynamic> items = await ItemModel.fetchItems();
    setState(() {
      itemsOnSale = items
          .asMap()
          .map((index, item) => MapEntry(
        index,
        [
          item['flavor'],
          item['price'].toString(),
          getColor(index), // Pass the index here
          item['image']
        ],
      ))
          .values
          .toList();
    });

  }

  // Function to repeat colors every four tiles
  Color getColor(int index) {
    switch (index % 4) {
      case 0:
        return Colors.brown;
      case 1:
        return Colors.pink;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.red;
      default:
        return Colors.black; // Default color
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemsOnSale.length,
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return ItemTile(
          itemFlavor: itemsOnSale[index][0],
          itemPrice: itemsOnSale[index][1],
          itemColor: itemsOnSale[index][2],
          imageName: itemsOnSale[index][3],
        );
      },
    );
  }
}
