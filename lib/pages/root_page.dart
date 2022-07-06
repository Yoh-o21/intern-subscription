import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intern_subscription/pages/sign_in_page.dart';

class RootPage extends ConsumerWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = FirebaseAuth.instance;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('hi, ${auth.currentUser?.email}'),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await auth.signOut();

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const SignInPage();
                  },
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
