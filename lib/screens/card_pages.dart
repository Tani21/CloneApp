import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trello/screens/create_new_account.dart';
import 'package:trello/screens/login_screen.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome '+LoginPageUserName.loginPageUserName+'!'),
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,

      ),

      body: (
      Column(
        children: [
          TextButton(onPressed: () async {
            await FirebaseAuth.instance.signOut();
          }, child: Text('Sign out'),
          ),
        ],
      )
      ),

    );
  }
}
