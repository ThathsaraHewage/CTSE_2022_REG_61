import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'database.dart';

class AddService extends StatefulWidget {
  AddService({Key? key, required this.db}) : super(key: key);
  Database db;
  @override
  _AddServiceState createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> _fbKeyValidation =
      GlobalKey<FormBuilderState>();

  // final _txtServiceID = TextEditingController();
  // final _txtServiceName = TextEditingController();
  // final _txtServiceDescription = TextEditingController();
  // final _txtServicePrice = TextEditingController();

  TextEditingController sIDController = new TextEditingController();
  TextEditingController sNameController = new TextEditingController();
  TextEditingController sDescriptionController = new TextEditingController();
  TextEditingController sPriceController = new TextEditingController();

  bool isChecked = true;
  bool isSelected = true;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sysHeight = MediaQuery.of(context).size.height;
    double sysWidth = MediaQuery.of(context).size.width;
    double FontSize = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Add New Service'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              FormBuilder(
                key: _fbKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/logo.png",
                        height: sysWidth / 100 * 23,
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        "Adding a new service to the system",
                        style: TextStyle(
                            color: Colors.black, fontSize: FontSize * 2.1),
                      ),
                    ),
                    SizedBox(height: 25),
                    FormBuilderTextField(
                      cursorColor: Colors.purple,
                      // name: "sID",
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      controller: sIDController,
                      //  validator: FormBuilderValidators.compose([
                      //    FormBuilderValidators.required(context),
                      //  ]),
                      decoration: InputDecoration(
                        hintText: "  Service ID",
                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontSize: FontSize * 2.1,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.purple)),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(1),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFDFDFDF),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                )),
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                  "assets/icons/id-card.svg",
                                  height: 1,
                                  color: Colors.black45),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    FormBuilderTextField(
                      cursorColor: Colors.purple,
                      // name: "sName",
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      controller: sNameController,
                      //  validator: FormBuilderValidators.compose([
                      //    FormBuilderValidators.required(context),
                      //  ]),
                      decoration: InputDecoration(
                        hintText: "  Service Name",
                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontSize: FontSize * 2.1,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.purple)),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(1),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFDFDFDF),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                )),
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                  "assets/icons/id-card.svg",
                                  height: 1,
                                  color: Colors.black45),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    FormBuilderTextField(
                      cursorColor: Colors.purple,
                      // name: "sDescription",
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      controller: sDescriptionController,
                      //  validator: FormBuilderValidators.compose([
                      //    FormBuilderValidators.required(context),
                      //  ]),
                      decoration: InputDecoration(
                        hintText: "  Service Description",
                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontSize: FontSize * 2.1,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.purple)),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(1),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFDFDFDF),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                )),
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                  "assets/icons/id-card.svg",
                                  height: 1,
                                  color: Colors.black45),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    FormBuilderTextField(
                      cursorColor: Colors.purple,
                      // name: "sPrice",
                      keyboardType: TextInputType.number,
                      autofocus: false,
                      controller: sPriceController,
                      //  validator: FormBuilderValidators.compose([
                      //    FormBuilderValidators.required(context),
                      //  ]),
                      decoration: InputDecoration(
                        hintText: "  Price",
                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontSize: FontSize * 2.1,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.purple)),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(1),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFDFDFDF),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                )),
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                  "assets/icons/id-card.svg",
                                  height: 1,
                                  color: Colors.black45),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CheckboxListTile(
                              title: Text('Weekday'),
                              value: isChecked,
                              controlAffinity: ListTileControlAffinity.platform,
                              tileColor: Colors.yellow,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.purple),
                                  borderRadius: BorderRadius.circular(20.0)),
                              activeColor: Colors.purple,
                              secondary: Icon(Icons.calendar_view_week),
                              onChanged: (newvalue) {
                                setState(() {
                                  isChecked = newvalue!;
                                });
                              }),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CheckboxListTile(
                              title: Text('Weekend'),
                              value: isSelected,
                              controlAffinity: ListTileControlAffinity.platform,
                              tileColor: Colors.yellow,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.purple),
                                  borderRadius: BorderRadius.circular(20.0)),
                              activeColor: Colors.purple,
                              secondary: Icon(Icons.weekend_outlined),
                              onChanged: (newvalue) {
                                setState(() {
                                  isSelected = newvalue!;
                                });
                              }),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        print("Submit");
                        widget.db.create(
                            sIDController.text,
                            sNameController.text,
                            sDescriptionController.text,
                            sPriceController.text);
                        Navigator.pop(context, true);
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.purple,
                            boxShadow: [
                              //  BoxShadow(blurRadius: 0, color: Colors.black45)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Submit",
                              style: TextStyle(
                                  fontSize: FontSize * 2.1,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
