import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
//import 'package:trello/screens/create_new_account.dart';
import 'package:trello/screens/login_screen.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

//import '../pallete.dart';

var arraynames = [];
var cardname="";
int i=0;
var firestore = FirebaseFirestore.instance;

class CardClassWithProvider extends StatefulWidget with ChangeNotifier {

  @override
  _CardClassWithProviderState createState() => _CardClassWithProviderState();
}

class _CardClassWithProviderState extends State<CardClassWithProvider> {

  Future <void> initApp() async{
    QuerySnapshot retrievedmap = await firestore.collection('firstcolection').get();
    await FirebaseFirestore.instance
        .collection('firstcollection')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["name"]);

        setState(() {
          if(!arraynames.contains(doc["name"])) {
            arraynames.add(doc["name"]);
            print("arrayname: " + arraynames[i]);
            i = i + 1;
            print(i);
          }
        });


      });

    });
  }

  @override

  void initState() {
    initApp();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    Size size  = MediaQuery.of(context).size;

    void cardFunctionUsingProvider ()
    {

      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Add New Card',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),),
          content: TextField(
            onChanged: (value)
            {
              setState(() {
                cardname=value;
              });
              print(cardname);
            },
            //style: kBodyText,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          actions: [
            TextButton(onPressed: () async {

              var newmap = {'name': cardname};
              await firestore.collection('firstcollection').add(newmap);
              await initApp();

              //arraynames.removeRange(0, arraynames.length-1);


              //
              // var newmap = {'name': cardname};
              // firestore.collection('firstcollection').add(newmap);
              //
              // QuerySnapshot retrievedmap = await firestore.collection('firstcolection').get();
              // await FirebaseFirestore.instance
              //     .collection('firstcollection')
              //     .get()
              //     .then((QuerySnapshot querySnapshot) {
              //   querySnapshot.docs.forEach((doc) {
              //     print(doc["name"]);
              //
              //     setState(() {
              //       arraynames.add(doc["name"]);
              //       print("arrayname: "+arraynames[i]);
              //       i=i+1;
              //       print(i);
              //     });
              //
              //   });
              // });
              //
              // for(int j=0; j<arraynames.length; j++)
              // {
              //   print("for loop: "+arraynames[j]);
              // }
               Navigator.pop(context);
              //Navigator.pushNamed(context, 'CardPages');
            }, child: const Text('Submit',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black12,
        appBar: AppBar(

           title: Text('Hey '+LoginPageUserName.loginPageUserName+'!'),

          actions: [
            IconButton(onPressed: () {
              context.read<CardClassWithProvider>().notifyListeners();
              cardFunctionUsingProvider();
            },
            icon: Icon(Icons.add_circle,
            color: Colors.grey[300],),
              tooltip:"Add Card",
            ),

            IconButton(onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, '/');
            }, icon: Icon(Icons.logout, color: Colors.grey[300],),
                tooltip: "Logout"
            ),
          ],
          backgroundColor: Colors.yellow[900],
          elevation: 0,
        ),

        body:
                 Column(

                  children: [

                      Expanded(
                        child: Container(
                            child: ListView.builder(
                              itemCount:arraynames.length,
                                itemBuilder: (context, index)
                            {

                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                elevation: 10,
                                clipBehavior: Clip.antiAlias,
                                shadowColor: Colors.brown,
                                color: Colors.brown[900],
                                margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                                child: Padding(

                                  padding: const EdgeInsets.fromLTRB(25,10,25,10),
                                  child: Column(

                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 15,),
                                      Text(arraynames[index],
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Colors.yellow[900],
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,

                                          ),
                                      ),

                                      SizedBox(height: 30,),
                                      Text("Create a uml diagram to represent the alarm clock along with all the features that the user can interact with to make life simple.",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      Text('By: Tanishka',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.grey[400]
                                      ),)

                                    ],
                                  ),
                                ),
                              );

                              // return Container(
                              //   child: ListTile(
                              //     contentPadding: EdgeInsets.only(left:32, right:32, top:38,bottom: 38),
                              //     tileColor: Colors.lightBlueAccent,
                              //     title: Text(arraynames[index], style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
                              //     subtitle: Text("This is the subtext", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),),
                              //   ),
                              //   margin: EdgeInsets.only(bottom: 8, left: 38, right: 38, top:8),
                              // );
                            }
                            ),
                          ),
                      ),
                  ],
                ),
    );
  }
}



