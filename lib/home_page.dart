import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/routes/router.gr.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var currentRoute = ModalRoute.of(context)!.settings.name;
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) {
        print(tabsRouter.currentChild!.name);
        if (tabsRouter.currentChild!.name == 'SettingsRouter') {
          return PreferredSize(
            // preferredSize: Size.fromHeight(91),
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              backgroundColor: Colors.red,
              title: const Text('Yeeep'),
              centerTitle: true,
              // leading: const AutoLeadingButton(),
              leading: IconButton(
                onPressed: () {
                  tabsRouter.setActiveIndex(0);
                },
                icon: Icon(Icons.close),
              ),
            ),
          );
        }

        return AppBar(
          backgroundColor: Colors.indigo,
          title: const Text('FlutterBottomNav'),
          centerTitle: true,
          leading: const AutoLeadingButton(),
        );
      },
      backgroundColor: Colors.indigo,
      routes: const [
        PostsRouter(),
        UsersRouter(),
        SettingsRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
              selectedColor: Colors.amberAccent,
              icon: const Icon(
                Icons.post_add,
                size: 30,
              ),
              title: const Text('Posts'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.blue[200],
              icon: const Icon(
                Icons.person,
                size: 30,
              ),
              title: const Text('Users'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.pinkAccent,
              icon: const Icon(
                Icons.settings,
                size: 30,
              ),
              title: const Text('Settings'),
            ),
          ],
        );
      },
    );
  }
}
