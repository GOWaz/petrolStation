import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/pages/add_car.dart';
import 'package:stationapp/pages/user_pages/edit_user.dart';
import 'package:stationapp/providers/car_provider/car.dart';
import 'package:stationapp/providers/car_provider/car_provider.dart';
import 'package:stationapp/providers/user_provider/user.dart';
import 'package:stationapp/providers/user_provider/user_provider.dart';

enum SelectionView { byID, byName }

// ignore: must_be_immutable
class UserDetails extends StatelessWidget {
  SelectionView? viewBy;
  String? pointer;
  UserDetails({this.viewBy, this.pointer, Key? key}) : super(key: key);

  static const routeName = '/userView';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final getUser = Provider.of<UsersProvider>(context);
    final getCar = Provider.of<CarsProvider>(context);
    var loadUser = User(
      id: '',
      fullName: '',
      nationalNumber: '',
      phoneNumber: '',
      email: '',
      password: '',
    );
    var loadUserCar = Car(
      id: '',
      ownerId: '',
      carName: '',
      carNumber: '',
      owner: '',
      category: '',
      amount: 0,
    );

    if (viewBy == SelectionView.byID) {
      loadUser = getUser.findById(pointer!);
      loadUserCar = getCar.findById(pointer!);
    } else {
      loadUser = getUser.findByName(pointer!);
      loadUserCar = getCar.findByName(pointer!);
    }

    bool checkOwen() {
      if (loadUserCar.id != '') {
        return true;
      } else {
        return false;
      }
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
                child: checkOwen()
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Car name:',
                            style: labelStyleInUserInfo(context),
                          ),
                          Text(
                            loadUserCar.carName,
                            style: detailsStyleInUserInfo(context),
                          ),
                          Text(
                            'Car number:',
                            style: labelStyleInUserInfo(context),
                          ),
                          Text(
                            loadUserCar.carNumber,
                            style: detailsStyleInUserInfo(context),
                          ),
                          Text(
                            'Category:',
                            style: labelStyleInUserInfo(context),
                          ),
                          Text(
                            loadUserCar.category,
                            style: detailsStyleInUserInfo(context),
                          ),
                          Text(
                            'Fuel amount:',
                            style: labelStyleInUserInfo(context),
                          ),
                          Text(
                            loadUserCar.amount.toString(),
                            style: detailsStyleInUserInfo(context),
                          ),
                        ],
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Don\'t owen a car',
                              style: GoogleFonts.adamina(
                                color: color1,
                                fontSize: size.height / 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(AddCar.routeName, arguments: [
                                  loadUser.id,
                                  loadUser.fullName
                                ]);
                              },
                              icon: const Icon(
                                Icons.add_circle,
                                color: color1,
                                size: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
IconButton(
onPressed: () {
showDialog(
context: context,
builder: (context) => AlertDialog(
title: Row(
children: const [
Icon(
Icons.warning,
color: Colors.red,
),
Text(
'Warning',
style: TextStyle(
color: Colors.red,
fontWeight: FontWeight.bold,
),
),
],
),
content: Text(
'Are you sure you want to remove ${loadUser.fullName}?'
'\nPress "Ok" to remove ${loadUser.fullName}.'
'\nPress "Cancel" to go back.',
style: GoogleFonts.inter(color: color5),
),
actions: [
TextButton(
onPressed: () => Navigator.pop(context),
child: const Text('Cancel'),
),
TextButton(
onPressed: () {
if (viewBy == SelectionView.byID) {
getUser.deleteUserByID(pointer);
*/
/*if (loadUserCar.id != '') {
                            getCar.deleteCarByID(loadUserCar.id);
                          }*/ /*

Navigator.pop(context);
} else {
getUser.deleteUserByName(pointer);
*/
/*if (loadUserCar.id != '') {
                            getCar.deleteCarByID(loadUserCar.id);
                          }*/ /*

Navigator.pop(context);
}
Navigator.pop(context);
},
child: const Text('Ok'),
),
],
),
);
},
icon: const Icon(
Icons.delete_forever,
color: Colors.redAccent,
),
),*/
