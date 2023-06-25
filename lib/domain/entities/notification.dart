import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final int id;
  final String notifTitle;
  final String notifContent;
  bool isReaded;

  NotificationEntity({
    required this.id,
    required this.notifTitle,
    required this.notifContent,
    required this.isReaded,
  });

  @override
  List<Object?> get props => [id, notifTitle, notifContent, isReaded];
}
