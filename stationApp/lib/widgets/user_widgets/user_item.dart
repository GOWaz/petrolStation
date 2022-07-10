import 'package:flutter/material.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/pages/user_details_page.dart';

// ignore: must_be_immutable
class UserItemView extends StatelessWidget {
  String? id;
  String? name;
  String? nNumber;
  UserItemView({this.id, this.name, this.nNumber, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UserDetails(id: id)));
      },
      iconColor: color5,
      textColor: Colors.black,
      title: Text(name!),
      leading: const Icon(Icons.person),
      subtitle: Text(nNumber!),
    );
  }
}
