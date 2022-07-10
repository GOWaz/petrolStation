import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/providers/user_providers/user.dart';
import 'package:stationapp/providers/user_providers/user_provider.dart';

// ignore: must_be_immutable
class UserDetails extends StatelessWidget {
  String? id;
  UserDetails({this.id, Key? key}) : super(key: key);

  static const routeName = '/userViewById';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final getUser = Provider.of<UsersProvider>(context);
    var loadUser = User(
      id: '',
      fullName: '',
      nationalNumber: '',
      phoneNumber: '',
      email: '',
      password: '',
    );
    loadUser = getUser.findById(id!);

    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        title: Text(
          loadUser.fullName!,
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: color1,
            ),
          ),
          IconButton(
            onPressed: () {
              //TODO:show a message to confirm deletion
              getUser.deleteUser(id);
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.redAccent,
            ),
          ),
        ],
        backgroundColor: color5,
      ),
      body: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(40),
            height: size.height / 2,
            width: size.width / 2,
            decoration: const BoxDecoration(
              color: color5,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.face,
                      size: size.width / 10,
                      color: color1,
                    ),
                    Text(loadUser.fullName!),
                    SizedBox(
                      width: size.width / 8,
                    ),
                    Text(loadUser.nationalNumber!),
                  ],
                ),
                SizedBox(
                  height: size.height / 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(loadUser.phoneNumber!),
                    SizedBox(
                      width: size.width / 8,
                    ),
                    Text(loadUser.email!),
                    SizedBox(
                      width: size.width / 8,
                    ),
                    Text(loadUser.password!),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
