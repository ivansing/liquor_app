import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:licores_app/pages/home/main_liquor_page.dart';

import '../../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  String inicio = "Inicio";

  List pages = [
    MainLiquorPage(),
    Container(child: Center(child: Text("Proxima Pagina"))),
    Container(child: Center(child: Text("Proxima prixima Pagina"))),
    Container(child: Center(child: Text("Proxima proxima proxima Pagina"))),
  ];

  void onTapNav (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purpleAccent,
        unselectedItemColor: AppColors.mainColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items:  [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: inicio,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: inicio,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: inicio,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: inicio,
          )
        ],
      ),
    );
  }
}
