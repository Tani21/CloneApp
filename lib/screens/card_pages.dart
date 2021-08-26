import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
//import 'package:trello/screens/create_new_account.dart';
import 'package:trello/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../pallete.dart';

//import '../pallete.dart';

var arraynames = [];
var functionality = [];
var yourname= [];

var cardname="";
var todofunction="";
var myname="";

int i=0, productCount=0;

Future<void> cardsnumber () async
{
  QuerySnapshot productCollection = await
  FirebaseFirestore.instance.collection('firstcollection').get();
   productCount = productCollection.size;
   print("product count: $productCount" );

}


var firestore = FirebaseFirestore.instance;
Stream<QuerySnapshot> collectionStream = FirebaseFirestore.instance.collection('firstcollection').snapshots();

class CardClassWithProvider extends StatefulWidget with ChangeNotifier {

  @override
  _CardClassWithProviderState createState() => _CardClassWithProviderState();
}

class _CardClassWithProviderState extends State<CardClassWithProvider> {

  Future <void> initApp() async {
    QuerySnapshot retrievedmap = await firestore.collection('firstcolection')
        .get();
    await FirebaseFirestore.instance
        .collection('firstcollection')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["name"]);

        setState(() {
          if (!arraynames.contains(doc["name"])) {
            arraynames.add(doc["name"]);
            functionality.add(doc["function"]);
            yourname.add(doc["displayname"]);
            print("arrayname: " + arraynames[i]);
            print("functionality: " + functionality[i]);
            print("yourname: " + yourname[i]);
            i = i + 1;
            print(i);
          }
        });
        cardsnumber();
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
    Size size = MediaQuery
        .of(context)
        .size;

    void cardFunctionUsingProvider() {
      showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              title: const Text('Add New Card',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),),

              content: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // TextField(
                  //   decoration: InputDecoration(
                  //     hintText: "Card Name",
                  //     hintStyle: TextStyle(
                  //       fontSize: 18,
                  //     ),
                  //     border: OutlineInputBorder(),
                  //     ),
                  //
                  //   maxLines: 2,
                  // ),
                  // content: TextField(
                  //   onChanged:

                  //     (value)
                  // {
                  //   setState(() {
                  //     cardname=value;
                  //   });
                  //   print(cardname);
                  // },
                  //style: kBodyText,
                  // keyboardType: TextInputType.emailAddress,

                  // textInputAction: TextInputAction.next,
                  TextField(

                    decoration: InputDecoration(
                      hintText: "Card Name",
                      hintStyle: TextStyle(
                        fontSize: 18,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 2,

                    onChanged:
                        (value) {
                      setState(() {
                        cardname = value;
                      });
                      print(cardname);
                    },

                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    //
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),

                  SizedBox(height: 20),

                  TextField(
                    decoration: InputDecoration(
                      hintText: "Task Description",
                      hintStyle: TextStyle(
                        fontSize: 18,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,

                    onChanged:
                        (value) {
                      setState(() {
                        todofunction = value;
                      });
                      print(todofunction);
                    },
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),

                  SizedBox(height: 20),

                  // TextField(
                  //
                  //   decoration: InputDecoration(
                  //     hintText: "Your name",
                  //     hintStyle: TextStyle(
                  //       fontSize: 18,
                  //     ),
                  //     border: OutlineInputBorder(),
                  //   ),
                  //   maxLines: 3,
                  //
                  //   onChanged:
                  //       (value) {
                  //     setState(() {
                  //       myname = value;
                  //     });
                  //     print(myname);
                  //   },
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 15,
                  //   ),
                  //
                  //   keyboardType: TextInputType.emailAddress,
                  //   textInputAction: TextInputAction.next,
                  // ),
                ],
              ),

              actions: [
                TextButton(onPressed: () async {
                  var newmap = {
                    'name': cardname,
                    'function': todofunction,
                    'displayname': LoginPageUserName.loginPageUserName,
                  };
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

        title: Text('Hey ' + LoginPageUserName.loginPageUserName + '!' ),

        actions: [
          IconButton(onPressed: () {
            context.read<CardClassWithProvider>().notifyListeners();
            cardFunctionUsingProvider();
          },
            icon: Icon(Icons.add_circle,
              color: Colors.grey[300],),
            tooltip: "Add Card",
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

      body: StreamBuilder(
      stream: collectionStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
        {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          cardsnumber();
          

          return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;


            // getDocuments.then((myDocuments){
            //   print("${myDocuments.documents.length}");
            // });

            return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                elevation: 5,
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
                                       Text(
                                  //'${productCount}',
                                   data['name'],
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Colors.yellow[900],
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,

                                          ),
                                      ),

                                      SizedBox(height: 30,),
                                      Text(data['function'],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      Text('By: ${data['displayname']}',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.grey[400]
                                      ),
                ),

                ],
            ),
            ),
                );


          }).toList(),
          );



        },


      ),

floatingActionButton: FloatingActionButton.extended(
  backgroundColor: Colors.yellow[900],
  onPressed: () {},
  label: Text('Cards: ${productCount}',
  style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  ),),
),
              //  Column(
              //
              //   children: [
              //
              //       Expanded(
              //         child: Container(
              //             child: ListView.builder(
              //               itemCount:arraynames.length,
              //                 itemBuilder: (context, index)
              //             {
              //
              //               return Card(
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(24),
              //                 ),
              //                 elevation: 10,
              //                 clipBehavior: Clip.antiAlias,
              //                 shadowColor: Colors.brown,
              //                 color: Colors.brown[900],
              //                 margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              //                 child: Padding(
              //
              //                   padding: const EdgeInsets.fromLTRB(25,10,25,10),
              //                   child: Column(
              //
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       SizedBox(height: 15,),
              //                       Text(arraynames[index],
              //                           textAlign: TextAlign.start,
              //                           style: TextStyle(
              //                             color: Colors.yellow[900],
              //                             fontSize: 25,
              //                             fontWeight: FontWeight.bold,
              //
              //                           ),
              //                       ),
              //
              //                       SizedBox(height: 30,),
              //                       Text(functionality[index],
              //                       textAlign: TextAlign.left,
              //                       style: TextStyle(
              //                         color: Colors.grey[400],
              //                           fontSize: 18,
              //                         ),
              //                       ),
              //                       SizedBox(height: 20,),
              //                       Text('By: ${yourname[index]}',
              //                       textAlign: TextAlign.end,
              //                       style: TextStyle(
              //                         fontSize: 19,
              //                         color: Colors.grey[400]
              //                       ),)
              //
              //                     ],
              //                   ),
              //                 ),
              //               );
              //
              //               // return Container(
              //               //   child: ListTile(
              //               //     contentPadding: EdgeInsets.only(left:32, right:32, top:38,bottom: 38),
              //               //     tileColor: Colors.lightBlueAccent,
              //               //     title: Text(arraynames[index], style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
              //               //     subtitle: Text("This is the subtext", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),),
              //               //   ),
              //               //   margin: EdgeInsets.only(bottom: 8, left: 38, right: 38, top:8),
              //               // );
              //             }
              //             ),
              //           ),
              //       ),
              //   ],
              // ),
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