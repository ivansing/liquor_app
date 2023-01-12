import 'package:get/get.dart';
import 'package:licores_app/data/api/api_client.dart';

// Import data from Internet with GetxService Class
class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
      return await apiClient.getData("/api/v1/products/popular");

  }
}