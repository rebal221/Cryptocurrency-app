import 'package:flutter/material.dart';
import '/components/home_app_bar.dart';
import '/components/side_bar.dart';
import '/screens/login/components/body.dart';

class Login extends StatefulWidget {
  static String routeName = "/login";
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool remember = false;
  final List<String> errors = [];
  final passcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      endDrawer: const SideBar(),
      appBar: HomeAppBar(),
      backgroundColor: Colors.white,
      body: Center(
          child: Body(
        screenwidth: screenwidth,
        screenheight: screenheight,
        context: context,
      )),
    );
  }
}
