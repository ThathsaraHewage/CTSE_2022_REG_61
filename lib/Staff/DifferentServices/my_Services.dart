import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'add_service.dart';
import 'view_All_Services.dart';

import 'database.dart';

class MyServices extends StatefulWidget {
  @override
  _MyServicesState createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  late Database db;
  initialise() {
    db = Database();
    db.initiliase();
  }

  void initState() {
    super.initState();
    initialise();
  }

  @override
  Widget build(BuildContext context) {
    double sysHeight = MediaQuery.of(context).size.height;
    double sysWidth = MediaQuery.of(context).size.width;
    double FontSize = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: Container(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
          child: ListView(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: sysWidth,
                height: sysHeight / 100 * 8.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFF313131),
                    boxShadow: [
                      //  BoxShadow(blurRadius: 0, color: Colors.black45)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Service",
                        style: TextStyle(
                            fontSize: FontSize * 2.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Image.asset(
                        "assets/images/logo.png",
                        height: sysHeight / 100 * 6,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: InkWell(
                  onTap: () {
                    /// Page Navigation for AddService page
                    print("Add Service");
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddService(db: db)))
                        .then((value) => {
                              if (value != null) {initialise()}
                            });
                  },
                  child: Container(
                    width: sysWidth,
                    height: sysHeight / 100 * 12,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.purple,
                        boxShadow: [
                          //BoxShadow(blurRadius: 10, color: Colors.black45)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add Service",
                            style: TextStyle(
                                fontSize: FontSize * 2.5,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            "assets/images/logo.png",
                            height: sysHeight / 100 * 6,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: InkWell(
                  onTap: () {
                    print("Update Service");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewAllServices(),
                        ));
                  },
                  child: Container(
                    width: sysWidth,
                    height: sysHeight / 100 * 12,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.purple,
                        boxShadow: [
                          //BoxShadow(blurRadius: 10, color: Colors.black45)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Update Service",
                            style: TextStyle(
                                fontSize: FontSize * 2.5,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            "assets/images/logo.png",
                            height: sysHeight / 100 * 6,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: InkWell(
                  onTap: () {
                    print("View all Service");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewAllServices(),
                        ));
                  },
                  child: Container(
                    width: sysWidth,
                    height: sysHeight / 100 * 12,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.purple,
                        boxShadow: [
                          //BoxShadow(blurRadius: 10, color: Colors.black45)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "View all  Service",
                            style: TextStyle(
                                fontSize: FontSize * 2.5,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            "assets/images/logo.png",
                            height: sysHeight / 100 * 6,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: InkWell(
                  onTap: () {
                    print("Delete Service");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewAllServices()));
                  },
                  child: Container(
                    width: sysWidth,
                    height: sysHeight / 100 * 12,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.purple,
                        boxShadow: [
                          //BoxShadow(blurRadius: 10, color: Colors.black45)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delete Service",
                            style: TextStyle(
                                fontSize: FontSize * 2.5,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            "assets/images/logo.png",
                            height: sysHeight / 100 * 6,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
