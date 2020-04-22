import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecgalpha/utils/constants.dart';
import 'package:ecgalpha/utils/toast.dart';
import 'package:ecgalpha/views/partials/custom_loading_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'change_password.dart';

class HelpAndSupport extends StatefulWidget {
  @override
  _HelpAndSupportState createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  String selectedCategory;
  TextEditingController title = TextEditingController();
  TextEditingController descrpt = TextEditingController();
  bool isLoading = false;
  File pop;
  Future getImage() async {
    var img = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      pop = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Create a ticket",
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Divider(),
                text("Choose Category"),
                DropdownButton<String>(
                  hint: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Select a Category"),
                  ),
                  value: selectedCategory,
                  underline: SizedBox(),
                  items: supportCategories.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          value,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }).toList(),
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                ),
                Divider(),
                text("Add Image"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      getImage();
                    },
                    child: pop == null
                        ? Container(
                            height: 100,
                            color: Colors.blueAccent[100],
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.add),
                                  Text("Add Image")
                                ],
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.file(pop,
                                height: 100, fit: BoxFit.contain),
                          ),
                  ),
                ),
                text("Title"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Enter here"),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    controller: title,
                  ),
                ),
                Divider(),
                text("Description"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Enter here"),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    controller: descrpt,
                  ),
                ),
                Divider(),
              ],
            )
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomLoadingButton(
            title: isLoading ? "" : "Create",
            onPress: isLoading
                ? null
                : () async {
                    if (selectedCategory.isEmpty ||
                        title.text.isEmpty ||
                        descrpt.text.isEmpty) {
                      showToast("Make sure all fields are filled", context);
                      return;
                    }

                    setState(() {
                      isLoading = true;
                    });
                    final Map<String, Object> m = Map();
                    m.putIfAbsent("Category", () => selectedCategory);
                    m.putIfAbsent("Title", () => title.text);
                    m.putIfAbsent("Description", () => descrpt.text);
                    m.putIfAbsent("Date", () => thePresentTime);
                    m.putIfAbsent("Uid", () => MY_UID);

                     if (pop != null) {
                      String url = await uploadImage(pop);
                      m.putIfAbsent("POP", () => url);
                    }
                    Firestore.instance
                        .collection("Help Collection")
                        .document("Unresolved")
                        .collection(MY_UID)
                        .add(m)
                        .then((a) {
                      setState(() {
                        isLoading = false;
                      });
                      Toast.show("Ticket Created!", context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                      Navigator.pop(context);
                    });
                  },
            icon: isLoading
                ? CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )
                : Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
            iconLeft: false,
          ),
        ),
      ),
    );
  }
}
