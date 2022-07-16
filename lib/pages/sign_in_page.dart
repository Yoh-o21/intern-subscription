import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intern_subscription/pages/root_page.dart';
import 'package:intern_subscription/pages/sign_up_page.dart';
import 'package:intern_subscription/providers/sign_provider.dart';
import 'package:intern_subscription/providers/theme_provider.dart';
import 'package:intern_subscription/theme_data.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = ref.watch(emailStateProvider);
    final passwordController = ref.watch(passwordStateProvider);
    final isVisible = ref.watch(isVisibleStateProvider);
    final isDark = ref.watch(isDarkModeProvider);
    final signInFormKey = GlobalKey<FormState>();
    final auth = FirebaseAuth.instance;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('HELLO',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: isDark ? dMainColor : lMainColor,
                )),
            const SizedBox(height: 40),
            //入力フォーム
            Form(
              key: signInFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value != null) {
                        String pattern =
                            r'^[0-9a-z_./?-]+@([0-9a-z-]+\.)+[0-9a-z-]+$';
                        RegExp regExp = RegExp(pattern);
                        if (!regExp.hasMatch(value)) {
                          return 'Please enter a correct email address.';
                        }
                        return null;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Email',
                        fillColor: Colors.white,
                        filled: true),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    obscureText: !isVisible,
                    controller: passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value != null) {
                        String pattern = r'^[a-zA-Z0-9]{6,}$';
                        RegExp regExp = RegExp(pattern);
                        if (!regExp.hasMatch(value)) {
                          return 'Password must be at least 6 alphanumeric characters.';
                        }
                        return null;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: IconButton(
                          icon: Icon(isVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            ref.read(isVisibleStateProvider.notifier).state =
                                !isVisible;
                          },
                        ),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Password',
                        fillColor: Colors.white,
                        filled: true),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  if (!signInFormKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please fill out all forms correctly.'),
                      backgroundColor: kErrorColor,
                    ));
                    return;
                  }
                  try {
                    await auth.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text);
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return const RootPage();
                      }),
                    );
                    emailController.clear();
                    passwordController.clear();
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          'Sign in failed. Please fill out all forms correctly or sign up.'),
                      backgroundColor: kErrorColor,
                    ));
                  }
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: (() {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const SignUpPage();
                      }));
                    }),
                    child: const Text(
                      'Create new account here.',
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
