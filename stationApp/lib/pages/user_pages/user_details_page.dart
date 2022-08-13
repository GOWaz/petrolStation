import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/pages/user_pages/edit_user.dart';
import 'package:stationapp/providers/user_provider/user.dart';
import 'package:stationapp/providers/user_provider/user_provider.dart';

enum SelectionView { byID, byName }

// ignore: must_be_immutable
class UserDetails extends StatelessWidget {
  SelectionView? viewBy;
  // ignore: prefer_typing_uninitialized_variables
  var pointer;
  UserDetails({this.viewBy, this.pointer, Key? key}) : super(key: key);

  static const routeName = '/userView';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final getUser = Provider.of<UsersProvider>(context);
    var loadUser = User(
      id: 0,
      fullName: '',
      nationalNumber: '',
      phoneNumber: '',
      email: '',
      password: '',
      carId: 0,
      ownerId: 0,
      carName: '',
      carNumber: '',
      category: '',
      amount: 0,
    );

    if (viewBy == SelectionView.byID) {
      loadUser = getUser.findById(pointer!);
    } else {
      loadUser = getUser.findByName(pointer!);
    }

    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        title: Text(
          loadUser.fullName,
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, EditUser.routeName,
                  arguments: pointer);
            },
            icon: const Icon(
              Icons.edit,
              color: color1,
            ),
          ),
        ],
        backgroundColor: color5,
      ),
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Material(
              elevation: 40.0,
              shadowColor: Colors.black,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                height: size.height / 0.5,
                width: size.width / 2.5,
                color: color5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Full name:',
                      style: labelStyleInUserInfo(context),
                    ),
                    Text(
                      loadUser.fullName,
                      style: detailsStyleInUserInfo(context),
                    ),
                    Text(
                      'National number:',
                      style: labelStyleInUserInfo(context),
                    ),
                    Text(
                      loadUser.nationalNumber,
                      style: detailsStyleInUserInfo(context),
                    ),
                    Text(
                      'Phone number:',
                      style: labelStyleInUserInfo(context),
                    ),
                    Text(
                      loadUser.phoneNumber,
                      style: detailsStyleInUserInfo(context),
                    ),
                    Text(
                      'Email:',
                      style: labelStyleInUserInfo(context),
                    ),
                    Text(
                      loadUser.email,
                      style: detailsStyleInUserInfo(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Material(
              elevation: 40.0,
              shadowColor: Colors.black,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                height: size.height / 0.5,
                width: size.width / 2.5,
                color: color5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Car name:',
                      style: labelStyleInUserInfo(context),
                    ),
                    Text(
                      loadUser.carName,
                      style: detailsStyleInUserInfo(context),
                    ),
                    Text(
                      'Car number:',
                      style: labelStyleInUserInfo(context),
                    ),
                    Text(
                      loadUser.carNumber,
                      style: detailsStyleInUserInfo(context),
                    ),
                    Text(
                      'Category:',
                      style: labelStyleInUserInfo(context),
                    ),
                    Text(
                      loadUser.category,
                      style: detailsStyleInUserInfo(context),
                    ),
                    Text(
                      'Fuel amount:',
                      style: labelStyleInUserInfo(context),
                    ),
                    Text(
                      loadUser.amount.toString(),
                      style: detailsStyleInUserInfo(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
