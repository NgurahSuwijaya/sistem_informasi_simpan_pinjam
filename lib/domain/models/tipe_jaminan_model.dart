import 'package:equatable/equatable.dart';

import '../entities/tipe_jaminan.dart';

class TipeJaminanModel extends Equatable {
  TipeJaminanModel({
    required this.id,
    required this.namaTipeJaminan,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String namaTipeJaminan;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory TipeJaminanModel.fromJson(Map<String, dynamic> json) =>
      TipeJaminanModel(
        id: json["id"],
        namaTipeJaminan: json["nama_tipe_jaminan"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_tipe_jaminan": namaTipeJaminan,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  TipeJaminan toEntity() {
    return TipeJaminan(
        id: id,
        namaTipeJaminan: namaTipeJaminan,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, namaTipeJaminan, createdAt, updatedAt];
}
