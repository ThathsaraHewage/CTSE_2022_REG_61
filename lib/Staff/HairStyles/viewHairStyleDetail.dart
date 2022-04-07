import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'editHairCut.dart';
import 'viewHairStyleDetail.dart';
import 'database.dart';

import '../../../main.dart';

class ViewHairCutScreen extends StatefulWidget {
  DocumentSnapshot docid;
  ViewHairCutScreen({this.docid});

  @override
  _ViewHairCutScreen createState() => _ViewHairCutScreen();
}

class _ViewHairCutScreen extends State<ViewHairCutScreen> {
  Database db;
  initialise() {
    db = Database();
    db.initialise();
  }

  @override
  void initState() {
    id = TextEditingController(text: widget.docid.id);
    haircutName = TextEditingController(text: widget.docid.get('name'));
    haircutDescription =
        TextEditingController(text: widget.docid.get('description'));
    print(haircutDescription.text);
    haircutPrice = TextEditingController(text: widget.docid.get('price'));
    super.initState();
    initialise();
  }

  TextEditingController id = new TextEditingController();
  TextEditingController haircutName = new TextEditingController();
  TextEditingController haircutDescription = new TextEditingController();
  TextEditingController haircutPrice = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HairStyle",
          style: TextStyle(color: Colors.white),
        ),
        leading: BackButton(
          color: Colors.white,
          onPressed: () => {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => ViewHairStyleScreen(),
              ),
            )
          },
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.blueAccent,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
              ),
              Column(
                children: [
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/haircut.jpg',
                      width: 400,
                      height: 200,
                      fit: BoxFit.fitHeight,
                    ),
                    margin: EdgeInsets.only(top: 30, bottom: 30),
                  ),
                ],
              ),
              Text(
                "Haircut Name: " + haircutName.text,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
              ),
              Text(
                "Price Rs." + haircutPrice.text,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
              ),
              Text(
                haircutDescription.text,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => EditHairCutScreen(
                              id.text,
                              haircutName.text,
                              haircutPrice.text,
                              haircutDescription.text)));
                },
                color: Colors.purple,
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),

        // Expanded(
        //   child:Container(
        //   decoration: BoxDecoration(border: Border.all()),
        //   child: TextField(
        //     controller: service,
        //     expands: true,
        //     maxLines: null,
        //     decoration: InputDecoration(hintText: "content"),
        //   ),
        // ),
        //   )
      ),
    );
  }
}
