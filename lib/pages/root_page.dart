import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intern_subscription/pages/add_page.dart';
import 'package:intern_subscription/pages/home_page.dart';
import 'package:intern_subscription/pages/setting_page.dart';

enum PageType { home, setting }

final pageTypeProvider = StateProvider<PageType>((ref) => PageType.home);

class RootPage extends ConsumerWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageType = ref.watch(pageTypeProvider);
    final pages = [
      const HomePage(),
      const SettingPage(),
    ];

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: pages[pageType.index],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.grey[300],
          currentIndex: pageType.index,
          onTap: (int selectIndex) {
            ref.read(pageTypeProvider.notifier).state =
                PageType.values[selectIndex];
          },
          selectedItemColor: Colors.cyan[600],
          unselectedItemColor: Colors.cyan[900],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'setting',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.cyan[900],
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
