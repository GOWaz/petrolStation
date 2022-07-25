import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:userapp/pages/home%20page/quequ_container.dart';
import 'package:userapp/pages/home%20page/request_container.dart';
import 'build_menu.dart';
import 'map_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/MainPage';

  @override
  Widget build(BuildContext context) {
    
    final GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();
    return SideMenu(
        background: Colors.teal,
        key: sideMenuKey,
        type: SideMenuType.shrinkNSlide,
        // inverse: true,
        menu: const BulidMenu(),
        child: Scaffold(
          body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/a.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  IconButton(
                    iconSize: 30,
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.teal,
                    ),
                    onPressed: () {
                      final state = sideMenuKey.currentState;
                      bool? ok = state?.isOpened;
                      ok = true;
                      if (ok) {
                        state?.openSideMenu();

                        // ignore: dead_code
                      } else {
                        state?.openSideMenu();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  const Request(),
                  const SizedBox(
                    height: 15,
                  ),
                  const MapContainer(),
                  const SizedBox(
                    height: 15,
                  ),
                  const QueueContainer(),
                ],
              ),
            ),
          ),
        ));
  }
}
