abstract class BaseApiService {

    final String baseUrl = "dev.fastbeetle.com";


  Future<dynamic> getResponse(String url, {Map<String, String>? queryString});

  Future<dynamic> sendRequest(String url, String params);

}