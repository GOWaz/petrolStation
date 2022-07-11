import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/providers/employee_provider/employee_provider.dart';

// ignore: must_be_immutable
class EmployeeItemView extends StatelessWidget {
  String? id;
  String? name;
  String? job;
  EmployeeItemView({this.id, this.name, this.job, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final employee = Provider.of<EmployeesProvider>(context);
    return ListTile(
      onTap: () {
        /*Navigator.push(context,
            MaterialPageRoute(builder: (context) => (id: id)));*/
      },
      iconColor: color5,
      textColor: Colors.black,
      title: Text(name!),
      leading: const Icon(Icons.badge),
      subtitle: Text(job!),
      trailing: IconButton(
        onPressed: () {
          //TODO:show a message to confirm deletion
          employee.deleteEmployee(id);
        },
        icon: const Icon(
          Icons.delete_forever,
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
