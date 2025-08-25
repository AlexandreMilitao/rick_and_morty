abstract class CustomHttpClient {
  Future<dynamic> get(String url, {Map<String, dynamic>? queryParameters});
  Future<dynamic> post(String url, {Map<String, dynamic>? queryParameters});
  Future<dynamic> put(String url, {Map<String, dynamic>? queryParameters});
  Future<dynamic> delete(String url);
}
