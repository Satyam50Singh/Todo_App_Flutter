abstract class BaseApiServices {
  Future<dynamic> getApi(String baseUrl, String path);

  Future<dynamic> postApi(String url, var payload, String baseUrl);
}
