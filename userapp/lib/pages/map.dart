import 'package:flutter/material.dart';
import '../constants.dart';
import 'home_page.dart';

class Maps extends StatelessWidget {
  const Maps({Key? key}) : super(key: key);
static const routeName = '/Maps';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.amber,
        backgroundColor: Colors.white,
        title:const Text('Map',style: TextStyle(color: Colors.black),),
        leading: IconButton(
            alignment: Alignment.center,
            color: color1,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            icon: const Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: [
            Row(
              children:const [
                Text('')
              ],
            )
          ],
        ),
    );
  }
}