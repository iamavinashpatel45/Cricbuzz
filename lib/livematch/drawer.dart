import 'package:cricket/login/account.dart';
import 'package:flutter/material.dart';

class mydrawer extends StatelessWidget {
  const mydrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        Text('Avinash'),
        Text('patel')
        // DrawerHeader(
        //     child: UserAccountsDrawerHeader(
        //   accountEmail: Text(account.email_),
        //   accountName: Text(account.name_!),
        // ))
      ],
    ));
  }
}
