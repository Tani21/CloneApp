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
                  Container(
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
                ],
              ),     
        ),
      ],
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage(
    {
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) => LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.center,
        colors: [Colors.black, Colors.transparent]).createShader(rect),
        blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            
          ),
        ),
      ),
    );
  }
}



