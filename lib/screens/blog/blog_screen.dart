import 'package:flutter/material.dart';
import 'package:mining_sett/components/home_app_bar.dart';
import 'package:mining_sett/components/pop_up_defult_post.dart';
import 'package:mining_sett/components/side_bar.dart';
import 'package:mining_sett/components/side_bar_user.dart';
import 'package:mining_sett/constants.dart';
import 'package:mining_sett/screens/login/login.dart';
import 'package:mining_sett/utils/shared_preference.dart';
import 'components/body.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);
  static String routeName = '/Blog';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const SideBar(),
      appBar: HomeAppBar(),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        onPressed: () {
          UserPreferences().getloginsetion().then((value) {
            if (value == false) {
              Navigator.pushNamed(context, Login.routeName);
            } else {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => PopUpDefultPost(),
              );
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
