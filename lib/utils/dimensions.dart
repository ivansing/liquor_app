import 'package:get/get.dart';
class Dimensions {

  // To access height and width properties dynamic
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  // Container and page slider pageView 737 height page
  static double pageView = screenHeight/2.3;
  static double pageViewContainer = screenHeight/3.35;
  static double pageViewTextContainer = screenHeight/6.1;

  // Dynamic height padding and margin
  static double height10 = screenHeight/73.4;
  static double height15 = screenHeight/49.1;
  static double height20 = screenHeight/36.8;
  static double height30 = screenHeight/24.5;
  static double height45 = screenHeight/16.3;

  // Dynamic width padding and margin
  static double width10 = screenHeight/73.4;
  static double width15 = screenHeight/49.1;
  static double width20 = screenHeight/36.8;
  static double width30 = screenHeight/24.5;

  // Fonts
  static double font16 = screenHeight/46;
  static double font20 = screenHeight/36.8;
  static double font26 = screenHeight/28.34;

  // Box radius page slide
  static double radius15 = screenHeight/49.1;
  static double radius20 = screenHeight/36.8;
  static double radius30 = screenHeight/24.5;

  // icon Size
  static double iconSize24 = screenHeight/30.7;
  static double iconSize16 = screenHeight/46;

  // listview size width 411 pixel 3
  static double listViewImgSize = screenWidth/3.2;
  static double listViewTextContSize = screenWidth/4.1;

  // Popular liquor
  static double popularLiquorImgSize = screenHeight/2.1;

  // bottom height
  static double bottomHeightBar = screenHeight/6.1;

}