import 'package:get/get.dart';
import 'package:licores_app/data/repository/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];

  // The one to call as public method
  List<dynamic> get popularProductList => _popularProductList;

  // Response from repo product method
  Future<void> getPopularProductList() async {
    Response response =  await popularProductRepo.getPopularProductList();
    if(response.statusCode == 200) {
      // Init to null not to repeat
      _popularProductList = [];
      //_popularProductList.addAll();
      update();
    } else {

    }
  }
}