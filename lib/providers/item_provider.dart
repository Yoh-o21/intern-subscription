import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intern_subscription/models/item.dart';

// Firestoreに追加するItem情報の状態管理
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

// Firestoreから読み込んだItem情報の状態管理
final itemStreamProvider = StreamProvider.autoDispose((_) {
  final auth = FirebaseAuth.instance;
  final snapshots = FirebaseFirestore.instance
      .collection('users')
      .doc(auth.currentUser?.uid)
      .collection('subscription')
      .orderBy('createdAt', descending: true)
      .snapshots();

  return snapshots.map((snapshot) =>
      snapshot.docs.map((doc) => Item.fromJson(doc.data())).toList());
});
