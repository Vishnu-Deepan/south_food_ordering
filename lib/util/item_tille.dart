import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final String itemFlavor;
  final String itemPrice;
  final Color itemColor;
  final String imageName;

  const ItemTile({
    Key? key,
    required this.itemFlavor,
    required this.itemPrice,
    required this.itemColor,
    required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card( // Wrap with Card widget
      color: itemColor.withOpacity(0.7), // Set background color
      elevation: 4, // Add elevation for shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Stack(
              children: [
                // Item image
                Container(
                  width: double.infinity,
                  height: 120, // Adjust the height as needed
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(imageName),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Price overlay
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: itemColor.withOpacity(0.7),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      '₹' + itemPrice,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 8,),
            // Item details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemFlavor,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white, // Text color matches background
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}