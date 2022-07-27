import 'package:flutter/material.dart';
import 'package:licores_app/pages/cart/cart_page.dart';
import 'package:licores_app/pages/home/home_page.dart';
import 'package:licores_app/pages/home/liquor_page_body.dart';
import 'package:licores_app/pages/home/main_liquor_page.dart';
import 'package:get/get.dart';
import 'package:licores_app/pages/liquor/category_liquor_detail.dart';
import 'package:licores_app/pages/liquor/popular_liquor_detail.dart';
import 'package:licores_app/pages/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: //MainLiquorPage()
           //PopularLiquorDetail()
           //CategoryLiquorDetail(),
            //CartPage()
           //SplashScreen(),
          HomePage(),
    );
  }
}

