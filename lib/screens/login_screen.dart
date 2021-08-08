import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:font_awesome/';
import 'package:trello/pallete.dart';
import 'package:trello/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trello/main.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
          image: 'assets/mountains.jpg',
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text('Trello',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    ),
                    ),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextInputField(
                    icon: Icons.email,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),

                  PasswordInput(
                icon: Icons.lock,
                hint: 'Password',
                inputType: TextInputType.name,
                inputAction: TextInputAction.done,
              ),
              GestureDetector
              (
                onTap: () => Navigator.pushNamed(context, 'ForgotPassword'),
                child: Text(
                  'Forgot password',
                  style: kBodyText,
                  ),
                ),

              SizedBox(
                height: 25,
              ),

              // RoundedButton(buttonName: 'Login',)
                  NewRoundedButton(),

              SizedBox(height: 25),

            ],
          ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'CreateNewAccount'),
                    child: Container(
                      child: Text('Create New Account',
                      style: kBodyText,
                      ),
                      decoration: BoxDecoration(border: Border(
                        bottom: BorderSide(width: 1,
                        color: kWhite,
                        ),
                      ),
                      ),
                    ),
                  ),
                ],
              ),
        ),
      ],
    );
  }
}

class NewRoundedButton extends StatefulWidget {
  const NewRoundedButton({Key? key}) : super(key: key);

  @override
  _NewRoundedButtonState createState() => _NewRoundedButtonState();
}

class _NewRoundedButtonState extends State<NewRoundedButton> {
  FirebaseAuth auth = FirebaseAuth.instance;
  var firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
      child: TextButton(
        onPressed: () async {
          main();
          UserCredential userCredential = await auth.signInAnonymously();
          print(userCredential);
        },
        child: Text('Login',
            style: kBodyText.copyWith(fontWeight: FontWeight.bold)),
      ),
    );
  }
}


//
// class RoundedButton extends StatefulWidget {
//   const RoundedButton({
//     Key? key,
//     required this.buttonName,
//   }) : super(key: key);
//
//   final String buttonName;
//
//
//
//   @override
//   _RoundedButtonState createState() => _RoundedButtonState();
// }
//
// class _RoundedButtonState extends State<RoundedButton> {
//
//   FirebaseAuth auth = FirebaseAuth.instance;
//   var firestore = FirebaseFirestore.instance;
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       height: size.height * 0.08,
//       width: size.width * 0.8,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: kBlue,
//       ),
//       child: TextButton(
//         onPressed: () async {
//           main();
//           UserCredential userCredential = await auth.signInAnonymously();
//           print(userCredential);
//         },
//         child: Text(widget.buttonName,
//             style: kBodyText.copyWith(fontWeight: FontWeight.bold)),
//       ),
//     );
//   }
// }







