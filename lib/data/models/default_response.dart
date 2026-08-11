class DefaultResponse<T extends Serializable> {
  int? code;
  String message;
  T data;

  DefaultResponse({this.code, required this.message, required this.data});

  factory DefaultResponse.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return DefaultResponse<T>(
      code: json["code"],
      message: json["message"],
      data: create(json["data"])
    );
  }

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data.toJson(),
  };
}

abstract class Serializable {
  Map<String, dynamic> toJson();
}