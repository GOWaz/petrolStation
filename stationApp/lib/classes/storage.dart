import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  final storage = const FlutterSecureStorage();
  final nameController = TextEditingController(text: '');
  final apiTokenController = TextEditingController(text: '');

  Future<void> store(
      TextEditingController name, TextEditingController api) async {
    await storage.write(key: "APITOKEN", value: api.text);
    await storage.write(key: "ADMINNAME", value: name.text);
    nameController.text = await storage.read(key: "KEY_ADMINNAME") ?? '';
    apiTokenController.text = await storage.read(key: "KEY_APITOKEN") ?? '';
  }
}
