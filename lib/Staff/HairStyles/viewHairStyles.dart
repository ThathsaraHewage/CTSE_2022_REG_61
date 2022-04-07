import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'addHairCut.dart';
import 'viewHairStyleDetail.dart';
import 'database.dart';
import 'package:salon_app/main.dart';

import '../../my_bottom_nav_bar.dart';

class ViewHairStyleScreen extends StatefulWidget {
  @override
  _ViewHairStyleScreen createState() => _ViewHairStyleScreen();
}

class _ViewHairStyleScreen extends State<ViewHairStyleScreen> {
  final Stream<QuerySnapshot> _userStream =
      FirebaseFirestore.instance.collection("haircutstyles").snapshots();

  Database db;
  List docs = [];
  initialise() {
    db = Database();
    db.initialise();
    db.read().then((value) => {
          if (value.isEmpty) {value.length = 0},
          if (mounted)
            {
              setState(() {
                docs = value;
              })
            }
        });
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => AddHairCutScreen()))
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: Text("Hair Styles"),
        leading: BackButton(
          color: Colors.white,
          onPressed: () => {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            )
          },
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: _userStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
                itemCount: docs.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                // EditHairCutScreen(docid: snapshot.data.docs[index])
                                ViewHairCutScreen(
                                    docid: snapshot.data.docs[index]),
                          ));
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 3, right: 3),
                          child: ListTile(
                            tileColor: Colors.blue,

                            //- Image
                            // leading: ConstrainedBox(
                            //   constraints: BoxConstraints(
                            //     maxHeight: 44,
                            //     maxWidth: 44,
                            //     minHeight: 64,
                            //     minWidth: 64,
                            //   ),
                            //   child: Image.asset('./assets/images/haircut.jpg', fit: BoxFit.cover),
                            // ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            title: Text(
                              docs[index]['name'],
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                // fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.left,
                            ),

                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          );

          // return Container(
          //   decoration: BoxDecoration(
          //     color: Colors.blue,
          //     borderRadius: BorderRadius.circular(12),

          //   ),
          //   height: 10,
          //   child: ListView.builder(
          //     itemCount: docs.length,
          //     itemBuilder: (_,index){
          //       return GestureDetector(
          //         onTap: (){
          //           Navigator.push(context, MaterialPageRoute(builder:  (_) => EditHairCutScreen(docid: snapshot.data.docs[index]),
          //           ));
          //         },
          //         child: Column(
          //           children: [
          //             SizedBox(
          //               height: 4,
          //             ),
          //             Padding(padding: EdgeInsets.only(
          //               left: 3,
          //               right: 3
          //             ),
          //             child: ListTile(
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(10),
          //                 side: BorderSide(
          //                   color: Colors.black,
          //                   width: 2,
          //                 ),

          //               ),
          //               title: Text(
          //                 docs[index]['name'],
          //                 style: TextStyle(
          //                   fontSize: 20,

          //                 ),
          //                 textAlign: TextAlign.center,
          //               ),

          //               contentPadding: EdgeInsets.symmetric(
          //                 vertical: 12,
          //                 horizontal: 16
          //               ),
          //             ),
          //             )
          //           ],
          //         ),
          //       );
          //     }
          //     ),
          // );
        },
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.purple,
      elevation: 0,
    );
  }
}
