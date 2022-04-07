import 'package:flutter/material.dart';
import 'database.dart';

class UpdateService extends StatefulWidget {
  UpdateService({Key? key, required this.service, required this.db})
      : super(key: key);
  Map service;
  Database db;

  @override
  _UpdateServiceState createState() => _UpdateServiceState();
}

class _UpdateServiceState extends State<UpdateService> {
  TextEditingController sIDController = new TextEditingController();
  TextEditingController sNameController = new TextEditingController();
  TextEditingController sDescriptionController = new TextEditingController();
  TextEditingController sPriceController = new TextEditingController();

  void initState() {
    super.initState();
    print(widget.service);
    sIDController.text = widget.service['sID'];
    sNameController.text = widget.service['sName'];
    sDescriptionController.text = widget.service['sDescription'];
    sPriceController.text = widget.service['sPrice'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('update service'),
        actions: [
          IconButton(
              onPressed: () {
                widget.db.delete(widget.service["id"]);
                Navigator.pop(context, true);
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(color: Colors.white, fontSize: 25),
                decoration: inputDecoration("service ID"),
                controller: sIDController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white, fontSize: 25),
                decoration: inputDecoration("service Name"),
                controller: sNameController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white, fontSize: 25),
                decoration: inputDecoration("service Description"),
                controller: sDescriptionController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white, fontSize: 25),
                decoration: inputDecoration("service Price"),
                controller: sPriceController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.transparent,
        child: BottomAppBar(
          color: Colors.transparent,
          child: RaisedButton(
              color: Colors.black,
              onPressed: () {
                widget.db.update(
                    widget.service["id"],
                    sIDController.text,
                    sNameController.text,
                    sDescriptionController.text,
                    sPriceController.text);
                Navigator.pop(context, true);
              },
              child: Text(
                'update',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String labelText) {
    return InputDecoration(
      focusColor: Colors.white,
      labelStyle: TextStyle(color: Colors.white),
      labelText: labelText,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.black, width: 4.0),
      ),
    );
  }
}
