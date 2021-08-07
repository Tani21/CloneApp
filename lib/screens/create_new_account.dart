import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trello/pallete.dart';
import 'package:trello/widgets/widgets.dart';

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
          
                    TextInputField(icon: Icons.person_outlined, 
                    hint: 'User Name', 
                    inputType: TextInputType.name, 
                    inputAction: TextInputAction.next,
                    ),
          
                    PasswordInput(icon: Icons.lock, 
                    hint: 'Email', 
                    inputType: TextInputType.streetAddress, 
                    inputAction: TextInputAction.next,
                    ),
          
                    PasswordInput(icon: Icons.lock, 
                    hint: 'Password', 
                    inputType: TextInputType.streetAddress, 
                    inputAction: TextInputAction.done,
                    ),

                    SizedBox(height: 25,),

                    RoundedButton(buttonName: 'Register'),

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