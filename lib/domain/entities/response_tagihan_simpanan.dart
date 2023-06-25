import 'package:equatable/equatable.dart';

class ResponseTagihanSimpanan extends Equatable {
  final bool success;
  final List<TagihanSimpanan> data;
  final int totalTagihan;

  const ResponseTagihanSimpanan(this.success, this.data, this.totalTagihan);

  @override
  List<Object?> get props => [success, data, totalTagihan];
}

class TagihanSimpanan extends Equatable {
  final int id;
  final int memberId;
  final int jumlah;
  final String status;
  final DateTime jatuhTempo;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TagihanSimpanan(this.id, this.memberId, this.jumlah, this.status,
      this.jatuhTempo, this.createdAt, this.updatedAt);

  @override
  List<Object?> get props =>
      [id, memberId, jumlah, status, jatuhTempo, createdAt, updatedAt];
}
