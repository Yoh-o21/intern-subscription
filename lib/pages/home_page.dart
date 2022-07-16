import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intern_subscription/date_time_extension.dart';
import 'package:intern_subscription/providers/item_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemStream = ref.watch(itemStreamProvider);

    return Scaffold(
        body: itemStream.when(
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Text('Error: $error'),
            data: (items) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        background: Container(
                            alignment: Alignment.centerRight,
                            color: Colors.red,
                            child: const Padding(
                                padding: EdgeInsets.only(right: 30),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ))),
                        onDismissed: (_) {
                          FirebaseFirestore.instance
                              .collection('users')
                              .doc(FirebaseAuth.instance.currentUser?.uid)
                              .collection('subscription')
                              .doc(items[index].id)
                              .delete();
                        },
                        child: GestureDetector(
                          onTap: () {},
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 4,
                            child: SizedBox(
                                height: 80,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        items[index].name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text('¥${items[index].price}',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                              ],
                                            ),
                                            Text(
                                                items[index]
                                                    .billingAt
                                                    .toFormattedString(
                                                        'yyyy/MM/dd'),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ]),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      );
                    }),
              );
            }));
  }
}
