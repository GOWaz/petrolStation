import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:userapp/constants.dart';
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
        // inverse: true,
        menu: buildMenu(context),
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
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        constraints: const BoxConstraints.expand(),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'images/request.png',
                                    scale: 5,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  'To order fuel , ',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  'Click Here..',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(
                                      color: Colors.teal,
                                      focusColor: color1,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Profile()),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.request_page_outlined,

                                        size: 50,
                                        // color: Colors.teal,
                                      ))
                                ])
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        constraints: const BoxConstraints.expand(),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'images/googlemaps.jpg',
                                    scale: 13,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  'To search for\n a station , ',
                                  maxLines: 2,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  'Click Here..',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(
                                      color: Colors.teal,
                                      focusColor: color1,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Profile()),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.map,
                                        size: 50,
                                      ))
                                ])
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                          constraints: const BoxConstraints.expand(),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      'Your turn',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Your turn in the queue\n to fill your car is 20 \n there are 20 vehicles\n left in front of you',
                                          maxLines: 5,
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        )
                                      ],
                                    ),
                                    //const Spacer(),
                                    const SizedBox(
                                      width: 70,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Text(
                                          '20',
                                          style: TextStyle(
                                              fontSize: 50,
                                              backgroundColor: Colors.teal,
                                              color: Colors.white),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 200,
                                      height: 100,
                                      child: const Image(
                                          image:
                                              AssetImage('images/queue.jpg')),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                    ),
                  ))
                ],
              ),
            ),
          ),
        ));
  }

  Widget buildMenu(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
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
