import 'dart:convert';

import 'package:get/get.dart';
import 'package:licores_app/data/repository/popular_product_repo.dart';

import '../models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];

  // Get Method from Product Model
  List<dynamic> get popularProductList => _popularProductList;

  // Response from repo product method
  Future<void> getPopularProductList() async {
    Response response =  await popularProductRepo.getPopularProductList();

    print('got the products'); // This is right to this point

    if (response.statusCode == 200)

      // Init to null not to repeat
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(jsonDecode(response.body)).products); // --> Here the
               // Unhandled Exception: type 'Null' is not a subtype of type 'String'
      print(_popularProductList);
      update();
     /*else {
       print('not able to get product list json');
    }*/
  }
}