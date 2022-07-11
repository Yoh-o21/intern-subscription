import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intern_subscription/date_time_extension.dart';
import 'package:intern_subscription/models/date_time_converter.dart';
import 'package:intern_subscription/providers/item_provider.dart';
import 'package:intern_subscription/models/item.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class AddPage extends ConsumerWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = ref.watch(nameStateProvider);
    final priceController = ref.watch(priceStateProvider);
    final billingInterval = ref.watch(billingIntervalProvider);
    final startAt = ref.watch(startAtProvider);
    final billingAt = ref.watch(billingAtProvider);
    final addItemFormKey = GlobalKey<FormState>();
    final auth = FirebaseAuth.instance;
    final collection = FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser?.uid)
        .collection('subscription');

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[300],
        iconTheme: IconThemeData(color: Colors.cyan[900]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Form(
              key: addItemFormKey,
              child: Column(
                children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.shopping_bag),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Subscription Name',
                        fillColor: Colors.white,
                        filled: true),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value != null) {
                        String pattern = r'^[0-9]*$';
                        RegExp regExp = RegExp(pattern);
                        if (!regExp.hasMatch(value)) {
                          return 'Please enter a price.';
                        }
                        return null;
                      }
                      return null;
                    },
                    controller: priceController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.paid),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Price',
                        fillColor: Colors.white,
                        filled: true),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.cyan[900],
                            value: BillingInterval.monthly,
                            groupValue: billingInterval,
                            onChanged: (value) {
                              ref.read(billingIntervalProvider.notifier).state =
                                  BillingInterval.monthly;
                            },
                          ),
                          const Text('Monthly')
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.cyan[900],
                            value: BillingInterval.yearly,
                            groupValue: billingInterval,
                            onChanged: (value) {
                              ref.read(billingIntervalProvider.notifier).state =
                                  BillingInterval.yearly;
                            },
                          ),
                          const Text('Yearly')
                        ],
                      ),
                    ],
                  ),
                  ListTile(
                    title: const Text('Start Date'),
                    leading: const Icon(Icons.calendar_month),
                    trailing: Text(
                      startAt.toFormattedString('yyyy/MM/dd'),
                    ),
                    onTap: () {
                      DatePicker.showDatePicker(
                        context,
                        minTime: DateTime(2000, 1, 1),
                        maxTime: DateTime(2050, 12, 31),
                        currentTime: startAt,
                        locale: LocaleType.jp,
                        onConfirm: (date) {
                          ref.read(startAtProvider.notifier).state = date;
                        },
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Billing Date'),
                    leading: const Icon(Icons.calendar_month),
                    trailing: Text(
                      billingAt.toFormattedString('yyyy/MM/dd'),
                    ),
                    onTap: () {
                      DatePicker.showDatePicker(
                        context,
                        minTime: DateTime(2000, 1, 1),
                        maxTime: DateTime(2050, 12, 31),
                        currentTime: billingAt,
                        locale: LocaleType.jp,
                        onConfirm: (date) {
                          ref.read(billingAtProvider.notifier).state = date;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            // Add Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  if (!addItemFormKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please fill out all forms correctly.'),
                      backgroundColor: Colors.red,
                    ));
                    return;
                  }
                  try {
                    final item = Item(
                        id: uuid.v4(),
                        name: nameController.text,
                        price: int.parse(priceController.text),
                        billingInterval: ref.watch(billingIntervalProvider),
                        createdAt: DateTime.now(),
                        startAt: startAt,
                        billingAt: billingAt);

                    await collection.doc().set(item.toJson());
                    Navigator.pop(context);

                    nameController.clear();
                    priceController.clear();
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Add item failed.'),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                style: ElevatedButton.styleFrom(primary: Colors.cyan[900]),
                child: const Text(
                  'Add',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
