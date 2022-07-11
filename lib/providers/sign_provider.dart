import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final emailStateProvider =
    StateProvider.autoDispose((ref) => TextEditingController(text: ''));
final passwordStateProvider =
    StateProvider.autoDispose((ref) => TextEditingController(text: ''));
final isVisibleStateProvider = StateProvider<bool>((ref) => false);
