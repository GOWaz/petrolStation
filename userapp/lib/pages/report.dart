import 'package:flutter/material.dart';
import 'package:userapp/pages/home%20page/home_page.dart';
import 'package:userapp/widgets/sign_in_up_button.dart';
import '../constants.dart';

class Report extends StatelessWidget {
  const Report({Key? key}) : super(key: key);
  static const routeName = '/Report';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
          backgroundColor: Colors.white,
          shadowColor: Colors.amber,
          title: const Text(
            'Report',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dear User...',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'to ensure a great experince for you with our application , if you have a note or complaint related to the application',
                  style: TextStyle(fontSize: 20),
                ),
                const Text(
                  'Please send it to us',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Thank you',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLines: 9,
                  maxLength: 450,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.teal,
                    )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                SignInUpButton(text: 'submit', onPress: () {})]),
        const   SizedBox(height: 60,),
               Row(
                mainAxisAlignment: MainAxisAlignment.end,
              children:const[
              
              Image(image:AssetImage('images/fuel.png'),
              height: 60,
              )
             ]
            
              ),
               
              ],
            ),
          ),
        ));
  }
}
