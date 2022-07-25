import 'package:flutter/material.dart';
import '../Payment/payment.dart';
import '../Profile Page/profile.dart';
import '../report.dart';
import '../setting.dart';

class BulidMenu extends StatelessWidget {
  const BulidMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Payment()),
              );
            },
            leading: const Icon(
              Icons.payment,
              size: 20,
              color: Colors.amber,
            ),
            title: const Text('Payment'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Setting()),
              );
            },
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