// class CardPage extends StatefulWidget with ChangeNotifier{
//
//    CardPage({Key? key}) : super(key: key);
//
//   @override
//   _CardPageState createState() => _CardPageState();
// }
//
// class _CardPageState extends State<CardPage> {
//   var cardname="";
//   int i=0;
//   var arraynames = [];
//   var firestore = FirebaseFirestore.instance;
//
//   void initApp() async{
//     QuerySnapshot retrievedmap = await firestore.collection('firstcolection').get();
//     await FirebaseFirestore.instance
//         .collection('firstcollection')
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       querySnapshot.docs.forEach((doc) {
//         print(doc["name"]);
//
//         setState(() {
//           arraynames.add(doc["name"]);
//           print("arrayname: "+arraynames[i]);
//           i=i+1;
//           print(i);
//         });
//
//       });
//     });
//   }
//   @override
//
//
//   void initState() {
//     initApp();
//
//     // TODO: implement initState
//     super.initState();
//
//
//   }
//   @override
//   Widget build(BuildContext context) {
//
//
//     Size size  = MediaQuery.of(context).size;
//
//
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Hey '+LoginPageUserName.loginPageUserName+'!'),
//           actions: [
//             TextButton(onPressed: () => showDialog(
//                 context: context,
//                 builder: (BuildContext context) => AlertDialog(
//                   title: const Text('Add New Card',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),),
//                   content: TextField(
//                     onChanged: (value)
//                     {
//                       setState(() {
//                         cardname=value;
//                       });
//                       print(cardname);
//                     },
//                     //style: kBodyText,
//                     keyboardType: TextInputType.emailAddress,
//                     textInputAction: TextInputAction.next,
//                   ),
//                   actions: [
//                     TextButton(onPressed: () async {
//
//                       //arraynames.removeRange(0, arraynames.length-1);
//
//                       var newmap = {'name': cardname};
//                         firestore.collection('firstcollection').add(newmap);
//
//                         QuerySnapshot retrievedmap = await firestore.collection('firstcolection').get();
//                         await FirebaseFirestore.instance
//                             .collection('firstcollection')
//                             .get()
//                             .then((QuerySnapshot querySnapshot) {
//                           querySnapshot.docs.forEach((doc) {
//                             print(doc["name"]);
//
//                             setState(() {
//                               arraynames.add(doc["name"]);
//                               print("arrayname: "+arraynames[i]);
//                               i=i+1;
//                               print(i);
//                             });
//
//                           });
//                         });
//
//                         for(int j=0; j<arraynames.length; j++)
//                         {
//                           print("for loop: "+arraynames[j]);
//                         }
//
//                         Navigator.pushNamed(context, 'CardPages');
//                     }, child: const Text('Submit',
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 17,
//                     ),),),
//                   ],
//                 ),
//             ),
//               child: Text('Add Card',
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 17,
//             ),
//             ),
//             ),
//
//             IconButton(onPressed: () async {
//               await FirebaseAuth.instance.signOut();
//               Navigator.pushNamed(context, '/');
//             }, icon: Icon(Icons.logout, color: Colors.white,),
//                 tooltip: "Logout"
//             ),
//           ],
//           backgroundColor: Colors.lightBlueAccent,
//           elevation: 0,
//
//         ),
//
//         body:
//                  Column(
//                   children: [
//                       Expanded(
//                         child: Container(
//                             child: ListView.builder(
//                               itemCount:arraynames.length,
//                                 itemBuilder: (context, index)
//                             {
//                               return Container(
//                                 child: ListTile(
//                                   contentPadding: EdgeInsets.only(left:32, right:32, top:38,bottom: 38),
//                                   tileColor: Colors.lightBlueAccent,
//                                   title: Text(arraynames[index], style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
//                                   subtitle: Text("This is the subtext", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),),
//                                 ),
//                                 margin: EdgeInsets.only(bottom: 8, left: 38, right: 38, top:8),
//                               );
//                             }
//                             ),
//                           ),
//                       ),
//                   ],
//                 ),
//     );
//   }
// }