import 'package:equatable/equatable.dart';

import '../entities/response_post.dart';

class ResponsePostModel extends Equatable {
  ResponsePostModel({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory ResponsePostModel.fromJson(Map<String, dynamic> json) =>
      ResponsePostModel(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };

  ResponsePost toEntity() {
    return ResponsePost(success, message);
  }

  @override
  List<Object?> get props => [
        success,
        message,
      ];
}
