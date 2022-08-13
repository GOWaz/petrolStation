// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/classes/user_search.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/pages/user_pages/add_user.dart';
import 'package:stationapp/providers/user_provider/user_provider.dart';
import 'package:stationapp/widgets/user_widgets/user_item.dart';

class UsersListView extends StatefulWidget {
  const UsersListView({Key? key}) : super(key: key);

  @override
  State<UsersListView> createState() => _UsersState();
}

class _UsersState extends State<UsersListView> {
  Future<void> _updateUserList(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<UsersProvider>(context, listen: false).fetchUsers();
    } catch (error) {
      print(error);
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('An error occurred!'),
          content: const Text('Something went wrong.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  var _isInit = true;
  var _isLoading = false;

  @override
  Future<void> didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      try {
        await Provider.of<UsersProvider>(context)
            .fetchUsers(); /*.then((_) {
          setState(() {
            _isLoading = false;
          });
        });*/
      } catch (error) {
        print(error);
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('An error occurred!'),
            content: const Text('Something went wrong.'),
            actions: <Widget>[
              TextButton(
                child: const Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
    }
    setState(() {
      _isLoading = false;
    });
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final getUsers = Provider.of<UsersProvider>(context);
    final user = getUsers.users;

    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        backgroundColor: color5,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: UserSearch(),
              );
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () => _updateUserList(context),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              controller: ScrollController(),
              itemCount: user.length,
              itemBuilder: (_, i) => SingleChildScrollView(
                child: Column(
                  children: [
                    UserItemView(
                      id: user[i].id,
                      name: user[i].fullName,
                      nNumber: user[i].nationalNumber,
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddUser.routeName);
        },
        backgroundColor: color5,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
