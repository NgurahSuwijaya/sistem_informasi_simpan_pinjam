import 'package:equatable/equatable.dart';
import 'member.dart';

class ResponseMember extends Equatable {
  const ResponseMember({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final Member data;

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}
