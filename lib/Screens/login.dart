import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garvita_colorbracket/Constants/app_constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../Provider/account_provider.dart';
import 'home.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerUserId = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  @override
  void dispose() {
    _controllerUserId.dispose();
    _controllerPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, w) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height / 4,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom:
                    Radius.elliptical(MediaQuery.of(context).size.width, 150.0),
              ),
              gradient: const LinearGradient(
                  colors: [
                    Constants.App_bar_blue,
                    Constants.App_bar_light,
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          title: const Text(
            "ColorBracket",
            style: TextStyle(
              // color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              shadows: <Shadow>[
                BoxShadow(
                  color: Constants.Icon_shadow,
                  spreadRadius: 10,
                  blurRadius: 15,
                ),
                BoxShadow(
                  color: Constants.Icon_shadow,
                  spreadRadius: -5,
                  blurRadius: 10,
                )
              ],
            ),
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom:
                  Radius.elliptical(MediaQuery.of(context).size.width, 200.0),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: deviceHeight(context) * 0.15,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20),
                        child: TextFormField(
                          autofocus: false,
                          decoration: const InputDecoration(
                            labelText: 'User Id: ',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
                          ),
                          controller: _controllerUserId,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter User Id';
                            } else if (!value.contains('@')) {
                              return 'Please Enter Valid User Id';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20),
                        child: TextFormField(
                          autofocus: false,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password: ',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
                          ),
                          controller: _controllerPass,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 75.0, right: 75),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              var result = await ref
                                  .read(accountProvider)
                                  .login(
                                      userId: _controllerUserId.text.trim(),
                                      pass: _controllerPass.text.trim());
                              if (result == 'success') {
                                // print(user);
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      child: const Home_Page(),
                                    ));
                              } else {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text(
                                            "Invalid Credentials, User not Found!!")));
                              }
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ),
                    ]),
              )),
        ),
      );
    });
  }
}
