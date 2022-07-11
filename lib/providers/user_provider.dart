import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intern_subscription/models/user.dart' as model;

final userProvider = StreamProvider.autoDispose((_) {
  final currentUser = FirebaseAuth.instance.currentUser;
  DocumentReference ref =
      FirebaseFirestore.instance.collection('users').doc(currentUser?.uid);
  return ref.snapshots().map((snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    model.User user = model.User.fromJson(data);
    return user;
  });
});
