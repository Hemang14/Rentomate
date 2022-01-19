import 'dart:core';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentomate/screens/feedback.dart';
import 'package:rentomate/screens/search.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';

// Create a Form widget.
class UserDetails extends StatefulWidget {
  final String pgname;
  final String owner_name;
  UserDetails({Key? key, required this.pgname, required this.owner_name})
      : super(key: key);
  @override
  _UserDetail createState() {
    return _UserDetail();
  }
}

class _UserDetail extends State<UserDetails> {
  final _formKey = GlobalKey<FormState>();

  String name = "";
  String email = "";
  var phno = "";
  String place = "";

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 245, 238, 1.0),
      appBar: AppBar(
          title: const Text("Tenant Finder"),
          backgroundColor: Colors.purple[200]),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter your Details:",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 35,
              ),
              Text("Enter your Name:"),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name';
                  } else {
                    name = value;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 25,
              ),
              Text("Enter your Email:"),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // errorBorder:
                  //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                  // focusedErrorBorder:
                  //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                  // errorStyle: TextStyle(color: Colors.purple),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email-ID';
                  } else {
                    email = value;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 25,
              ),
              Text("Enter your Contact number:"),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // errorBorder:
                  //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                  // focusedErrorBorder:
                  //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                  // errorStyle: TextStyle(color: Colors.purple),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Contact Number';
                  } else {
                    phno = value;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 25,
              ),
              Text("Enter your House address:"),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // errorBorder:
                  //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                  // focusedErrorBorder:
                  //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                  // errorStyle: TextStyle(color: Colors.purple),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Where do you stay?';
                  } else {
                    place = value;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  elevation: 30,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                      side: BorderSide(color: Colors.purple)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'Thanks for showing interest!The owner will contact you shortly.')),
                      );
                      FirebaseFirestore.instance
                          .collection(
                              'Interests/63aSeRedlAfyJfEllvWf/interests')
                          .add({
                        'name': name,
                        'email-id': email,
                        'phone_number': phno,
                        'place': place,
                        'PG_name': "${widget.pgname}",
                        'Owner_name': "${widget.owner_name}"
                      });
                    }
                  },
                  padding: EdgeInsets.all(5.0),
                  //color: Color.fromRGBO(0, 160, 227, 1),
                  color: Colors.purple[500],
                  textColor: Colors.white,
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
