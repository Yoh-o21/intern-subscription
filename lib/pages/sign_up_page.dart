import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intern_subscription/models/date_time_converter.dart';
import 'package:intern_subscription/pages/root_page.dart';
import 'package:intern_subscription/sign_provider.dart';
import 'package:intern_subscription/models/user.dart' as model;

class SignUpPage extends ConsumerWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = ref.watch(emailStateProvider);
    final passwordController = ref.watch(passwordStateProvider);
    final isVisible = ref.watch(isVisibleStateProvider);
    final signUpFormKey = GlobalKey<FormState>();
    final auth = FirebaseAuth.instance;
    final collection = FirebaseFirestore.instance.collection('users');

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('WELCOME',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 96, 100))),
              const SizedBox(height: 40),
              //入力フォーム
              Form(
                key: signUpFormKey,
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
                    if (!signUpFormKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please fill out all forms correctly.'),
                        backgroundColor: Colors.red,
                      ));
                      return;
                    }
                    try {
                      final result = await auth.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text);
                      final user = model.User(
                          uid: result.user!.uid,
                          userImg: '',
                          userName: result.user!.email!.split('@')[0],
                          createdAt: DateTime.now(),
                          updatedAt: DateTime.now());

                      await collection.doc(user.uid).set(user.toJson());
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
                            'Sign Up failed. Please fill out all forms correctly or sign in.'),
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.cyan[900]),
                  child: const Text(
                    "Sign Up",
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
                        Navigator.pop(context);
                      }),
                      child: const Text(
                        'Sign in here.',
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
