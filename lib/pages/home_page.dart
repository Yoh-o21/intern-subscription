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
        backgroundColor: Colors.grey[300],
        body: itemStream.when(
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Text('Error: $error'),
            data: (items) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 4,
                        child: SizedBox(
                            height: 80,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items[index].name,
                                    style: TextStyle(
                                        color: Colors.cyan[900],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text('¥${items[index].price}',
                                                style: TextStyle(
                                                  color: Colors.cyan[900],
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ],
                                        ),
                                        Text(
                                            items[index]
                                                .billingAt
                                                .toFormattedString(
                                                    'yyyy/MM//dd'),
                                            style: TextStyle(
                                              color: Colors.cyan[900],
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ]),
                                ],
                              ),
                            )),
                      );
                    }),
              );
            }));
  }
}
