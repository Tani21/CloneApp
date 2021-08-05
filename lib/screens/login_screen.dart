import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:font_awesome/';
import 'package:trello/pallete.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.black, Colors.transparent]).createShader(rect),
            blendMode: BlendMode.darken,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/mountains.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                
              ),
            ),
          ),
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

              TextInputField(),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height:70,
                  decoration: BoxDecoration(
                    color: Colors.grey[500]!.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Center(
                    child: TextField(
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height:70,
        decoration: BoxDecoration(
          color: Colors.grey[500]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),

        child: Center(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.card_giftcard, size: 28, color: kWhite,),
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