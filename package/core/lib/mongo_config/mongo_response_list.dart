import 'package:core/mongo_config/status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@Freezed(genericArgumentFactories: true)
class MongoResponseList<T> {
  final Status? status;
  final List<T>? element;

  MongoResponseList(this.status, this.element);

  factory MongoResponseList.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    List<T> listData = (json['element'] as List).map((e) => fromJsonT(e)).toList();
    return MongoResponseList(
      Status.fromJson(json['status']),
      listData,
    );
  }
}
