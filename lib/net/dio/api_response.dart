class ApiResponse<T> {
  int? statusCode;
  T? data;
  String? message;

  ApiResponse(
      {required this.statusCode, required this.data, required this.message});
}
