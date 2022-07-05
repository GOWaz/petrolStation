import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:userapp/pages/profile.dart';
import 'package:userapp/pages/report.dart';

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
      menu: buildMenu(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.amber,
          leading: IconButton(
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
        ),
        body: Column(),
      ),
    );
  }

  Widget buildMenu(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('images/person.png'),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Malak_Naef',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
            leading: const Icon(
              Icons.person,
              size: 20,
              color: Colors.amber,
            ),
            title: const Text('Profile'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.request_quote_rounded,
              size: 20,
              color: Colors.amber,
            ),
            title: const Text('Request'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.map,
              size: 20,
              color: Colors.amber,
            ),
            title: const Text('Map'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.view_agenda,
              size: 20,
              color: Colors.amber,
            ),
            title: const Text('Veiw'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.payment,
              size: 20,
              color: Colors.amber,
            ),
            title: const Text('Payment'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.settings,
              size: 20,
              color: Colors.amber,
            ),
            title: const Text('Setting'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Report()),
              );
            },
            leading: const Icon(
              Icons.report,
              size: 20,
              color: Colors.amber,
            ),
            title: const Text('Report'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.help,
              size: 20,
              color: Colors.amber,
            ),
            title: const Text('About us'),
          ),
        ],
      ),
    );
  }
}
