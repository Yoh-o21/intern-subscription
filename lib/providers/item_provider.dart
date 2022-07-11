import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intern_subscription/models/item.dart';

// アイテム名
final nameStateProvider =
    StateProvider.autoDispose((ref) => TextEditingController(text: ''));
// 価格
final priceStateProvider =
    StateProvider.autoDispose((ref) => TextEditingController(text: ''));
// 支払期間
final billingIntervalProvider =
    StateProvider<BillingInterval>((ref) => BillingInterval.monthly);
// 追加日
final startAtProvider = StateProvider<DateTime>((ref) => DateTime.now());
// 支払日
final billingAtProvider = StateProvider<DateTime>((ref) => DateTime.now());
