import '../../utils/auth_helper.dart';
import 'package:flutter/material.dart';
import 'list_staff_members.dart';

class SP extends StatefulWidget {
  SP({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
            child:
                new Text("Add new staff member", textAlign: TextAlign.center)),
        backgroundColor: Colors.red,
        elevation: 0,
        actions: <Widget>[
          PopupMenuButton<int>(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<int>>[
                PopupMenuItem(
                    value: 3,
                    child: Text('Logout'),
                    onTap: () {
                      AuthHelper.logOut();
                    }),
              ];
            },
          ),
        ],
      ),
      body: ListStudentPage(),
    );
  }
}
