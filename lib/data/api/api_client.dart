import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {

  // Init token to talk to server
  late String token;
  final String appBaseUrl;

  // Key values pairs data send headers
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    _mainHeaders = {
      'Content-type' : 'application/json; charset=UT8-8',
      'Authorization': 'Bearer $token',  // Bearer type auth token
    };
  }

  // Get method
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}