import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:licores_app/pages/home/liquor_page_body.dart';
import 'package:licores_app/utils/colors.dart';
import 'package:licores_app/utils/dimensions.dart';
import 'package:licores_app/widgets/small_text.dart';

import '../../widgets/big_text.dart';

class MainLiquorPage extends StatefulWidget {
  const MainLiquorPage({Key? key}) : super(key: key);

  @override
  State<MainLiquorPage> createState() => _MainLiquorPageState();
}

class _MainLiquorPageState extends State<MainLiquorPage> {
  @override
  Widget build(BuildContext context) {
    //print("current height is " + MediaQuery.of(context).size.height.toString());
    return Scaffold(
      backgroundColor: Colors.white24,
      body: Column(
        children: [
          // Header
          Container(

            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Ciudad", color: Colors.white),
                      Row(
                        children: [
                          SmallText(text: "Bogota", color: Colors.white,),
                          Icon(Icons.arrow_drop_down_rounded, color: Colors.white,)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      child: Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: Colors.purpleAccent,
                      ),
                    ),
                  )
                ],

              ),
            ),
          ),
          // Body
          Expanded(child: SingleChildScrollView(
            child: LiquorPageBody(),
          )),
        ],
      ),
    );
  }
}
