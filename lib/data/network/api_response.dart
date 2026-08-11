
import 'package:base_flutter/data/network/status.dart';

class ApiResponse<T> {

  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status,this.data,this.message);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;
  ApiResponse.stopped() : status = Status.STOPPED;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }

  ApiResponse.fromJson(Map<String, dynamic> json) {
    print("JSON: $json");
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['data'] = data;
    return data;
  }
}