import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intern_subscription/pages/add_page.dart';
import 'package:intern_subscription/pages/home_page.dart';
import 'package:intern_subscription/pages/profile_page.dart';
import 'package:intern_subscription/pages/sign_in_page.dart';
import 'package:intern_subscription/providers/theme_provider.dart';

enum PageType { home, profile }

final pageTypeProvider = StateProvider<PageType>((ref) => PageType.home);

class RootPage extends ConsumerWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final auth = FirebaseAuth.instance;
    final pageType = ref.watch(pageTypeProvider);
    final pages = [
      const HomePage(),
      const ProfilePage(),
    ];

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(),
        body: pages[pageType.index],
        endDrawer: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Drawer(
              child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
            children: [
              const ListTile(
                title: Text(
                  'Profile',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                trailing: const Icon(Icons.arrow_forward_ios),
                title: const Text('User'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.email),
                trailing: const Icon(Icons.arrow_forward_ios),
                title: const Text('Email'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.password),
                trailing: const Icon(Icons.arrow_forward_ios),
                title: const Text('Password'),
                onTap: () {},
              ),
              const Divider(),
              SwitchListTile(
                title: const Text('Dark Theme'),
                value: isDarkMode,
                onChanged: (bool value) {
                  if (value) {
                    ref.read(themeModeProvider.notifier).state = ThemeMode.dark;
                  } else {
                    ref.read(themeModeProvider.notifier).state =
                        ThemeMode.light;
                  }
                },
                secondary: const Icon(Icons.mode_night),
              ),
              const Divider(),
              // Sign Out Button
              ListTile(
                onTap: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text('Sign out?'),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text("Cancel"),
                            onPressed: () => Navigator.pop(context),
                          ),
                          CupertinoDialogAction(
                              child: const Text("OK"),
                              onPressed: () {
                                auth.signOut();

                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const SignInPage();
                                  },
                                ));
                              })
                        ],
                      );
                    },
                  );
                },
                leading: const Icon(Icons.logout),
                title: const Text('Sign Out'),
              ),
            ],
          )),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: pageType.index,
          onTap: (int selectIndex) {
            ref.read(pageTypeProvider.notifier).state =
                PageType.values[selectIndex];
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profile',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return const AddPage();
              }),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
