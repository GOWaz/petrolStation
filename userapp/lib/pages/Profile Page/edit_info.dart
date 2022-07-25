import 'package:flutter/material.dart';

class EditInfo extends StatelessWidget {
  final String label;
   final String info;
  const EditInfo({
    Key? key, required this.label,required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
      Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Text(
                    label,
                    style:const TextStyle(fontSize: 20, color: Colors.teal),
                  ),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.amber,
                    ),
                    label: const Text(
                      'Edit',
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
               Text(
                info,
                style:const TextStyle(fontSize: 15),
              ),
              const Divider(
                color: Colors.black,
              ),
            ]
    );
  }
}