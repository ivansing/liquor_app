import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:licores_app/utils/colors.dart';
import 'package:licores_app/utils/dimensions.dart';
import 'package:licores_app/widgets/app_column.dart';
import 'package:licores_app/widgets/big_text.dart';
import 'package:licores_app/widgets/icon_and_text_widget.dart';

import '../../widgets/small_text.dart';




class LiquorPageBody extends StatefulWidget {
  const LiquorPageBody({Key? key}) : super(key: key);

  @override
  State<LiquorPageBody> createState() => _LiquorPageBodyState();
}

class _LiquorPageBodyState extends State<LiquorPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  // variables to build the slider effects animation
  var _currPageValue = 0.0;

  double _scaleFactor = 0.8;
  double _height= Dimensions.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
          _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Slider section Header
        Container(
      // Header Background Color
      color: Colors.white24,
      height: Dimensions.pageView,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position){
            return _buildPageItem(position);
          }),
       ),
        // Dots container
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        // Categories Text
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Categorias"),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color:Colors.black26),
              ),
              SizedBox(width: Dimensions.width10),
              // Popular text
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: SmallText(text: "Variedad Licores"),
              ),
              // list of liquor and images

            ],
          ),
        ),

          // Errors from this point

        ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height20),
                  child: Row(
                    children: [
                      // Image section
                      Container(
                        width:Dimensions.listViewImgSize,
                        height: Dimensions.listViewImgSize,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/image/antioqueno_azul.jpg"
                                )
                            )
                        ),
                      ),
                      // Text container
                      Expanded(
                          child: Container(
                            height: Dimensions.listViewImgSize,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(Dimensions.radius20),
                                    bottomRight: Radius.circular(Dimensions.radius20)
                                ),
                                color: Colors.purpleAccent
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(text: "El mejor aguardiente de Antioquia"),
                                  SizedBox(height: Dimensions.height10,),
                                  SmallText(text: "Descripción de este aguardiente"),
                                  SizedBox(height: Dimensions.height10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconAndTextWidget(icon: Icons.circle_sharp,
                                          text: "Normal",
                                          iconColor: AppColors.iconColor1),
                                      IconAndTextWidget(icon: Icons.location_on,
                                          text: "2.5km",
                                          iconColor: AppColors.mainColor),
                                      IconAndTextWidget(icon: Icons.access_time_rounded,
                                          text: "26min",
                                          iconColor: AppColors.iconColor2)
                                    ],
                                  )
                                ],
                              ),
                            ),
                         ),
                        )
                    ],
                  ),
                );
              }),

        // list of liquors and images

      ],
    );
  }

  // Header Slider Section
  Widget _buildPageItem(int index) {
    // To scale the images from 100% to 80% effects animations
    Matrix4 matrix = new Matrix4.identity();
    if(index==_currPageValue.floor()) {
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height * (1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    } else if(index == _currPageValue.floor()+1) {
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height * (1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    } else if(index == _currPageValue.floor()-1) {
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }
    
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven?Colors.grey:Colors.black26,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "assets/image/antioqueno_azul.jpg"
                  )
              )
          ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),

                  // Background Color Inside Box Header
                  color: Colors.purpleAccent,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFE8E8E8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5,0)
                    )
                  ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15, left: 15, right: 15),
                child: AppColumn(text: "Aguardiente Antioqueño"),
              )

            ),
          )
        ],
      ),
    );
  }
}
