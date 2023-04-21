import 'package:core/mongo_config/status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@Freezed(genericArgumentFactories: true)
class MongoResponse<T> {
  Status? status;
  T? element;
  MongoResponse(this.status, this.element);

  factory MongoResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object?) fromJsonT,
      ) {
    return MongoResponse(
      Status.fromJson(json['status']),
      fromJsonT(json['element']),
    );
  }
}
