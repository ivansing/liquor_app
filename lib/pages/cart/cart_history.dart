import 'package:flutter/material.dart';
import 'package:licores_app/utils/colors.dart';
import 'package:licores_app/utils/dimensions.dart';
import 'package:licores_app/widgets/app_icon.dart';
import 'package:licores_app/widgets/big_text.dart';

import '../../widgets/small_text.dart';

class CartHistory extends StatefulWidget {
  const CartHistory({Key? key}) : super(key: key);



  @override
  State<CartHistory> createState() => _CartHistoryState();


}


class _CartHistoryState extends State<CartHistory> {



  @override
  Widget build(BuildContext context) {

    List<int> itemPerOrder = [2,3,3,2,5,7];
    itemPerOrder.toString();

    return Scaffold(

      body: Column(
        children: [
            Container(
              height: Dimensions.height10*10,
              color: AppColors.mainColor,
              width: double.maxFinite,
              padding: EdgeInsets.only(top: Dimensions.height45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BigText(text: "Historial Compras", color: Colors.white,),
                  AppIcon(icon: Icons.shopping_cart_outlined,
                    iconColor: AppColors.mainColor,
                    backgroundColor: AppColors.yellowColor,)
                ],
              ),
            ),
            Expanded(child: Container(
              height: Dimensions.height20*25,
              margin: EdgeInsets.only(
                  top: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20
              ),
              child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context, child: ListView(
                children: [
                  for(int i = 0; i < itemPerOrder.length; i++)
                    Container(
                      height: Dimensions.height30*4,
                      margin: EdgeInsets.only(bottom: Dimensions.height20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Have to pass it as BigText after dynamic DB
                          Text( "27/07/2022"),
                          SizedBox(height: Dimensions.height10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                children: List.generate(itemPerOrder[i], (index) {
                                  // Show Images
                                  return index <= 2? Container(
                                    height: Dimensions.height20*4,
                                    width: Dimensions.width20*4,
                                    margin: EdgeInsets.only(right: Dimensions.width10/2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "assets/image/antioqueno_azul.jpg"
                                            )
                                        )
                                    ),
                                  ): Container();
                                }),
                              ),
                              Container(

                                height: Dimensions.height20*4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SmallText(text: "Total", color: AppColors.titleColor,),
                                    BigText(text: itemPerOrder[i].toString()+" Articulos", color: AppColors.titleColor,),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: Dimensions.width10,
                                      vertical: Dimensions.height10/2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.radius15/3),
                                        border: Border.all(width: 1, color: AppColors.mainColor)
                                      ),

                                      child:  Text("Otro mas"),

                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )

                ],
              )),
            )
            )
        ],
      ),
    );
  }
}


