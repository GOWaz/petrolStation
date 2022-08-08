import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/providers/employee_provider/employee.dart';
import 'package:stationapp/providers/employee_provider/employee_provider.dart';

class EmployeeSearch extends SearchDelegate {
  List<Employee> getEmployee(BuildContext context) {
    return Provider.of<EmployeesProvider>(context).employees;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    List<Employee> user = getEmployee(context);
    for (var item in user) {
      if (item.fullName.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item.fullName);
      }
    }
    return ListView.builder(
      itemBuilder: (context, i) {
        var result = matchQuery[i];
        return ListTile(
          title: Text(result),
        );
      },
      itemCount: matchQuery.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    List<Employee> prod = getEmployee(context);
    for (var item in prod) {
      if (item.fullName.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item.fullName);
      }
    }
    return ListView.builder(
      itemBuilder: (context, i) {
        var result = matchQuery[i];
        return GestureDetector(
          child: ListTile(
            onTap: () {},
            title: Text(result),
          ),
        );
      },
      itemCount: matchQuery.length,
    );
  }
}
