import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/providers/user_provider/user.dart';
import 'package:stationapp/providers/user_provider/user_provider.dart';

enum SelectionView { byID, byName }

// ignore: must_be_immutable
class UserDetails extends StatelessWidget {
  SelectionView? viewBy;
  String? pointer;
  UserDetails({this.viewBy, this.pointer, Key? key}) : super(key: key);

  static const routeName = '/userView';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final getUser = Provider.of<UsersProvider>(context);
    var loadUser = User(
      id: '',
      fullName: '',
      nationalNumber: '',
      phoneNumber: '',
      email: '',
      password: '',
    );
    if (viewBy == SelectionView.byID) {
      loadUser = getUser.findById(pointer!);
    } else {
      loadUser = getUser.findByName(pointer!);
    }

    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        title: Text(
          loadUser.fullName!,
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: color1,
            ),
          ),
          IconButton(
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
                    'Are you sure you want to remove ${loadUser.fullName}?'
                    '\nPress "Ok" to remove ${loadUser.fullName}.'
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
                        if (viewBy == SelectionView.byID) {
                          getUser.deleteUserByID(pointer);
                          Navigator.pop(context);
                        } else {
                          getUser.deleteUserByName(pointer);
                          Navigator.pop(context);
                        }
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
        ],
        backgroundColor: color5,
      ),
      body: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(40),
            height: size.height / 2,
            width: size.width / 2,
            decoration: const BoxDecoration(
              color: color5,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.face,
                      size: size.width / 10,
                      color: color1,
                    ),
                    Text(loadUser.fullName!),
                    SizedBox(
                      width: size.width / 8,
                    ),
                    Text(loadUser.nationalNumber!),
                  ],
                ),
                SizedBox(
                  height: size.height / 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(loadUser.phoneNumber!),
                    SizedBox(
                      width: size.width / 8,
                    ),
                    Text(loadUser.email!),
                    SizedBox(
                      width: size.width / 8,
                    ),
                    Text(loadUser.password!),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
