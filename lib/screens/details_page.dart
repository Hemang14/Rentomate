import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rentomate/screens/search.dart';
import 'package:rentomate/screens/user_details.dart';
import 'package:rentomate/model/user_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  final String cost;
  final String hname;
  final String Oname;
  // final String looking;
  // final String images;
  // final String location;
  DetailsPage({
    Key? key,
    required this.cost,
    required this.hname,
    required this.Oname,
    // required this.looking,
    // required this.images,
    // required this.location
  }) : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  // String PGname = "The Hari Pg";
  // String ownerName = "Krishna Gowda";
  final hostelList = [
    House('Hari Pg', '8th Cross, Banashankari Stage-1',
        'assets/images/house03.jpeg'),
    House(
        'Aloha Pg', '2nd Cross, Hanumanth nagar', 'assets/images/house07.jpeg'),
    House('Ram Nivas', '3rd Cross, Banashankari', 'assets/images/house05.jpeg'),
  ];
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color.fromRGBO(252, 245, 238, 1.0),
        body: Stack(
          children: <Widget>[
            Container(
              child: Image.asset('assets/images/house01.jpeg'),
              height: screenHeight * 0.4,
            ),
            buildOption(
                "${widget.cost}", "${widget.hname}", "${widget.Oname}", context)
          ],
        ));
  }
}

class MapUtils {
  MapUtils._();

  // static Future<void> openMap(double latitude, double longitude) async {
  //   String googleUrl =
  //       'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
  //   if (await canLaunch(googleUrl)) {
  //     await launch(googleUrl);
  //   } else {
  //     throw 'Could not open the map.';
  //   }
  // }
  static void navigateTo(double lat, double lng) async {
    var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }
}

Widget buildOption(
    String cost, String hname, String Oname, BuildContext context) {
  return SingleChildScrollView(
      child: Container(
    margin: EdgeInsets.only(top: 250),
    child: Material(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(70.0)),
      child: Container(
        padding:
            EdgeInsets.only(left: 30.0, top: 30.0, right: 30.0, bottom: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                    // "\₹12,000/month",
                    // "\₹9,500/month",
                    // "\₹13,500/month",
                    cost,
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    )),
                Icon(Icons.bookmark_border, color: Colors.purple)
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              hname,
              // "Hari Pg",
              // "Ram Nivas",
              // "Aloha Pg",

              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.wifi, size: 15.0),
                    Text("5G"),
                    Icon(Icons.room_service, size: 15.0),
                    Text("3"),
                    Icon(Icons.home, size: 15.0),
                    Text("2-3")
                  ],
                ),
                Text("12,000 sq.ft"),
              ],
            ),
            SizedBox(height: 20.0),
            // Divider(),
            SizedBox(height: 10.0),
            // Text(
            //   "Pg Fees Calculator",
            //   style: TextStyle(
            //     color: Colors.black.withOpacity(0.8),
            //     fontSize: 18.0,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.bed_outlined, size: 40.0),
                    Text("  2-3 sharing "),
                    SizedBox(width: 45.0),
                    Icon(Icons.local_laundry_service, size: 40.0),
                    Text("  Laundry Service"),
                  ],
                ),
              ],
            ),

            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.dining_outlined, size: 40.0),
                    Text(" Veg n Non-Veg"),
                    SizedBox(width: 25.0),
                    Icon(Icons.wifi, size: 40.0),
                    Text("  5G WIFI"),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Owned by ${Oname}",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.question_answer, color: Colors.purple),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              "About",
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
                "First time in Basvanagudi , we present a Hostel with full Services within your budget. Including Dining Hall, Galaxy Room, Totally Open Space, Near Main Road to catch point and Much More."),
            SizedBox(height: 20.0),
            Image.asset("assets/images/map.jpeg"),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Ask a Question"),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                      color: Colors.purple.withOpacity(0.4),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(width: 20.0),
                // Expanded(
                //   child: Container(
                //     alignment: Alignment.center,
                //     padding: EdgeInsets.all(15.0),
                //     child: Text(
                //       "Express Interest",
                //       style: TextStyle(color: Colors.white),
                //     ),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.only(
                //         topLeft: Radius.circular(30.0),
                //         bottomLeft: Radius.circular(30.0),
                //         bottomRight: Radius.circular(30.0),
                //       ),
                //       color: Colors.purple,
                //     ),
                //   ),
                // ),
                Expanded(
                  child: MaterialButton(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Express Interest",
                        style: TextStyle(color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        ),
                        color: Colors.purple,
                      ),
                    ),
                    onPressed: () {
                      MapUtils.navigateTo(-3.823216, -38.481700);

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => UserDetails(
                      //             pgname: hname,
                      //             owner_name: Oname,
                      //           )),
                      // );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ));
}
