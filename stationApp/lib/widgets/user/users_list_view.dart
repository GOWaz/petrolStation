import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/providers/user_provider.dart';
import 'package:stationapp/widgets/user/user_item.dart';

class UsersListView extends StatefulWidget {
  const UsersListView({Key? key}) : super(key: key);

  @override
  State<UsersListView> createState() => _UsersState();
}

class _UsersState extends State<UsersListView> {
  @override
  Widget build(BuildContext context) {
    final getUsers = Provider.of<UsersProvider>(context);
    final user = getUsers.users;

    return ListView.builder(
      itemCount: user.length,
      itemBuilder: (_, i) => Column(
        children: [
          UserItemView(
            id: user[i].id,
            name: user[i].fullName,
            nNumber: user[i].nationalNumber,
          ),
        ],
      ),
    );
  }
}
