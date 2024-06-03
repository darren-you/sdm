class ApiResponse<T> {
  int? statusCode;
  T? data;
  String? message;

  ApiResponse(
      {required this.statusCode, required this.data, required this.message});
}

class User {
  final int id;
  final String name;

  User({required this.id, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
    );
  }
}
