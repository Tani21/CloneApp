import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:font_awesome/';
import 'package:trello/pallete.dart';
import 'package:trello/widgets/widgets.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);

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

              RoundedButton(buttonName: 'Login',),
              
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





