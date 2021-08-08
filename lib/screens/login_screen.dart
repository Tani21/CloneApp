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
                  // TextInputField(
                  //   icon: Icons.email,
                  //   hint: 'Email',
                  //   inputType: TextInputType.emailAddress,
                  //   inputAction: TextInputAction.next,
                  // ),

                  TextInputFieldEmail(),

              LoginPagePassword(),
              //     PasswordInput(
              //   icon: Icons.lock,
              //   hint: 'Password',
              //   inputType: TextInputType.name,
              //   inputAction: TextInputAction.done,
              // ),
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


class TextInputFieldEmail extends StatefulWidget {
   static String email="";
  TextInputFieldEmail({Key? key}) : super(key: key);

  @override
  TextInputFieldEmailState createState() => TextInputFieldEmailState();
}

class TextInputFieldEmailState extends State<TextInputFieldEmail> {


  @override
  Widget build(BuildContext context) {

    Size size  = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height:size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),

        child: Center(
          child: TextField(
            onChanged: (value)
            {
              setState(() {
                TextInputFieldEmail.email=value;
              });
            },

            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.email, size: 28, color: kWhite,),
              ),
              hintText: 'Email',
              hintStyle: kBodyText,
            ),
            style: kBodyText,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
        ),
      ),
    );
  }
}


class _NewRoundedButtonState extends State<NewRoundedButton> {
  String storeEmail="", storePassword="";
  //FirebaseAuth auth = FirebaseAuth.instance;
  //var firestore = FirebaseFirestore.instance;
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

          storeEmail=TextInputFieldEmail.email;
          storePassword=LoginPagePassword.pass;
          //print("sss $store");

          //main();
          // UserCredential userCredential = await auth.signInAnonymously();
          // print(userCredential);
          //print(email);
          try {
            UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: storeEmail,
              password: storePassword,
            );
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              print('No user found for that email.');
            } else if (e.code == 'wrong-password') {
              print('Wrong password provided for that user.');
            }
          }
        },
        child: Text('Login',
            style: kBodyText.copyWith(fontWeight: FontWeight.bold)),
      ),
    );
  }
}


class LoginPagePassword extends StatefulWidget {
  static String pass="";
  const LoginPagePassword({Key? key}) : super(key: key);

  @override
  _LoginPagePasswordState createState() => _LoginPagePasswordState();
}

class _LoginPagePasswordState extends State<LoginPagePassword> {
  @override
  Widget build(BuildContext context) {
    Size size  = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height:size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),

        child: Center(
          child: TextField(
            onChanged: (value)
            {
              setState(() {
                LoginPagePassword.pass=value;
              });
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.lock, size: 28, color: kWhite,),
              ),
              hintText: 'Password',
              hintStyle: kBodyText,
            ),
            obscureText: true,
            style: kBodyText,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
          ),
        ),
      ),
    );
  }
}











