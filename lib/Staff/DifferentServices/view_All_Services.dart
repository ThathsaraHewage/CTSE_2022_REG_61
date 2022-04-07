import 'package:baber_app_staff/Staff/DifferentServices/update_Service.dart';
import 'package:flutter/material.dart';

import 'database.dart';

class ViewAllServices extends StatefulWidget {
  @override
  _ViewAllServicesState createState() => _ViewAllServicesState();
}

class _ViewAllServicesState extends State<ViewAllServices> {
  late Database db;
  List docs = [];
  // initialise() {
  //   db = Database();
  //   db.initiliase();
  //   db.read().then((value) => {
  //         setState(() {
  //           docs = value;
  //         })
  //       });
  // }

  // void initState() {
  //   super.initState();
  //   initialise();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('View All Services'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
          itemCount: docs.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.purple[100],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(width: 5, color: Colors.purple)),
              elevation: 20,
              margin: EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 10),
              child: ListTile(
                onTap: () {
                  print("Update Service");
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UpdateService(service: docs[index], db: db)))
                      .then((value) => {
                            // if (value != null) {initialise()}
                          });
                },
                contentPadding: EdgeInsets.only(right: 30, left: 30),
                title: Text(
                  docs[index]['sName'],
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                subtitle: Text(docs[index]['sID'],
                    style: TextStyle(color: Colors.black, fontSize: 15)),
              ),
            );
          }),
    );
  }
}
