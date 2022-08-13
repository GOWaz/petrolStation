// ignore_for_file: avoid_print, use_rethrow_when_possible

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/providers/user_provider/user.dart';
import 'package:stationapp/providers/user_provider/user_provider.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  static const routeName = '/addUser';

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _form = GlobalKey<FormState>();

  var _addUser = User(
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

  var _isLoading = false;

  Future<void> _onSave() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _isValidated = _form.currentState!.validate();
    if (!_isValidated) {
      return;
    }
    _form.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<UsersProvider>(context, listen: false)
          .addUser(_addUser);
    } catch (error) {
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
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        backgroundColor: color5,
        title: const Text('Add new user'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _form,
              child: Center(
                child: SizedBox(
                  width: size.width / 4,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                          elevation: 40.0,
                          shadowColor: Colors.black,
                          child: TextFormField(
                            decoration: fieldDecoration('Full name'),
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a name';
                              }
                              return null;
                            },
                            onChanged: (value) => setState(() {
                              _addUser = User(
                                id: _addUser.id,
                                fullName: value,
                                nationalNumber: _addUser.nationalNumber,
                                phoneNumber: _addUser.phoneNumber,
                                email: _addUser.email,
                                password: _addUser.password,
                                carId: _addUser.carId,
                                ownerId: _addUser.id,
                                carName: _addUser.carName,
                                carNumber: _addUser.carNumber,
                                category: _addUser.category,
                                amount: _addUser.amount,
                              );
                            }),
                          ),
                        ),
                        Material(
                          elevation: 40.0,
                          shadowColor: Colors.black,
                          child: TextFormField(
                            decoration: fieldDecoration('National number'),
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter the user Nationality number';
                              }
                              return null;
                            },
                            onChanged: (value) => setState(() {
                              _addUser = User(
                                id: _addUser.id,
                                fullName: _addUser.fullName,
                                nationalNumber: value,
                                phoneNumber: _addUser.phoneNumber,
                                email: _addUser.email,
                                password: _addUser.password,
                                carId: _addUser.carId,
                                ownerId: _addUser.id,
                                carName: _addUser.carName,
                                carNumber: _addUser.carNumber,
                                category: _addUser.category,
                                amount: _addUser.amount,
                              );
                            }),
                          ),
                        ),
                        Material(
                          elevation: 40.0,
                          shadowColor: Colors.black,
                          child: TextFormField(
                            decoration: fieldDecoration('Phone Number'),
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a Phone number';
                              }
                              return null;
                            },
                            onChanged: (value) => setState(() {
                              _addUser = User(
                                id: _addUser.id,
                                fullName: _addUser.fullName,
                                nationalNumber: _addUser.nationalNumber,
                                phoneNumber: value,
                                email: _addUser.email,
                                password: _addUser.password,
                                carId: _addUser.carId,
                                ownerId: _addUser.id,
                                carName: _addUser.carName,
                                carNumber: _addUser.carNumber,
                                category: _addUser.category,
                                amount: _addUser.amount,
                              );
                            }),
                          ),
                        ),
                        Material(
                          elevation: 40.0,
                          shadowColor: Colors.black,
                          child: TextFormField(
                            decoration: fieldDecoration('Email'),
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter an Email';
                              }
                              return null;
                            },
                            onChanged: (value) => setState(() {
                              _addUser = User(
                                id: _addUser.id,
                                fullName: _addUser.fullName,
                                nationalNumber: _addUser.nationalNumber,
                                phoneNumber: _addUser.phoneNumber,
                                email: value,
                                password: _addUser.password,
                                carId: _addUser.carId,
                                ownerId: _addUser.id,
                                carName: _addUser.carName,
                                carNumber: _addUser.carNumber,
                                category: _addUser.category,
                                amount: _addUser.amount,
                              );
                            }),
                          ),
                        ),
                        Material(
                          elevation: 40.0,
                          shadowColor: Colors.black,
                          child: TextFormField(
                            decoration: fieldDecoration('Password'),
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter user\'s password';
                              }
                              if (value.length < 8) {
                                return 'The password should be at least 8 character long';
                              }
                              return null;
                            },
                            onChanged: (value) => setState(() {
                              _addUser = User(
                                id: _addUser.id,
                                fullName: _addUser.fullName,
                                nationalNumber: _addUser.nationalNumber,
                                phoneNumber: _addUser.phoneNumber,
                                email: _addUser.email,
                                password: value,
                                carId: _addUser.carId,
                                ownerId: _addUser.id,
                                carName: _addUser.carName,
                                carNumber: _addUser.carNumber,
                                category: _addUser.category,
                                amount: _addUser.amount,
                              );
                            }),
                          ),
                        ),
                        Material(
                          elevation: 40.0,
                          shadowColor: Colors.black,
                          child: TextFormField(
                            decoration: fieldDecoration('Car name'),
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'You must enter car name';
                              }
                              return null;
                            },
                            onChanged: (value) => setState(() {
                              _addUser = User(
                                id: _addUser.id,
                                fullName: _addUser.fullName,
                                nationalNumber: _addUser.nationalNumber,
                                phoneNumber: _addUser.phoneNumber,
                                email: _addUser.email,
                                password: _addUser.password,
                                carId: _addUser.carId,
                                ownerId: _addUser.id,
                                carName: (value),
                                carNumber: _addUser.carNumber,
                                category: _addUser.category,
                                amount: _addUser.amount,
                              );
                            }),
                          ),
                        ),
                        Material(
                          elevation: 40.0,
                          shadowColor: Colors.black,
                          child: TextFormField(
                            decoration: fieldDecoration('Car number'),
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'You must enter car number';
                              }
                              return null;
                            },
                            onChanged: (value) => setState(() {
                              _addUser = User(
                                id: _addUser.id,
                                fullName: _addUser.fullName,
                                nationalNumber: _addUser.nationalNumber,
                                phoneNumber: _addUser.phoneNumber,
                                email: _addUser.email,
                                password: _addUser.password,
                                carId: _addUser.carId,
                                ownerId: _addUser.id,
                                carName: _addUser.carName,
                                carNumber: value,
                                category: _addUser.category,
                                amount: _addUser.amount,
                              );
                            }),
                          ),
                        ),
                        Material(
                          elevation: 40.0,
                          shadowColor: Colors.black,
                          child: TextFormField(
                            decoration: fieldDecoration('Category'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'You must enter car category';
                              }
                              return null;
                            },
                            onChanged: (value) => setState(() {
                              _addUser = User(
                                id: _addUser.id,
                                fullName: _addUser.fullName,
                                nationalNumber: _addUser.nationalNumber,
                                phoneNumber: _addUser.phoneNumber,
                                email: _addUser.email,
                                password: _addUser.password,
                                carId: _addUser.carId,
                                ownerId: _addUser.id,
                                carName: _addUser.carName,
                                carNumber: _addUser.carNumber,
                                category: value,
                                amount: _addUser.amount,
                              );
                            }),
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) => _onSave(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onSave(),
        backgroundColor: color5,
        child: const Icon(Icons.check),
      ),
    );
  }
}
