import 'package:equatable/equatable.dart';

class ResponsePost extends Equatable {
  final bool? success;
  final String? message;

  const ResponsePost(
    this.success,
    this.message,
  );

  @override
  List<Object?> get props => [success, message];
}
