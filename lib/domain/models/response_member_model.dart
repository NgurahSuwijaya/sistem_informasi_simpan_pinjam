import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/models/member_model.dart';

import '../entities/response_member.dart';

class ResponseMemberModel extends Equatable {
  final bool success;
  final String message;
  final MemberModel data;

  const ResponseMemberModel(
      {required this.success, required this.message, required this.data});

  factory ResponseMemberModel.fromJson(Map<String, dynamic> json) {
    return ResponseMemberModel(
      success: json['success'],
      message: json['message'],
      data: MemberModel.fromJson(json['data']),
    );
  }

  ResponseMember toEntity() {
    return ResponseMember(
        success: success, message: message, data: data.toEntity());
  }

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}
