// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final responseMyNotificationModel = responseMyNotificationModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:sistem_informasi_simpan_pinjam/domain/entities/my_notification.dart';

ResponseMyNotificationModel responseMyNotificationModelFromJson(String str) =>
    ResponseMyNotificationModel.fromJson(json.decode(str));

String responseMyNotificationModelToJson(ResponseMyNotificationModel data) =>
    json.encode(data.toJson());

class ResponseMyNotificationModel extends Equatable {
  final bool? success;
  final String? message;
  final DataModel? data;

  const ResponseMyNotificationModel({
    this.success,
    this.message,
    this.data,
  });

  factory ResponseMyNotificationModel.fromJson(Map<String, dynamic> json) =>
      ResponseMyNotificationModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : DataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };

  ResponseMyNotification toEntity() {
    return ResponseMyNotification(success, message, data!.toEntity());
  }

  @override
  List<Object?> get props => [success, message, data];
}

class DataModel extends Equatable {
  final int? currentPage;
  final List<MyNotificationModel>? data;
  final String? nextPageUrl;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  const DataModel({
    this.currentPage,
    this.data,
    this.nextPageUrl,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<MyNotificationModel>.from(
                json["data"]!.map((x) => MyNotificationModel.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };

  Data toEntity() {
    return Data(currentPage, data!.map((e) => e.toEntity()).toList(),
        nextPageUrl, prevPageUrl, to, total);
  }

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

class MyNotificationModel extends Equatable {
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

  const MyNotificationModel({
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
    this.updatedAt,
  });

  factory MyNotificationModel.fromJson(Map<String, dynamic> json) =>
      MyNotificationModel(
        id: json["id"],
        memberId: json["member_id"],
        simpananId: json["simpanan_id"],
        pinjamanId: json["pinjaman_id"],
        angsuranId: json["angsuran_id"],
        title: json["title"],
        subject: json["subject"],
        content: json["content"],
        isReaded: json["isReaded"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "member_id": memberId,
        "simpanan_id": simpananId,
        "pinjaman_id": pinjamanId,
        "angsuran_id": angsuranId,
        "title": title,
        "subject": subject,
        "content": content,
        "isReaded": isReaded,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  MyNotification toEntity() {
    return MyNotification(id, memberId, simpananId, pinjamanId, angsuranId,
        title, subject, content, isReaded, createdAt, updatedAt);
  }

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
