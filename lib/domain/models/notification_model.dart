import 'package:equatable/equatable.dart';

import '../entities/notification.dart';

class NotificationModel extends Equatable {
  final int id;
  final String notifTitle;
  final String notifContent;
  final bool isReaded;

  const NotificationModel({
    required this.id,
    required this.notifTitle,
    required this.notifContent,
    required this.isReaded,
  });

  NotificationEntity toEntity() {
    return NotificationEntity(
      id: id,
      notifTitle: notifTitle,
      notifContent: notifContent,
      isReaded: isReaded,
    );
  }

  factory NotificationModel.fromEntity(NotificationEntity notification) =>
      NotificationModel(
          id: notification.id,
          notifTitle: notification.notifTitle,
          notifContent: notification.notifContent,
          isReaded: notification.isReaded);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'notifTitle': notifTitle,
      'notifContent': notifContent,
      'isReaded': isReaded,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'],
      notifTitle: map['notifTitle'],
      notifContent: map['notifContent'],
      isReaded: map['isReaded'],
    );
  }

  @override
  List<Object?> get props => [id, notifTitle, notifContent, isReaded];
}
