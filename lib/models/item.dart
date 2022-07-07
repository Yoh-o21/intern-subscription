import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'date_time_converter.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  factory Item(
      {required String id,
      required String name,
      required int price,
      required BillingInterval billingInterval,
      @DateTimeTimestampConverter() required DateTime createdAt,
      @DateTimeTimestampConverter() required DateTime startAt,
      @DateTimeTimestampConverter() required DateTime billingAt,
      @Default(true) bool isSubscribed}) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

enum BillingInterval { monthly, yearly }
