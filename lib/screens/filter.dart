import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentomate/screens/feedback.dart';
import 'package:rentomate/screens/search.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: use_key_in_widget_constructors
class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  // ignore: prefer_const_constructors
  var selectedRange = RangeValues(5000, 50000);
  String dropdownValue = 'Bangalore';
  var place = "Bangalore";
  var lookingfor = "Fullhouse";
  var housetype = "2BHK";
  double pricemin = 0.0, pricemax = 0.0;
  var availability = "Immediate";
  //bool selected = false;
  List<bool> selected1 = [true, false, false];
  List<bool> selected2 = [true, false, false, false, false, false];
  List<bool> selected3 = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(252, 245, 238, 1.0),
        appBar: AppBar(
            title: const Text("Rentomate"),
            backgroundColor: Colors.purple[200]),
        body: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    "Filter your search:",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 20,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(2),
                  style: const TextStyle(color: Colors.black),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      place = dropdownValue;
                    });
                  },
                  items: <String>['Bangalore', 'Hyderabad', 'Chennai', 'Mumbai']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                "Looking For",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                // ListView(
                //   scrollDirection: Axis.horizontal,
                //   children: <Widget>[
                child: Row(
                  children: [
                    MaterialButton(
                      height: 50,
                      minWidth: 120,
                      color:
                          selected1[0] ? Colors.purple[500] : Colors.grey[50],
                      textColor: selected2[0] ? Colors.white : Colors.black,
                      child: const Text("Full House"),
                      onPressed: () {
                        setState(() {
                          selected1[0] = true;
                          selected1[1] = false;
                          selected1[2] = false;
                          lookingfor = "Fullhouse";
                        });
                      },
                    ),
                    MaterialButton(
                      height: 50,
                      minWidth: 120,
                      onPressed: () {
                        setState(() {
                          selected1[1] = true;
                          selected1[0] = false;
                          selected1[2] = false;
                          lookingfor = "PG";
                        });
                      },
                      color:
                          selected1[1] ? Colors.purple[500] : Colors.grey[50],
                      textColor: selected1[1] ? Colors.white : Colors.black,
                      child: const Text("PG/Hostel"),
                    ),
                    MaterialButton(
                      height: 50,
                      minWidth: 120,
                      color:
                          selected1[2] ? Colors.purple[500] : Colors.grey[50],
                      textColor: selected1[2] ? Colors.white : Colors.black,
                      child: const Text("Flatmates"),
                      onPressed: () {
                        setState(() {
                          selected1[2] = true;
                          selected1[0] = false;
                          selected1[1] = false;
                          lookingfor = "flatmates";
                        });
                      },
                    ),
                  ],
                ),
              ),
              // ],),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Apartment Type",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    MaterialButton(
                      height: 50,
                      minWidth: 120,
                      color:
                          selected2[0] ? Colors.purple[500] : Colors.grey[50],
                      textColor: selected2[0] ? Colors.white : Colors.black,
                      child: const Text("1RK"),
                      onPressed: () {
                        setState(() {
                          selected2[0] = true;
                          selected2[1] = false;
                          selected2[2] = false;
                          selected2[3] = false;
                          selected2[4] = false;
                          selected2[5] = false;
                          housetype = "1RK";
                        });
                      },
                    ),
                    MaterialButton(
                      height: 50,
                      minWidth: 120,
                      color:
                          selected2[1] ? Colors.purple[500] : Colors.grey[50],
                      textColor: selected2[1] ? Colors.white : Colors.black,
                      child: const Text("1BHK"),
                      onPressed: () {
                        setState(() {
                          selected2[0] = false;
                          selected2[1] = true;
                          selected2[2] = false;
                          selected2[3] = false;
                          selected2[4] = false;
                          selected2[5] = false;
                          housetype = "1BHK";
                        });
                      },
                    ),
                    MaterialButton(
                      height: 50,
                      minWidth: 120,
                      color:
                          selected2[2] ? Colors.purple[500] : Colors.grey[50],
                      textColor: selected2[2] ? Colors.white : Colors.black,
                      child: const Text("2BHK"),
                      onPressed: () {
                        setState(() {
                          selected2[0] = false;
                          selected2[1] = false;
                          selected2[2] = true;
                          selected2[3] = false;
                          selected2[4] = false;
                          selected2[5] = false;
                          housetype = "2BHK";
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    MaterialButton(
                      height: 50,
                      minWidth: 120,
                      color:
                          selected2[3] ? Colors.purple[500] : Colors.grey[50],
                      textColor: selected2[3] ? Colors.white : Colors.black,
                      child: const Text("3BHK"),
                      onPressed: () {
                        setState(() {
                          selected2[0] = false;
                          selected2[1] = false;
                          selected2[2] = false;
                          selected2[3] = true;
                          selected2[4] = false;
                          selected2[5] = false;
                          housetype = "3BHK";
                        });
                      },
                    ),
                    MaterialButton(
                      height: 50,
                      minWidth: 120,
                      color:
                          selected2[4] ? Colors.purple[500] : Colors.grey[50],
                      textColor: selected2[4] ? Colors.white : Colors.black,
                      child: const Text("4BHK"),
                      onPressed: () {
                        setState(() {
                          selected2[0] = false;
                          selected2[1] = false;
                          selected2[2] = false;
                          selected2[3] = false;
                          selected2[4] = true;
                          selected2[5] = false;
                          housetype = "4BHK";
                        });
                      },
                    ),
                    MaterialButton(
                      height: 50,
                      minWidth: 120,
                      color:
                          selected2[5] ? Colors.purple[500] : Colors.grey[50],
                      textColor: selected2[5] ? Colors.white : Colors.black,
                      child: const Text("4+ BHK"),
                      onPressed: () {
                        setState(() {
                          selected2[0] = true;
                          selected2[1] = false;
                          selected2[2] = false;
                          selected2[3] = false;
                          selected2[4] = false;
                          selected2[5] = true;
                          housetype = "4+ BHK";
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: const [
                  Text(
                    "Price Range: \u{20B9}${5000} to \u{20B9}${50000}",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                ],
              ),
              RangeSlider(
                values: selectedRange,
                onChanged: (RangeValues newRange) {
                  setState(() {
                    selectedRange = newRange;
                    pricemin = selectedRange.start;
                    pricemax = selectedRange.end;
                    //print(pricemin + " " + pricemax);
                  });
                },
                min: 5000,
                max: 50000,
                activeColor: Colors.purple[500],
                inactiveColor: Colors.grey[300],
              ),
              const Text(
                "Availability",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    MaterialButton(
                      height: 50,
                      minWidth: 120,
                      color:
                          selected3[0] ? Colors.purple[500] : Colors.grey[50],
                      textColor: selected3[0] ? Colors.white : Colors.black,
                      child: const Text("Immediate"),
                      onPressed: () {
                        setState(() {
                          selected3[0] = true;
                          selected3[1] = false;
                          selected3[2] = false;
                          availability = "Immediate";
                        });
                      },
                    ),
                    MaterialButton(
                      height: 50,
                      minWidth: 120,
                      onPressed: () {
                        setState(() {
                          selected3[1] = true;
                          selected3[0] = false;
                          selected3[2] = false;
                          availability = "within 15 days";
                        });
                      },
                      color:
                          selected3[1] ? Colors.purple[500] : Colors.grey[50],
                      textColor: selected3[1] ? Colors.white : Colors.black,
                      child: new Text("Within 15 days"),
                    ),
                    MaterialButton(
                      height: 50,
                      minWidth: 120,
                      color:
                          selected3[2] ? Colors.purple[500] : Colors.grey[50],
                      textColor: selected3[2] ? Colors.white : Colors.black,
                      child: new Text("Within 30 days"),
                      onPressed: () {
                        setState(() {
                          selected3[2] = true;
                          selected3[0] = false;
                          selected3[1] = false;
                          availability = "within 30 days";
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // ignore: unnecessary_new
              new MaterialButton(
                height: 40.0,
                minWidth: 500,
                color: Colors.purple[500],
                textColor: Colors.white,
                child: const Text("Search"),
                onPressed: () {
                  print("its working");
                  FirebaseFirestore.instance
                      .collection('Filter/ynxfg7sDCn02IRGwlxYi/item1')
                      .snapshots()
                      .listen((data) {
                    data.docs.forEach((document) {
                      if (document['availability'] == availability &&
                          document['house_type'] == housetype &&
                          document['looking_for'] == lookingfor &&
                          document['place'] == place) {
                        String priceString = document['price'].toString();
                        var route = new MaterialPageRoute(
                          builder: (BuildContext context) => new Search(
                              cost: priceString,
                              house: housetype,
                              looking: lookingfor,
                              images: document['image'],
                              location: place),
                        );
                        Navigator.of(context).push(route);
                      } else {
                        print("Not available!");
                        Fluttertoast.showToast(
                            msg: "No Match Found!! \n Try Again!!");
                      }
                    });
                  });
                },
                splashColor: Colors.redAccent,
              )
            ],
          ),
        ));
  }
}
