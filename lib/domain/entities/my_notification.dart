// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ResponseMyNotification extends Equatable {
  final bool? success;
  final String? message;
  final Data? data;

  const ResponseMyNotification(this.success, this.message, this.data);

  @override
  List<Object?> get props => [success, message, data];
}

class Data extends Equatable {
  final int? currentPage;
  final List<MyNotification>? data;
  final String? nextPageUrl;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  const Data(this.currentPage, this.data, this.nextPageUrl, this.prevPageUrl,
      this.to, this.total);

  @override
  List<Object?> get props {
    return [
      currentPage,
      data,
      nextPageUrl,
      prevPageUrl,
      to,
      total,
    ];
  }
}

class MyNotification extends Equatable {
  final int? id;
  final int? memberId;
  final int? simpananId;
  final int? pinjamanId;
  final int? angsuranId;
  final String? title;
  final String? subject;
  final String? content;
  final int? isReaded;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const MyNotification(
      this.id,
      this.memberId,
      this.simpananId,
      this.pinjamanId,
      this.angsuranId,
      this.title,
      this.subject,
      this.content,
      this.isReaded,
      this.createdAt,
      this.updatedAt);

  @override
  List<Object?> get props {
    return [
      id,
      memberId,
      simpananId,
      pinjamanId,
      angsuranId,
      title,
      subject,
      content,
      isReaded,
      createdAt,
      updatedAt,
    ];
  }
}
