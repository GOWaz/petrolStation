import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/providers/employee_provider/employee.dart';
import 'package:stationapp/providers/employee_provider/employee_provider.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  static const routeName = '/addEmployee';

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final _form = GlobalKey<FormState>();

  // ignore: no_leading_underscores_for_local_identifiers
  var _addedEmployee = Employee(id: '', fullName: '', job: '');

  void _onSave() {
    // ignore: no_leading_underscores_for_local_identifiers
    final _isValidated = _form.currentState!.validate();
    if (!_isValidated) {
      return;
    }
    _form.currentState!.save();
    Provider.of<EmployeesProvider>(context, listen: false)
        .addEmployee(_addedEmployee);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      //backgroundColor: color1,
      appBar: AppBar(
        backgroundColor: color5,
        title: const Text('Hire an Employee'),
        actions: [
          IconButton(
            onPressed: () {
              _onSave();
            },
            icon: const Icon(
              Icons.check_box,
              color: color1,
            ),
          ),
        ],
      ),
      body: Form(
        key: _form,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: size.width / 4,
                child: Material(
                  elevation: 20.0,
                  shadowColor: color1,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Employee ID',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 20,
                        color: color1,
                        fontWeight: FontWeight.bold,
                      ),
                      filled: true,
                      fillColor: color5,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter an ID';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _addedEmployee = Employee(
                          id: value,
                          fullName: _addedEmployee.fullName,
                          job: _addedEmployee.job,
                        );
                      });
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ),
              SizedBox(
                width: size.width / 4,
                child: Material(
                  elevation: 20.0,
                  shadowColor: color1,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Employee Full Name',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 20,
                        color: color1,
                        fontWeight: FontWeight.bold,
                      ),
                      filled: true,
                      fillColor: color5,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter a name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _addedEmployee = Employee(
                          id: _addedEmployee.id,
                          fullName: value,
                          job: _addedEmployee.job,
                        );
                      });
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ),
              SizedBox(
                width: size.width / 4,
                child: Material(
                  elevation: 20.0,
                  shadowColor: color1,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Employee Jop',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 20,
                        color: color1,
                        fontWeight: FontWeight.bold,
                      ),
                      filled: true,
                      fillColor: color5,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter a job';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _addedEmployee = Employee(
                          id: _addedEmployee.id,
                          fullName: _addedEmployee.fullName,
                          job: value,
                        );
                      });
                    },
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {
                      _onSave();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onSave();
        },
        backgroundColor: color5,
        child: const Icon(Icons.check),
      ),
    );
  }
}
