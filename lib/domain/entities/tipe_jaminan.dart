import 'package:equatable/equatable.dart';

class TipeJaminan extends Equatable {
  final int id;
  final String namaTipeJaminan;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TipeJaminan({
    required this.id,
    required this.namaTipeJaminan,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, namaTipeJaminan, createdAt, updatedAt];
}
