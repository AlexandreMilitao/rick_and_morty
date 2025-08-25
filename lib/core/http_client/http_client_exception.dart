class HttpClientException {
  final String message;
  final int? statusCode;
  final dynamic errorData;

  HttpClientException({required this.message, this.statusCode, this.errorData});

  @override
  String toString() =>
      'HttpClientException: $message, Status Code: $statusCode, Error Data: $errorData';
}
