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
  final _nameController = TextEditingController();
  final _nationalNumberController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _carNameController = TextEditingController();
  final _carNumberController = TextEditingController();
  final _categoryController = TextEditingController();

  final _form = GlobalKey<FormState>();

  var _isLoading = false;

  var _editUser = User(
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

  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final userID = ModalRoute.of(context)!.settings.arguments as int;
      // ignore: unnecessary_null_comparison
      if (userID != null) {
        _editUser = Provider.of<UsersProvider>(context).findById(userID);
        _nameController.text = _editUser.fullName;
        _nationalNumberController.text = _editUser.nationalNumber;
        _phoneNumberController.text = _editUser.phoneNumber;
        _emailController.text = _editUser.email;
        _passwordController.text = _editUser.password;
        _carNameController.text = _editUser.carName;
        _carNumberController.text = _editUser.carNumber;
        _categoryController.text = _editUser.category;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nationalNumberController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _carNameController.dispose();
    _carNumberController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

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
      if (!_editUser.id.isNaN) {
        await Provider.of<UsersProvider>(context, listen: false)
            .updateUser(_editUser.id, _editUser);
      }
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
        title: const Text('Edit user'),
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
                                password: _editUser.password,
                                carId: _editUser.carId,
                                ownerId: _editUser.id,
                                carName: _editUser.carName,
                                carNumber: _editUser.carNumber,
                                category: _editUser.category,
                                amount: _editUser.amount,
                              );
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
                                password: _editUser.password,
                                carId: _editUser.carId,
                                ownerId: _editUser.id,
                                carName: _editUser.carName,
                                carNumber: _editUser.carNumber,
                                category: _editUser.category,
                                amount: _editUser.amount,
                              );
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
                                password: _editUser.password,
                                carId: _editUser.carId,
                                ownerId: _editUser.id,
                                carName: _editUser.carName,
                                carNumber: _editUser.carNumber,
                                category: _editUser.category,
                                amount: _editUser.amount,
                              );
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
                                password: _editUser.password,
                                carId: _editUser.carId,
                                ownerId: _editUser.id,
                                carName: _editUser.carName,
                                carNumber: _editUser.carNumber,
                                category: _editUser.category,
                                amount: _editUser.amount,
                              );
                            }),
                          ),
                        ),
                        Material(
                          elevation: 40.0,
                          shadowColor: Colors.black,
                          child: TextFormField(
                            decoration: fieldDecoration('Car name'),
                            controller: _carNameController,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'You must enter car name';
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
                                password: _editUser.password,
                                carId: _editUser.carId,
                                ownerId: _editUser.id,
                                carName: (value),
                                carNumber: _editUser.carNumber,
                                category: _editUser.category,
                                amount: _editUser.amount,
                              );
                            }),
                          ),
                        ),
                        Material(
                          elevation: 40.0,
                          shadowColor: Colors.black,
                          child: TextFormField(
                            decoration: fieldDecoration('Car number'),
                            controller: _carNumberController,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'You must enter car number';
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
                                password: _editUser.password,
                                carId: _editUser.carId,
                                ownerId: _editUser.id,
                                carName: _editUser.carName,
                                carNumber: value,
                                category: _editUser.category,
                                amount: _editUser.amount,
                              );
                            }),
                          ),
                        ),
                        Material(
                          elevation: 40.0,
                          shadowColor: Colors.black,
                          child: TextFormField(
                            decoration: fieldDecoration('Category'),
                            controller: _categoryController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'You must enter car category';
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
                                password: _editUser.password,
                                carId: _editUser.carId,
                                ownerId: _editUser.id,
                                carName: _editUser.carName,
                                carNumber: _editUser.carNumber,
                                category: value,
                                amount: _editUser.amount,
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
