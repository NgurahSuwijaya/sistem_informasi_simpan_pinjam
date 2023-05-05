import 'package:equatable/equatable.dart';

class TipeJaminan extends Equatable {
  final int id;
  final String namaTipeJaminan;
  final DateTime createdAt;
  final DateTime updatedAt;

  TipeJaminan({
    required this.id,
    required this.namaTipeJaminan,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, namaTipeJaminan, createdAt, updatedAt];
}
