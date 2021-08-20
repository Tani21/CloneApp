import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trello/screens/card_pages.dart';
import 'package:trello/screens/create_new_account.dart';
import 'package:trello/screens/forgot_password.dart';
import 'package:trello/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:trello/widgets/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => new CardClassWithProvider()


      ),
    ],
child: MyApp(),
  ),


  );


}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trello',
      theme: ThemeData(
        textTheme: GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        'ForgotPassword': (context) => ForgotPassword(),
        'CreateNewAccount': (context) => CreateNewAccount(),
        'CardPages': (context) => CardClassWithProvider(),
      },
      // home: LoginScreen(),
    );
  }
}

