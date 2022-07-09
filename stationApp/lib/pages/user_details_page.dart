import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/classes/user.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/providers/user_provider.dart';

// ignore: must_be_immutable
class UserDetails extends StatelessWidget {
  String? id;
  UserDetails({this.id, Key? key}) : super(key: key);

  static const routeName = '/userViewById';

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: color5,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(loadUser.fullName!),
            Text(loadUser.nationalNumber!),
            Text(loadUser.phoneNumber!),
            Text(loadUser.email!),
            Text(loadUser.password!),
          ],
        ),
      ),
    );
  }
}
