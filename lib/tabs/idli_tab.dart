import 'package:flutter/material.dart';

import '../util/item_tille.dart';

class idliTab extends StatelessWidget {
  List itemsOnSale = [
    // [itemFlavor, itemPrice, itemColor, imageName]
    ["Choco", "92", Colors.brown, "assets/images/item-1.png"],
    ["Grape Ape", "80", Colors.pink, "assets/images/item-4.png"],
    ["Ice Cream", "36", Colors.blue, "assets/images/item-2.png"],
    ["Strawberry", "45", Colors.red, "assets/images/item-3.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemsOnSale.length,
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.5
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