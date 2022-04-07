import 'package:flutter/material.dart';
import 'viewHairStyleDetail.dart';
import 'database.dart';

// ignore: must_be_immutable
class EditHairCutScreen extends StatefulWidget {
  // DocumentSnapshot docid;

  String id, name, price, description;
  EditHairCutScreen(this.id, this.name, this.price, this.description);

  @override
  _EditHairCutScreen createState() => _EditHairCutScreen();
}

class _EditHairCutScreen extends State<EditHairCutScreen> {
  Database db;
  initialise() async {
    db = Database();
    db.initialise();
  }

  @override
  void initState() {
    id = TextEditingController(text: widget.id);
    haircutName = TextEditingController(text: widget.name);
    haircutPrice = TextEditingController(text: widget.price);
    haircutDescription = TextEditingController(text: widget.description);
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
          title: new Text(
            "Update Haircut",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.all(20),
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadowColor: Colors.grey,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(bottom: 33, left: 7, right: 7, top: 3),
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide.none,
                          vertical: BorderSide.none),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: haircutName,
                      decoration: InputDecoration(hintText: "Haircut Name"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(bottom: 33, left: 7, right: 7, top: 3),
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide.none,
                          vertical: BorderSide.none),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: haircutPrice,
                      decoration: InputDecoration(hintText: "Haircut Price"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(bottom: 33, left: 7, right: 7, top: 3),
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide.none,
                          vertical: BorderSide.none),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                        controller: haircutDescription,
                        decoration:
                            InputDecoration(hintText: "Haircut Description"),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                  MaterialButton(
                      onPressed: () {
                        print(id.text);
                        print(haircutName.text);
                        db
                            .update(id.text, haircutName.text,
                                haircutPrice.text, haircutDescription.text)
                            .whenComplete(() => {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text(
                                      "Updated successfully!",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.green,
                                  )),
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              ViewHairStyleScreen()))
                                });
                      },
                      child: Container(
                        color: Colors.deepPurple,
                        margin: EdgeInsets.all(10),
                        padding: const EdgeInsets.only(
                            top: 18, bottom: 18, left: 15, right: 15),
                        child: Text("Update",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      )),
                  MaterialButton(
                      onPressed: () {
                        db.delete(id.text).whenComplete(() => {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text(
                                  "Deleted successfully!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.green,
                              )),
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ViewHairStyleScreen())),
                            });
                      },
                      child: Container(
                        color: Colors.deepPurple,
                        margin: EdgeInsets.all(10),
                        padding: const EdgeInsets.all(20.0),
                        child: Text("Delete Haircut",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
