// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/classes/employee_search.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/pages/employee_pages/add_employee_page.dart';
import 'package:stationapp/providers/employee_provider/employee_provider.dart';
import 'package:stationapp/widgets/employee_widget/employee_item.dart';

class EmployeesListView extends StatefulWidget {
  const EmployeesListView({Key? key}) : super(key: key);

  @override
  State<EmployeesListView> createState() => _EmployeesListViewState();
}

class _EmployeesListViewState extends State<EmployeesListView> {
  Future<void> _updateEmployeesList(BuildContext context) async {
    try {
      await Provider.of<EmployeesProvider>(context, listen: false)
          .fetchEmployees();
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

  var _isInit = true;
  var _isLoading = false;

  @override
  Future<void> didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      try {
        await Provider.of<EmployeesProvider>(context)
            .fetchEmployees(); /*.then((_) {
          setState(() {
            _isLoading = false;
          });
        });*/
      } catch (error) {
        //print(error);
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
    final getEmployee = Provider.of<EmployeesProvider>(context);
    final employees = getEmployee.employees;

    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        backgroundColor: color5,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: EmployeeSearch(),
              );
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () => setState(() {
              _updateEmployeesList(context);
            }),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: employees.length,
              itemBuilder: (_, i) => Column(
                children: [
                  EmployeeItemView(
                    id: employees[i].id,
                    name: employees[i].fullName,
                    job: employees[i].job,
                  )
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddEmployee.routeName);
        },
        backgroundColor: color5,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
