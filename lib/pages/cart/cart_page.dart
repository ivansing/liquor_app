

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:licores_app/utils/colors.dart';
import 'package:licores_app/utils/dimensions.dart';
import 'package:licores_app/widgets/big_text.dart';
import 'package:licores_app/widgets/small_text.dart';

import '../../widgets/app_icon.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Stack(

        children: [
          Positioned(

              top: Dimensions.height20*3,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purpleAccent
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child:  AppIcon(icon: Icons.arrow_back,
                          iconColor: Colors.white,
                          backgroundColor: Colors.purpleAccent,
                          iconSize: Dimensions.iconSize24
                      ),
                    ),



                    SizedBox(width: Dimensions.width20*5,),
                    AppIcon(icon: Icons.home_outlined,
                        iconColor: Colors.white,
                        backgroundColor: Colors.purpleAccent,
                        iconSize: Dimensions.iconSize24
                    ),
                    AppIcon(icon: Icons.shopping_cart,
                        iconColor: Colors.white,
                        backgroundColor: Colors.purpleAccent,
                        iconSize: Dimensions.iconSize24
                    )
                  ]

              )),
          Positioned(
              top: Dimensions.height20*5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                //color: Colors.purpleAccent,

                // Takeoff top padding from ListView builder default
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (_, index){
                        return Container(
                          width: double.maxFinite,
                          height: 100,
                          child: Row(
                            children: [
                              Container(
                                width: Dimensions.height20*5,
                                height: Dimensions.height20*5,
                                margin: EdgeInsets.only(bottom: Dimensions.height10),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "assets/image/antioqueno_azul.jpg"
                                        )
                                    ),
                                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                                    color: Colors.grey
                                ),
                              ),
                              SizedBox(width: Dimensions.width10,),
                              Expanded(child: Container(
                                height: Dimensions.height20*5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BigText(text: "Aguardiente Antioqueño Azul"),
                                    SmallText(text: "Promoción"),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigText(text: "\$35.000", color: Colors.purpleAccent,),
                                        Container(
                                          padding: EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height10, left: Dimensions.width10, right: Dimensions.width10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                                              color: Colors.purpleAccent
                                          ),
                                          child: Row(

                                            children: [
                                              Icon(Icons.remove, color: Colors.white,),
                                              SizedBox(width: Dimensions.width10/2,),
                                              BigText(text: "0",),
                                              SizedBox(width: Dimensions.width10/2,),
                                              Icon(Icons.add, color: AppColors.signColor,)
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        );
                      }),
                ),

              ))
        ],
      ),
    );
  }
}

