import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/pages/user_pages/user_details_page.dart';
import 'package:stationapp/providers/car_provider/car_provider.dart';
import 'package:stationapp/providers/user_provider/user_provider.dart';

// ignore: must_be_immutable
class UserItemView extends StatelessWidget {
  String? id;
  String? name;
  String? nNumber;
  UserItemView({this.id, this.name, this.nNumber, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UsersProvider>(context);
    final car = Provider.of<CarsProvider>(context);

    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                UserDetails(viewBy: SelectionView.byID, pointer: id),
          ),
        );
      },
      iconColor: color5,
      textColor: Colors.black,
      title: Text(name!),
      leading: const Icon(Icons.person),
      subtitle: Text(nNumber!),
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
                'Are you sure you want to remove $name?'
                '\nPress "Ok" to remove $name.'
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
                    user.deleteUserByID(id);
                    car.deleteCarByID(id);
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

/*trailing: IconButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed(AddCar.routeName, arguments: [id, name]);
        },
        icon: const Icon(
          Icons.add_circle,
          color: color5,
        ),
      ),*/
