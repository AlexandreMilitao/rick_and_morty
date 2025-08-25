import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/http_client/custom_http_client.dart';
import 'package:rick_and_morty/core/http_client/http_client_exception.dart';

class DioHttpClient implements CustomHttpClient {
  final Dio _dio;

  DioHttpClient(this._dio);

  @override
  Future<dynamic> get(String url, {queryParameters}) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      throw HttpClientException(
        message: e.message ?? "Error ocurred",
        statusCode: e.response?.statusCode,
        errorData: e.response?.data,
      );
    } catch (e) {
      throw HttpClientException(message: e.toString());
    }
  }

  @override
  Future delete(String url) async {
    try {
      final response = await _dio.delete(url);
      return response.data;
    } on DioException catch (e) {
      throw HttpClientException(
        message: e.message ?? "Error ocurred",
        statusCode: e.response?.statusCode,
        errorData: e.response?.data,
      );
    } catch (e) {
      throw HttpClientException(message: e.toString());
    }
  }

  @override
  Future post(String url, {queryParameters}) async {
    try {
      final response = await _dio.post(url, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      throw HttpClientException(
        message: e.message ?? "Error ocurred",
        statusCode: e.response?.statusCode,
        errorData: e.response?.data,
      );
    } catch (e) {
      throw HttpClientException(message: e.toString());
    }
  }

  @override
  Future put(String url, {queryParameters}) async {
    try {
      final response = await _dio.put(url, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      throw HttpClientException(
        message: e.message ?? "Error ocurred",
        statusCode: e.response?.statusCode,
        errorData: e.response?.data,
      );
    } catch (e) {
      throw HttpClientException(message: e.toString());
    }
  }
}
