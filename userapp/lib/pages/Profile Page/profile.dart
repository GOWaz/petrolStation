import 'package:flutter/material.dart';
import 'package:userapp/constants.dart';
import 'package:userapp/pages/Profile%20Page/edit_info.dart';
import 'package:userapp/pages/home%20page/home_page.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  static const routeName = '/Profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            alignment: Alignment.center,
            color: color1,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.white,
        shadowColor: Colors.amber,
        title: const Text(
          'Profile Info',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Profile Photo',
                    style: TextStyle(fontSize: 20, color: Colors.teal),
                  ),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.amber,
                    ),
                    label: const Text(
                      'Edit',
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CircleAvatar(
                  radius: 40, backgroundImage: AssetImage('images/person.png')),
              const Divider(
                color: Colors.black,
              ),
              const EditInfo(label: 'Your Name ', info: 'Malak_Naef'),
              const EditInfo(label: 'Your Phone Number ', info: '0957439192'),
              const EditInfo(label: 'Your National Id ', info: '12010018021'),
              const EditInfo(label: 'Your Car Id ', info: '102837'),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
                Image(
                  image: AssetImage('images/fuel.png'),
                  height: 60,
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
