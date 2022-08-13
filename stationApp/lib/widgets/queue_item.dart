// ignore_for_file: avoid_print, use_rethrow_when_possible

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/providers/user_provider/user_provider.dart';

class UserRItem extends StatefulWidget {
  final int index;
  const UserRItem({required this.index, Key? key}) : super(key: key);

  @override
  State<UserRItem> createState() => _UserRItemState();
}

class _UserRItemState extends State<UserRItem> {
  var check = false;

  Future<void> fetchUsers() async {
    try {
      await Provider.of<UsersProvider>(context).fetchUsers();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  String fetchName(int id) {
    fetchUsers();
    final user = Provider.of<UsersProvider>(context).findById(id);
    return user.fullName;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person),
      // ignore: unnecessary_string_interpolations
      title: Text('${fetchName(widget.index)}'),
      trailing: Checkbox(
        value: check,
        onChanged: (_) {
          setState(() {
            check = true;
          });
        },
      ),
    );
  }
}
