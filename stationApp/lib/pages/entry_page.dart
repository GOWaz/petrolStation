// ignore_for_file: use_rethrow_when_possible, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stationapp/classes/login_info.dart';
import 'package:stationapp/classes/storage.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/pages/mani_page.dart';
import 'package:stationapp/widgets/signIn_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EntryPage extends StatefulWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  final _storage = const FlutterSecureStorage();
  final _adminEmail = TextEditingController(text: '');
  final _password = TextEditingController(text: '');
  final _name = TextEditingController(text: '');
  final _apiToken = TextEditingController(text: '');
  final _form = GlobalKey<FormState>();
  var _isLoading = false;
  var admin = AdminLoginInfo();

  Future<void> store() async {
    _adminEmail.text = await _storage.read(key: "KEY_ADMINEMAIL") ?? '';
    _password.text = await _storage.read(key: "KEY_PASSWORD") ?? '';
  }

  @override
  void initState() {
    super.initState();
    store();
  }

  @override
  void dispose() {
    _adminEmail.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _onLogin() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _isValidated = _form.currentState!.validate();
    if (!_isValidated) {
      return;
    }
    _form.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    await _storage.write(key: "KEY_ADMINEMAIL", value: _adminEmail.text);
    await _storage.write(key: "KEY_PASSWORD", value: _password.text);
    var url = Uri.parse('http://192.168.1.8:7882/api/admin/login');
    /*print(_adminEmail.text);
    print(_password.text);*/
    try {
      final response = await http.post(url, body: {
        'email': _adminEmail.text,
        'password': _password.text,
      });
      //print(response.body);
      var extracted = json.decode(response.body) as List<dynamic>;
      //print(extracted);
      await _storage.write(
          key: "KEY_APITOKEN", value: extracted[0]['api_token']);
      await _storage.write(key: "KEY_ADMINNAME", value: extracted[0]['name']);
      _name.text = await _storage.read(key: "KEY_ADMINNAME") ?? '';
      _apiToken.text = await _storage.read(key: "KEY_APITOKEN") ?? '';
      final store = Storage();
      store.store(_name, _apiToken);
      /*print(_name.text);
      print(_apiToken.text);*/
    } catch (error) {
      print(error);
      throw (error);
    }
    setState(() {
      _isLoading = false;
    });
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, MainPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Stack(
                children: [
                  Row(
                    children: [
                      Container(
                        height: size.height,
                        width: size.width / 2,
                        color: Colors.white,
                        child: Form(
                          key: _form,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'SignIn',
                                style: GoogleFonts.inter(
                                    fontSize: 60, color: color2),
                              ),
                              SizedBox(
                                height: size.height / 8,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 60, right: 60),
                                child: SizedBox(
                                  height: size.height / 6,
                                  width: size.width / 2,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Username',
                                      hintStyle: GoogleFonts.inter(
                                        fontSize: 20,
                                        color: color3,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      filled: true,
                                      fillColor: color1,
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    controller: _adminEmail,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter a name';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      admin.email = value;
                                    },
                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 60, right: 60),
                                child: SizedBox(
                                  height: size.height / 6,
                                  width: size.width / 2,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: GoogleFonts.inter(
                                        fontSize: 20,
                                        color: color3,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      filled: true,
                                      fillColor: color1,
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    //obscureText: true,
                                    controller: _password,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter your password';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      admin.password = value;
                                    },
                                    textInputAction: TextInputAction.done,
                                    onFieldSubmitted: (_) => _onLogin(),
                                  ),
                                ),
                              ),
                              SignInButton(
                                text: 'Login',
                                onPress: () => _onLogin(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: size.height,
                        width: size.width / 2,
                        color: color2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: size.height / 4,
                              width: size.width / 4,
                              child: Image.asset('images/2.jpg'),
                            ),
                            Text(
                              'Welcome !',
                              style: GoogleFonts.inter(
                                fontSize: 30,
                                color: color4,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: size.height / 14,
                            ),
                            Text(
                              'If you haven\'t purchase a key feel free to contact us',
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: size.height / 14,
                            ),
                            Text(
                              'LINK',
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
