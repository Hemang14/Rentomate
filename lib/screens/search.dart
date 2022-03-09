import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentomate/screens/feedback.dart';
import 'package:rentomate/screens/details_page.dart';
import 'package:getwidget/getwidget.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';

class Search extends StatefulWidget {
  final String cost;
  final String house;
  final String looking;
  final String images;
  final String location;
  Search(
      {Key? key,
      required this.cost,
      required this.house,
      required this.looking,
      required this.images,
      required this.location})
      : super(key: key);
  @override
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(252, 245, 238, 1.0),
        appBar: AppBar(
          title: Text("Rentomate"),
          backgroundColor: Colors.purple.withOpacity(0.5),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              buildOption("${widget.house}", "${widget.looking}",
                  "${widget.cost}", "${widget.images}", context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildOption(String house, String location, String cost, String images,
    BuildContext context) {
  var priceString = "₹12,000";
  var housename = "Ram PG";
  var lookingfor;
  var document;
  var place;
  var OwnerName = "Mr. Krishna Reddy";

  return GestureDetector(
    onTap: () {
      var route = new MaterialPageRoute(
        builder: (BuildContext context) => new DetailsPage(
          hcost: priceString,
          hname: housename,
          Oname: OwnerName,
          // looking: lookingfor,
          // images: document['image'],
          // location: place
        ),
      );
      Navigator.of(context).push(route);
    },
    child: Card(
      margin: EdgeInsets.all(24),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: 210,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(images),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        house,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\u{20B9}${cost}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 14,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            location,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.zoom_out_map,
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            " sq/m",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[700],
                            size: 14,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            " Reviews",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
