import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/providers/car_provider/car.dart';
import 'package:stationapp/providers/car_provider/car_provider.dart';

class AddCar extends StatefulWidget {
  const AddCar({Key? key}) : super(key: key);

  static const routeName = '/addCar';

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  final _dateController = TextEditingController();

  @override
  void initState() {
    _dateController.text = "";
    super.initState();
  }

  var _addedCar = Car(
    id: '',
    ownerId: '',
    carName: '',
    carNumber: '',
    owner: '',
    category: '',
    amount: 0,
  );

  final _form = GlobalKey<FormState>();

  var _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      final userInfo = ModalRoute.of(context)!.settings.arguments as List;
      // ignore: unnecessary_null_comparison
      if (userInfo != null) {
        _addedCar = Car(
          id: _addedCar.id,
          ownerId: userInfo[0], //_addedCar.ownerId,
          carName: _addedCar.carName,
          carNumber: _addedCar.carNumber,
          owner: userInfo[1],
          category: _addedCar.category,
          amount: _addedCar.amount,
        );
      }
      _isInit = false;
      super.didChangeDependencies();
    }
  }

  String? value;
  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  void _onSave() {
    // ignore: no_leading_underscores_for_local_identifiers
    final _isValidated = _form.currentState!.validate();
    if (!_isValidated) {
      return;
    }
    _form.currentState!.save();
    if (_addedCar.ownerId != '') {
      Provider.of<CarsProvider>(context, listen: false).addCar(_addedCar);
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
        title: const Text('Add car to this User'),
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
                      decoration: fieldDecoration('Car ID'),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'You must enter car ID';
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() {
                        _addedCar = Car(
                          id: value,
                          ownerId: _addedCar.ownerId,
                          carName: _addedCar.carName,
                          carNumber: _addedCar.carNumber,
                          owner: _addedCar.owner,
                          category: _addedCar.category,
                          amount: _addedCar.amount,
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
                        _addedCar = Car(
                          id: _addedCar.id,
                          ownerId: _addedCar.ownerId,
                          carName: value,
                          carNumber: _addedCar.carNumber,
                          owner: _addedCar.owner,
                          category: _addedCar.category,
                          amount: _addedCar.amount,
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
                        _addedCar = Car(
                          id: _addedCar.id,
                          ownerId: _addedCar.ownerId,
                          carName: _addedCar.carName,
                          carNumber: value,
                          owner: _addedCar.owner,
                          category: _addedCar.category,
                          amount: _addedCar.amount,
                        );
                      }),
                    ),
                  ),
                  Material(
                    elevation: 40.0,
                    shadowColor: Colors.black,
                    child: TextFormField(
                      decoration: fieldDecoration('Category'),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'You must enter car category';
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() {
                        _addedCar = Car(
                          id: _addedCar.id,
                          ownerId: _addedCar.ownerId,
                          carName: _addedCar.carName,
                          carNumber: _addedCar.carNumber,
                          owner: _addedCar.owner,
                          category: value,
                          amount: _addedCar.amount,
                        );
                      }),
                    ),
                  ),
                  Material(
                    elevation: 40.0,
                    shadowColor: Colors.black,
                    child: TextFormField(
                      decoration: fieldDecoration('Fuel amount'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'You must enter car ID';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please Enter\n A Valid Number!';
                        }
                        if (int.parse(value) < 20 || int.parse(value) > 250) {
                          return 'amount must be between 20 and 250';
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() {
                        _addedCar = Car(
                          id: _addedCar.id,
                          ownerId: _addedCar.ownerId,
                          carName: _addedCar.carName,
                          carNumber: _addedCar.carNumber,
                          owner: _addedCar.owner,
                          category: _addedCar.category,
                          amount: int.parse(value),
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
