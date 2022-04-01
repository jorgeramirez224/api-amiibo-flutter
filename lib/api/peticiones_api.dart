import 'package:get/get.dart';

//https://amiiboapi.com/api/amiibo/
class PeticionesApi extends GetConnect {
  Future<Response> httpGet(
      {required String url, Map<String, dynamic>? query}) async {
    final response = await get(url, query: query);
    //print(response.body);
    return response;
  }
}
