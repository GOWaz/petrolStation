import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/providers/employee_provider/employee.dart';
import 'package:stationapp/providers/employee_provider/employee_provider.dart';

class EditEmployee extends StatefulWidget {
  const EditEmployee({Key? key}) : super(key: key);

  static const routeName = '/Edit';

  @override
  State<EditEmployee> createState() => _EditEmployeeState();
}

class _EditEmployeeState extends State<EditEmployee> {
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _jobController = TextEditingController();

  final _form = GlobalKey<FormState>();

  var _editedEmployee = Employee(id: '', fullName: '', job: '');

  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final employeeID = ModalRoute.of(context)!.settings.arguments as String;
      // ignore: unnecessary_null_comparison
      if (employeeID != null) {
        _editedEmployee =
            Provider.of<EmployeesProvider>(context).findById(employeeID);
        _idController.text = employeeID; //_editedEmployee.id!;
        _nameController.text = _editedEmployee.fullName;
        _jobController.text = _editedEmployee.job;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _jobController.dispose();
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
      if (_editedEmployee.id != '') {
        await Provider.of<EmployeesProvider>(context, listen: false)
            .updateEmployee(_editedEmployee.id, _editedEmployee);
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
        title: const Text('Hire an Employee'),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                        elevation: 40.0,
                        shadowColor: Colors.black,
                        child: TextFormField(
                          decoration: fieldDecoration('Employee Full Name'),
                          controller: _nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter a name';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _editedEmployee = Employee(
                                id: _editedEmployee.id,
                                fullName: value,
                                job: _editedEmployee.job,
                              );
                            });
                          },
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      Material(
                        elevation: 40.0,
                        shadowColor: Colors.black,
                        child: TextFormField(
                          decoration: fieldDecoration('Employee Jop'),
                          controller: _jobController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter a job';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _editedEmployee = Employee(
                                id: _editedEmployee.id,
                                fullName: _editedEmployee.fullName,
                                job: value,
                              );
                            });
                          },
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) => _onSave(),
                        ),
                      ),
                    ],
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
