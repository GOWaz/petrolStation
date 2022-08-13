// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/providers/user_provider/users_received_message_provider.dart';
import 'package:stationapp/widgets/queue_item.dart';

class ReceivedMessagePage extends StatefulWidget {
  const ReceivedMessagePage({Key? key}) : super(key: key);

  @override
  State<ReceivedMessagePage> createState() => _ReceivedMessagePageState();
}

class _ReceivedMessagePageState extends State<ReceivedMessagePage> {
  var check = false;
  Future<void> _updateUserList(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<ReceivedMessageProvider>(context, listen: false)
          .fetch();
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
        await Provider.of<ReceivedMessageProvider>(context)
            .fetch(); /*.then((_) {
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
    final users =
        Provider.of<ReceivedMessageProvider>(context).usersWithMassages;

    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        backgroundColor: color5,
        title: const Text('Users with messages'),
        actions: [
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
              itemCount: users.length,
              itemBuilder: (_, i) => SingleChildScrollView(
                child: Column(
                  children: [
                    UserRItem(index: users[i].userId),
                  ],
                ),
              ),
            ),
    );
  }
}
