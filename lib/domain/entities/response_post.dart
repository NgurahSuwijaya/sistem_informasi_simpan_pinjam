import 'package:equatable/equatable.dart';

class ResponsePost extends Equatable {
  final bool success;
  final String message;

  ResponsePost(
    this.success,
    this.message,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [success, message];
}
