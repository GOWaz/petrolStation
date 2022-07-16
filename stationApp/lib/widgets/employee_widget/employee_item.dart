import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/pages/employee_pages/edit_employee.dart';
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
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(name!),
            content: Text(job!),
            actions: [
              TextButton(
                onPressed: () async {
                  await Navigator.of(context)
                      .pushNamed(EditEmployee.routeName, arguments: id);
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                child: const Text('Edit'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Ok'),
              ),
            ],
          ),
        );
      },
      iconColor: color5,
      textColor: Colors.black,
      title: Text(name!),
      leading: const Icon(Icons.badge),
      subtitle: Text(job!),
      trailing: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Row(
                children: const [
                  Icon(
                    Icons.warning,
                    color: Colors.red,
                  ),
                  Text(
                    'Warning',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              content: Text(
                'Are you sure you want to fire $name?'
                '\nPress "Ok" to fire $name.'
                '\nPress "Cancel" to go back.',
                style: GoogleFonts.inter(color: color5),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    employee.deleteEmployee(id);
                    Navigator.pop(context);
                  },
                  child: const Text('Ok'),
                ),
              ],
            ),
          );
        },
        icon: const Icon(
          Icons.delete_forever,
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
