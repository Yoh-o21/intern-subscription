import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intern_subscription/pages/root_page.dart';
import 'package:intern_subscription/pages/sign_in_page.dart';
import 'package:intern_subscription/providers/theme_provider.dart';
import 'package:intern_subscription/theme_data.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting("ja_JP", null);
  await Firebase.initializeApp();

  /// runApp Riverpod
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: 'Intern subscription app',
      debugShowCheckedModeBanner: false,
      theme: themeMode == ThemeMode.dark ? darkThemeData : lightThemeData,
      darkTheme: themeMode == ThemeMode.light ? lightThemeData : darkThemeData,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const RootPage();
          }
          return const SignInPage();
        },
      ),
    );
  }
}
