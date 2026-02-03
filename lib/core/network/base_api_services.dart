abstract class BaseApiServices {
  Future<dynamic> getApi(
    String baseUrl,
    String path,
    var payload,
    bool isBodyPresent,
  );

  Future<dynamic> postApi(String url, var payload, String baseUrl);
}
