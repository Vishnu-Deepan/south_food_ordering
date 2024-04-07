import 'package:flutter/material.dart';
import 'package:donut_app/tabs/idli_tab.dart';
import 'package:donut_app/tabs/parotta_tab.dart';
import 'package:donut_app/tabs/jucie_tab.dart';
import 'package:donut_app/tabs/briyani_tab.dart';
import 'package:donut_app/util/my_tab.dart';

import '../tabs/dosa_tab.dart';

class BottomDrawer extends StatelessWidget {
  final Widget child;
  final double maxHeight;

  const BottomDrawer({super.key,
    required this.child,
    required this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: maxHeight,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, -3), // changes the direction of the shadow
          ),
        ],
      ),
      child: child,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // my tabs
  List<Widget> myTabs = [
    // donut tab
    const MyTab(
      iconPath: 'assets/icons/dosa.png',
    ),

    // burger tab
    const MyTab(
      iconPath: 'assets/icons/idli.png',
    ),

    // smoothie tab
    const MyTab(
      iconPath: 'assets/icons/briyani.png',
    ),

    // pancake tab
    const MyTab(
      iconPath: 'assets/icons/parotta.png',
    ),

    // pizza tab
    const MyTab(
      iconPath: 'assets/icons/juice.png',
    ),
  ];

  // Drawer items
  List<Widget> drawerItems = [
    ListTile(
      trailing: const Icon(Icons.person_outline_sharp, color: Colors.deepPurple), // Customize the icon color
      title: const Text(
        'Profile',
        style: TextStyle(
          color: Colors.black, // Customize the text color
          fontSize: 16, // Customize the font size
          fontWeight: FontWeight.bold, // Add font weight
        ),
      ),
      onTap: () {
        // Navigate to profile screen
      },
    ),
    ListTile(
      trailing: const Icon(Icons.favorite_border_rounded, color: Colors.deepPurple), // Customize the icon color
      title: const Text(
        'Favorites',
        style: TextStyle(
          color: Colors.black, // Customize the text color
          fontSize: 16, // Customize the font size
          fontWeight: FontWeight.bold, // Add font weight
        ),
      ),
      onTap: () {
        // Navigate to profile screen
      },
    ),
    ListTile(
      trailing: const Icon(Icons.history, color: Colors.deepPurple), // Customize the icon color
      title: const Text(
        'Order History',
        style: TextStyle(
          color: Colors.black, // Customize the text color
          fontSize: 16, // Customize the font size
          fontWeight: FontWeight.bold, // Add font weight
        ),
      ),
      onTap: () {
        // Navigate to order history screen
      },
    ),
    ListTile(
      trailing: const Icon(Icons.info_outline_rounded, color: Colors.deepPurple), // Customize the icon color
      title: const Text(
        'About',
        style: TextStyle(
          color: Colors.black, // Customize the text color
          fontSize: 16, // Customize the font size
          fontWeight: FontWeight.bold, // Add font weight
        ),
      ),
      onTap: () {
        // Navigate to about screen
      },
    ),
    ListTile(
      trailing: const Icon(Icons.logout_outlined, color: Colors.red), // Customize the icon color
      title: const Text(
        'Logout',
        style: TextStyle(
          color: Colors.red, // Customize the text color
          fontSize: 16, // Customize the font size
          fontWeight: FontWeight.bold, // Add font weight
        ),
      ),
      onTap: () {
        // Logout functionality
      },
    ),
  ];


  @override
  Widget build(BuildContext context) {
    // Calculate the maximum height of the drawer based on the number of items

    final double totalItemsHeight = drawerItems.length * 50; // Assuming each list tile is 50 pixels in height
    final double drawerHeight = totalItemsHeight*1.5;

    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "SaambarSwift",
            style: TextStyle(
              fontWeight: FontWeight.bold, // Make the text bold
              fontSize: 28,
              color: Color(0xFFFF9D52),// Increase the font size
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: IconButton(
                onPressed: () {
                  // Open bottom drawer
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return BottomDrawer(
                        maxHeight: drawerHeight,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: drawerItems,
                        ),
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.grey[800],
                  size: 36,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            // I want to eat
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 36,
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Taste of',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    ' South India',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    ' at Doorstep',
                    style: TextStyle(
                      fontSize: 16,


                    ),
                  ),
                ],
              ),
            ),

            // tab bar
            TabBar(tabs: myTabs),

            // tab bar view
            Expanded(
              child: TabBarView(
                children: [
                  // donut page
                  DosaTab(),

                  // burger page
                  idliTab(),

                  // smoothie page
                  briyaniTab(),

                  // pancake page
                  parottaTab(),

                  // pizza page
                  juiceTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}