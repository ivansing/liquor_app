import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:licores_app/pages/home/main_liquor_page.dart';
//import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';


import '../../utils/colors.dart';
import '../cart/cart_history.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  //late PersistentTabController _controller;


  String inicio = "Inicio";

  List pages = [
    MainLiquorPage(),
    Container(child: Center(child: Text("Proxima Pagina"))),
    CartHistory(),
    Container(child: Center(child: Text("Proxima proxima proxima Pagina"))),
  ];

  void onTapNav (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /*@override
  void initStat() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }*/

  /*List<Widget> _buildScreens() {
    return [
      MainLiquorPage(),
      Container(child: Center(child: Text("Proxima Pagina"))),
      Container(child: Center(child: Text("Proxima prixima Pagina"))),
      Container(child: Center(child: Text("Proxima proxima proxima Pagina"))),
    ];
  }*/

  /*List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Inicio"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.circle_grid_3x3),
        title: ("Categorias"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart_fill),
        title: ("Carrito"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("Perfil"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }*/

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

  /*@override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }*/

}
