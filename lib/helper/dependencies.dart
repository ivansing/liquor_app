import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:licores_app/controllers/popular_product_controller.dart';
import 'package:licores_app/data/api/api_client.dart';
import 'package:licores_app/data/repository/popular_product_repo.dart';

// < =========== Load dependencies ============ >

Future<void> init() async {
  // Init ApiClient
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://www.dbestech.com"));

  // Init all Repositories
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  // Init all Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}