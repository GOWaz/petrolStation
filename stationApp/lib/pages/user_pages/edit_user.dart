import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/providers/user_provider/user.dart';
import 'package:stationapp/providers/user_provider/user_provider.dart';

class EditUser extends StatefulWidget {
  const EditUser({Key? key}) : super(key: key);
  static const routeName = '/editUser';

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _nationalNumberController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _form = GlobalKey<FormState>();

  var _editUser = User(
      id: '',
      fullName: '',
      nationalNumber: '',
      phoneNumber: '',
      email: '',
      password: '');

  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final userID = ModalRoute.of(context)!.settings.arguments as String;
      // ignore: unnecessary_null_comparison
      if (userID != null) {
        _editUser = Provider.of<UsersProvider>(context).findById(userID);
        _idController.text = userID;
        _nameController.text = _editUser.fullName;
        _nationalNumberController.text = _editUser.nationalNumber;
        _phoneNumberController.text = _editUser.phoneNumber;
        _emailController.text = _editUser.email;
        _passwordController.text = _editUser.password;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _nationalNumberController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSave() {
    // ignore: no_leading_underscores_for_local_identifiers
    final _isValidated = _form.currentState!.validate();
    if (!_isValidated) {
      return;
    }
    _form.currentState!.save();
    if (_editUser.id != '') {
      Provider.of<UsersProvider>(context, listen: false)
          .updateUser(_editUser.id, _editUser);
    }
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
      body: Form(
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
                      decoration: fieldDecoration('User ID'),
                      controller: _idController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an ID';
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() {
                        _editUser = User(
                            id: value,
                            fullName: _editUser.fullName,
                            nationalNumber: _editUser.nationalNumber,
                            phoneNumber: _editUser.phoneNumber,
                            email: _editUser.email,
                            password: _editUser.password);
                      }),
                    ),
                  ),
                  Material(
                    elevation: 40.0,
                    shadowColor: Colors.black,
                    child: TextFormField(
                      decoration: fieldDecoration('Full name'),
                      controller: _nameController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() {
                        _editUser = User(
                            id: _editUser.id,
                            fullName: value,
                            nationalNumber: _editUser.nationalNumber,
                            phoneNumber: _editUser.phoneNumber,
                            email: _editUser.email,
                            password: _editUser.password);
                      }),
                    ),
                  ),
                  Material(
                    elevation: 40.0,
                    shadowColor: Colors.black,
                    child: TextFormField(
                      decoration: fieldDecoration('National number'),
                      controller: _nationalNumberController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the user Nationality number';
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() {
                        _editUser = User(
                            id: _editUser.id,
                            fullName: _editUser.fullName,
                            nationalNumber: value,
                            phoneNumber: _editUser.phoneNumber,
                            email: _editUser.email,
                            password: _editUser.password);
                      }),
                    ),
                  ),
                  Material(
                    elevation: 40.0,
                    shadowColor: Colors.black,
                    child: TextFormField(
                      decoration: fieldDecoration('Phone Number'),
                      controller: _phoneNumberController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a Phone number';
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() {
                        _editUser = User(
                            id: _editUser.id,
                            fullName: _editUser.fullName,
                            nationalNumber: _editUser.nationalNumber,
                            phoneNumber: value,
                            email: _editUser.email,
                            password: _editUser.password);
                      }),
                    ),
                  ),
                  Material(
                    elevation: 40.0,
                    shadowColor: Colors.black,
                    child: TextFormField(
                      decoration: fieldDecoration('Email'),
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an Email';
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() {
                        _editUser = User(
                            id: _editUser.id,
                            fullName: _editUser.fullName,
                            nationalNumber: _editUser.nationalNumber,
                            phoneNumber: _editUser.phoneNumber,
                            email: value,
                            password: _editUser.password);
                      }),
                    ),
                  ),
                  Material(
                    elevation: 40.0,
                    shadowColor: Colors.black,
                    child: TextFormField(
                      decoration: fieldDecoration('Password'),
                      controller: _passwordController,
                      textInputAction: TextInputAction.done,
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
                        _editUser = User(
                            id: _editUser.id,
                            fullName: _editUser.fullName,
                            nationalNumber: _editUser.nationalNumber,
                            phoneNumber: _editUser.phoneNumber,
                            email: _editUser.email,
                            password: value);
                      }),
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
