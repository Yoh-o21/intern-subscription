// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  BillingInterval get billingInterval => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get startAt => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get billingAt => throw _privateConstructorUsedError;
  bool get isSubscribed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      int price,
      BillingInterval billingInterval,
      @DateTimeTimestampConverter() DateTime createdAt,
      @DateTimeTimestampConverter() DateTime startAt,
      @DateTimeTimestampConverter() DateTime billingAt,
      bool isSubscribed});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  final Item _value;
  // ignore: unused_field
  final $Res Function(Item) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? billingInterval = freezed,
    Object? createdAt = freezed,
    Object? startAt = freezed,
    Object? billingAt = freezed,
    Object? isSubscribed = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      billingInterval: billingInterval == freezed
          ? _value.billingInterval
          : billingInterval // ignore: cast_nullable_to_non_nullable
              as BillingInterval,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startAt: startAt == freezed
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      billingAt: billingAt == freezed
          ? _value.billingAt
          : billingAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isSubscribed: isSubscribed == freezed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$_ItemCopyWith(_$_Item value, $Res Function(_$_Item) then) =
      __$$_ItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      int price,
      BillingInterval billingInterval,
      @DateTimeTimestampConverter() DateTime createdAt,
      @DateTimeTimestampConverter() DateTime startAt,
      @DateTimeTimestampConverter() DateTime billingAt,
      bool isSubscribed});
}

/// @nodoc
class __$$_ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res>
    implements _$$_ItemCopyWith<$Res> {
  __$$_ItemCopyWithImpl(_$_Item _value, $Res Function(_$_Item) _then)
      : super(_value, (v) => _then(v as _$_Item));

  @override
  _$_Item get _value => super._value as _$_Item;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? billingInterval = freezed,
    Object? createdAt = freezed,
    Object? startAt = freezed,
    Object? billingAt = freezed,
    Object? isSubscribed = freezed,
  }) {
    return _then(_$_Item(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      billingInterval: billingInterval == freezed
          ? _value.billingInterval
          : billingInterval // ignore: cast_nullable_to_non_nullable
              as BillingInterval,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startAt: startAt == freezed
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      billingAt: billingAt == freezed
          ? _value.billingAt
          : billingAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isSubscribed: isSubscribed == freezed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Item with DiagnosticableTreeMixin implements _Item {
  _$_Item(
      {required this.id,
      required this.name,
      required this.price,
      required this.billingInterval,
      @DateTimeTimestampConverter() required this.createdAt,
      @DateTimeTimestampConverter() required this.startAt,
      @DateTimeTimestampConverter() required this.billingAt,
      this.isSubscribed = true});

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int price;
  @override
  final BillingInterval billingInterval;
  @override
  @DateTimeTimestampConverter()
  final DateTime createdAt;
  @override
  @DateTimeTimestampConverter()
  final DateTime startAt;
  @override
  @DateTimeTimestampConverter()
  final DateTime billingAt;
  @override
  @JsonKey()
  final bool isSubscribed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Item(id: $id, name: $name, price: $price, billingInterval: $billingInterval, createdAt: $createdAt, startAt: $startAt, billingAt: $billingAt, isSubscribed: $isSubscribed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Item'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('billingInterval', billingInterval))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('startAt', startAt))
      ..add(DiagnosticsProperty('billingAt', billingAt))
      ..add(DiagnosticsProperty('isSubscribed', isSubscribed));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Item &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.billingInterval, billingInterval) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.startAt, startAt) &&
            const DeepCollectionEquality().equals(other.billingAt, billingAt) &&
            const DeepCollectionEquality()
                .equals(other.isSubscribed, isSubscribed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(billingInterval),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(startAt),
      const DeepCollectionEquality().hash(billingAt),
      const DeepCollectionEquality().hash(isSubscribed));

  @JsonKey(ignore: true)
  @override
  _$$_ItemCopyWith<_$_Item> get copyWith =>
      __$$_ItemCopyWithImpl<_$_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemToJson(this);
  }
}

abstract class _Item implements Item {
  factory _Item(
      {required final String id,
      required final String name,
      required final int price,
      required final BillingInterval billingInterval,
      @DateTimeTimestampConverter() required final DateTime createdAt,
      @DateTimeTimestampConverter() required final DateTime startAt,
      @DateTimeTimestampConverter() required final DateTime billingAt,
      final bool isSubscribed}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get price => throw _privateConstructorUsedError;
  @override
  BillingInterval get billingInterval => throw _privateConstructorUsedError;
  @override
  @DateTimeTimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  @DateTimeTimestampConverter()
  DateTime get startAt => throw _privateConstructorUsedError;
  @override
  @DateTimeTimestampConverter()
  DateTime get billingAt => throw _privateConstructorUsedError;
  @override
  bool get isSubscribed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ItemCopyWith<_$_Item> get copyWith => throw _privateConstructorUsedError;
}
