import 'package:sistem_informasi_simpan_pinjam/utils/helpers/database_helper.dart';
import '../../../models/notification_model.dart';

abstract class LocalNotificationDataSource {
  Future<void> insertNotification(NotificationModel notification);
  Future<List<NotificationModel>> getAllNotifications();
  Future<void> updateNotification(NotificationModel notification);
  Future<void> deleteNotification(int id);
}

class LocalNotificationDataSourceImpl implements LocalNotificationDataSource {
  final DatabaseHelper database;

  LocalNotificationDataSourceImpl(this.database);

  @override
  Future<void> insertNotification(NotificationModel notification) async {
    await database.insertNotification(notification);
  }

  @override
  Future<List<NotificationModel>> getAllNotifications() async {
    final result = await database.getAllNotifications();
    return result
        .map((data) => NotificationModel.fromMap(data.toMap()))
        .toList();
  }

  @override
  Future<void> updateNotification(NotificationModel notification) async {
    await database.updateNotification(notification);
  }

  @override
  Future<void> deleteNotification(int id) async {
    await database.deleteNotification(id);
  }
}
