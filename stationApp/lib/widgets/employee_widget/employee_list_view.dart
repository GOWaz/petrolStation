import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/classes/employee_search.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/pages/add_employee_page.dart';
import 'package:stationapp/providers/employee_provider/employee_provider.dart';
import 'package:stationapp/widgets/employee_widget/employee_item.dart';

class EmployeesListView extends StatefulWidget {
  const EmployeesListView({Key? key}) : super(key: key);

  @override
  State<EmployeesListView> createState() => _EmployeesListViewState();
}

class _EmployeesListViewState extends State<EmployeesListView> {
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
          )
        ],
      ),
      body: ListView.builder(
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
