import 'package:flutter/material.dart';
import 'package:trello/pallete.dart';
import 'package:trello/widgets/background_image.dart';
import 'package:trello/widgets/rounded_button.dart';
import 'package:trello/widgets/text_field_input.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size  = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/jellyfish.jpg',),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          elevation:0,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,
          color: kWhite,
          ),
          ),
          title: Text(
            'ForgotPassword',
            style: kBodyText,
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Center(
                child: Column(
                  children: [

                    SizedBox(height: size.height * 0.1),

                    Container(
                      width: size.width * 0.8,
                      child: Text('Enter your email, we will send instructions to reset your password',
                      style: kBodyText,
                      ),
                    ),

                    SizedBox(height: 20),

                    TextInputField(
                      icon: Icons.email, 
                      hint: 'Email', 
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.done
                      ),

                      SizedBox(height: 20),

                      RoundedButton(buttonName: 'Send'),

                  ],
                ),
              ),
            ],
            ),
        ),
      ]
    );
  }
}