import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trello/screens/create_new_account.dart';
import 'package:trello/screens/login_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../pallete.dart';

class CardPage extends StatefulWidget {

   CardPage({Key? key}) : super(key: key);

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  var cardname="";
  int i=0;
  var arraynames = [];
  @override
  Widget build(BuildContext context) {
    var firestore = FirebaseFirestore.instance;

    Size size  = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome '+LoginPageUserName.loginPageUserName+'!'),
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,

      ),

      body:

        // Column(
        //   children: [
        //     Center(
        //         child: TextForCardName(),
        //
        //     ),
        //
        //     Center(child: SubmitButton()),
        //   ],
        // )



            
               Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Container(
                        height:size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                            color: Colors.grey[500]!.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(2)
                        ),

                        child: Center(
                          child: TextField(
                            onChanged: (value)
                            {
                              setState(() {
                               cardname=value;
                              });
                              print(cardname);
                            },

                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(Icons.email, size: 28, color: kWhite,),
                              ),
                              hintText: 'Card name',
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: Container(
                      height: size.height * 0.08,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.lightBlueAccent,
                      ),
                      child: TextButton(
                        onPressed: () async {
                          print(cardname);
                            var newmap = {'name': cardname};
                            firestore.collection('firstcollection').add(newmap);
                            print(cardname);

                          // db.collection('collectionName').get()
                          //     .then(snapshot => console.log(snapshot.size));


                          QuerySnapshot retrievedmap = await firestore.collection('firstcolection').get();
                          await FirebaseFirestore.instance
                              .collection('firstcollection')
                              .get()
                              .then((QuerySnapshot querySnapshot) {
                            querySnapshot.docs.forEach((doc) {
                              print(doc["name"]);

                              arraynames.add(doc["name"]);
                              print("arrayname: "+arraynames[i]);
                              i=i+1;
                              print(i);
                            });
                          });

                          for(int j=0; j<arraynames.length; j++)
                            {
                              print("for loop: "+arraynames[j]);
                            }

                           //var query = firestore.collection("firstcollection").get();

                          //
                          // const snapshot = await query.get();
                          // const count = snapshot.size;
                        },
                        child: Text('Submit',
                            style: kBodyText.copyWith(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),



                   Expanded(
                     child: Container(
                        child: ListView.builder(
                          itemCount:arraynames.length,
                            itemBuilder: (context, index)
                        {
                          return Container(
                            child: ListTile(
                              contentPadding: EdgeInsets.only(left:32, right:32, top:38,bottom: 38),
                              tileColor: Colors.teal,
                              title: Text(arraynames[index], style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
                              subtitle: Text("Is there is subtext", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),),
                            ),
                            margin: EdgeInsets.only(bottom: 8, left: 38, right: 38, top:8),
                          );
                        }
                        ),
                      ),
                   ),
                  
                ],
              ),
            






    );
  }
}




















//
//
//
//
//
//
// class TextForCardName extends StatefulWidget {
//   const TextForCardName({Key? key}) : super(key: key);
//
//   @override
//   _TextForCardNameState createState() => _TextForCardNameState();
// }
//
// class _TextForCardNameState extends State<TextForCardName> {
//   @override
//   Widget build(BuildContext context) {
//     Size size  = MediaQuery.of(context).size;
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Container(
//         height:size.height * 0.08,
//         width: size.width * 0.8,
//         decoration: BoxDecoration(
//           color: Colors.grey[500]!.withOpacity(0.5),
//           borderRadius: BorderRadius.circular(2)
//         ),
//
//         child: Center(
//           child: TextField(
//             onChanged: (value)
//             {
//               setState(() {
//                 TextInputFieldEmail.email=value;
//               });
//             },
//
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               prefixIcon: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Icon(Icons.email, size: 28, color: kWhite,),
//               ),
//               hintText: 'Card name',
//               hintStyle: kBodyText,
//             ),
//             style: kBodyText,
//             keyboardType: TextInputType.emailAddress,
//             textInputAction: TextInputAction.next,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class SubmitButton extends StatefulWidget {
//   const SubmitButton({Key? key}) : super(key: key);
//
//   @override
//   _SubmitButtonState createState() => _SubmitButtonState();
// }
//
// class _SubmitButtonState extends State<SubmitButton> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       height: size.height * 0.08,
//       width: size.width * 0.8,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(2),
//         color: Colors.lightBlueAccent,
//       ),
//       child: TextButton(
//         onPressed: () async {
//
//         },
//         child: Text('Submit',
//             style: kBodyText.copyWith(fontWeight: FontWeight.bold)),
//       ),
//     );
//   }
// }


