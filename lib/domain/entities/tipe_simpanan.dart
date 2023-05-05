import 'package:equatable/equatable.dart';

class TipeSimpanans extends Equatable {
  final int id;
  final int institutionId;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  TipeSimpanans(
      {required this.id,
      required this.institutionId,
      required this.name,
      required this.createdAt,
      required this.updatedAt});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        institutionId,
        name,
        createdAt,
        updatedAt,
      ];
}
