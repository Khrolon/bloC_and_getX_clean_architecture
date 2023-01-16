import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

abstract class HttpClient extends GetConnect {
  Future<HttpResponse> httpGet(String url);
  Future<HttpResponse> httpPost(String url,
      {required Map<String, dynamic> body});
}

class HttpResponse {
  final dynamic data;
  final int statusCode;
  HttpResponse({
    required this.data,
    required this.statusCode,
  });
}

class HttpProvider extends HttpClient {
  @override
  Future<HttpResponse> httpGet(String url) async {
    var token = GetStorage().read('web_token'),
        headers = {'Authorization': "Bearer $token"};

    final response = await get(
      url,
      headers: headers,
    );
    return HttpResponse(data: response.body, statusCode: response.statusCode!);
  }

  @override
  Future<HttpResponse> httpPost(String url,
      {required Map<String, dynamic> body}) async {
    final response = await post(url, body);
    return HttpResponse(data: response.body, statusCode: response.statusCode!);
  }
}
