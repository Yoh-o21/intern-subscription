// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      id: json['id'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
      billingInterval:
          $enumDecode(_$BillingIntervalEnumMap, json['billingInterval']),
      createdAt: const DateTimeTimestampConverter()
          .fromJson(json['createdAt'] as Timestamp),
      startAt: const DateTimeTimestampConverter()
          .fromJson(json['startAt'] as Timestamp),
      billingAt: const DateTimeTimestampConverter()
          .fromJson(json['billingAt'] as Timestamp),
      isSubscribed: json['isSubscribed'] as bool? ?? true,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'billingInterval': _$BillingIntervalEnumMap[instance.billingInterval],
      'createdAt':
          const DateTimeTimestampConverter().toJson(instance.createdAt),
      'startAt': const DateTimeTimestampConverter().toJson(instance.startAt),
      'billingAt':
          const DateTimeTimestampConverter().toJson(instance.billingAt),
      'isSubscribed': instance.isSubscribed,
    };

const _$BillingIntervalEnumMap = {
  BillingInterval.monthly: 'monthly',
  BillingInterval.yearly: 'yearly',
};
