import 'dart:ui';
import 'login_screen.dart';
import 'package:flutter/material.dart';
import 'package:trello/pallete.dart';
import 'package:trello/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trello/main.dart';

class CreateNewAccount extends StatelessWidget {
  const CreateNewAccount({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/jellyfish.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.width * 0.1,),

                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 3,
                            sigmaY: 3,
                          ),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey[400]!.withOpacity(0.4),
                            child: Icon(
                              Icons.person_outlined,
                              color: kWhite,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Positioned(
                    //   child: Container(
                    //     height: size.width * 0.12,
                    //     width: size.width * 0.12,
                    //     decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       border: Border.all(color: kWhite,
                    //       width: 2,
                    //       ),
                    //       ),
                    //       child: Icon(
                    //         Icons.arrow_upward,
                    //         color: kWhite,),
                    //       ),
                    //   ),
                  ],
                ),

                SizedBox(height: size.width * 0.1,),
                Column(
                  children: [

                    TextInputFieldSignUpUserName(),
                    // TextInputField(icon: Icons.person_outlined,
                    // hint: 'User Name',
                    // inputType: TextInputType.name,
                    // inputAction: TextInputAction.next,
                    // ),


                    TextInputFieldSignUpEmail(),
                    // PasswordInput(icon: Icons.lock,
                    // hint: 'Email',
                    // inputType: TextInputType.streetAddress,
                    // inputAction: TextInputAction.next,
                    // ),

                    TextInputFieldSignUpPassword(),
                    // PasswordInput(icon: Icons.lock,
                    // hint: 'Password',
                    // inputType: TextInputType.streetAddress,
                    // inputAction: TextInputAction.done,
                    // ),

                    SizedBox(height: 25,),

                    //RoundedButton(buttonName: 'Register'),
                    SignInButton(),
                    SizedBox(height: 25,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?  ',
                        style: kBodyText,),

                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                           },
                          child: Text('Login',
                          style: kBodyText.copyWith(
                            color: kBlue,
                            fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class SignInButton extends StatefulWidget {
  String storeSignUpEmail="", storeSignUpPassword="";
  //const SignInButton({Key? key}) : super(key: key);

  @override
  _SignInButtonState createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
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
          // main();

          try {
            UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: TextInputFieldSignUpEmail.signUpEmail,
                password: TextInputFieldSignUpPassword.signUpPass,
            );
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              print('The password provided is too weak.');
            } else if (e.code == 'email-already-in-use') {
              print('The account already exists for that email.');
            }
          } catch (e) {
            print(e);
          }



        },
        child: Text('Sign Up', style: kBodyText.copyWith(fontWeight: FontWeight.bold)),
      ),
    );
  }
}


class TextInputFieldSignUpUserName extends StatefulWidget {
  static String userName="";
  const TextInputFieldSignUpUserName({Key? key}) : super(key: key);

  @override
  TextInputFieldSignUpUserNameState createState() => TextInputFieldSignUpUserNameState();
}

class TextInputFieldSignUpUserNameState extends State<TextInputFieldSignUpUserName> {
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
                TextInputFieldSignUpUserName.userName=value;
              });
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.person_outline, size: 28, color: kWhite,),
              ),
              hintText: 'Username',
              hintStyle: kBodyText,
            ),
            style: kBodyText,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
        ),
      ),
    );
  }
}



class TextInputFieldSignUpEmail extends StatefulWidget {
  static String signUpEmail="";
  const TextInputFieldSignUpEmail({Key? key}) : super(key: key);

  @override
  TextInputFieldSignUpEmailState createState() => TextInputFieldSignUpEmailState();
}

class TextInputFieldSignUpEmailState extends State<TextInputFieldSignUpEmail> {
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
                TextInputFieldSignUpEmail.signUpEmail=value;
                //TextInputFieldEmail.email=value;
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



class TextInputFieldSignUpPassword extends StatefulWidget {
  static String signUpPass="";
  const TextInputFieldSignUpPassword({Key? key}) : super(key: key);

  @override
  TextInputFieldSignUpPasswordState createState() => TextInputFieldSignUpPasswordState();
}

class TextInputFieldSignUpPasswordState extends State<TextInputFieldSignUpPassword> {
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
                TextInputFieldSignUpPassword.signUpPass=value;
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


