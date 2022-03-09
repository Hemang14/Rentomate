import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentomate/screens/feedback.dart';
import 'package:rentomate/screens/filter.dart';
import 'package:getwidget/getwidget.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:rentomate/constants.dart';
import 'package:rentomate/screens/details_page.dart';

class SearchList extends StatefulWidget {
  @override
  _SearchList createState() => _SearchList();
}

class _SearchList extends State<SearchList> {
  final Ref = FirebaseFirestore.instance
      .collection('Filter/ynxfg7sDCn02IRGwlxYi/item1');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 245, 238, 1.0),
      appBar: AppBar(
        title: Text("Rentomate"),
        backgroundColor: Colors.purple.withOpacity(0.5),
      ),
      // body: StreamBuilder(
      //   stream: Ref.snapshots(),
      //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (snapshot.hasData) {
      //       return Container(
      //         height: 750,
      //         child: ListView.builder(
      //             itemCount: snapshot.data!.docs.length,
      //             itemBuilder: (context, index) {
      //               return Container(
      //                   child: Card(
      //                 margin: EdgeInsets.all(10),
      //                 clipBehavior: Clip.antiAlias,
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.all(
      //                     Radius.circular(15),
      //                   ),
      //                 ),
      //                 child: Container(
      //                   height: 210,
      //                   decoration: BoxDecoration(
      //                     image: DecorationImage(
      //                       image:
      //                           AssetImage(snapshot.data!.docs[index]['image']),
      //                       fit: BoxFit.cover,
      //                     ),
      //                   ),
      //                   child: Container(
      //                     padding: EdgeInsets.all(20),
      //                     decoration: BoxDecoration(),
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Expanded(
      //                           child: Container(),
      //                         ),
      //                         Column(
      //                           children: [
      //                             Row(
      //                               mainAxisAlignment:
      //                                   MainAxisAlignment.spaceBetween,
      //                               children: [
      //                                 Text(
      //                                   snapshot.data!.docs[index]
      //                                       ['house_type'],
      //                                   style: TextStyle(
      //                                     color: Colors.white,
      //                                     fontSize: 18,
      //                                     fontWeight: FontWeight.bold,
      //                                   ),
      //                                 ),
      //                                 Text(
      //                                   r"$" +
      //                                       snapshot.data!.docs[index]['price']
      //                                           .toString(),
      //                                   style: TextStyle(
      //                                     color: Colors.white,
      //                                     fontSize: 18,
      //                                     fontWeight: FontWeight.bold,
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                             SizedBox(
      //                               height: 4,
      //                             ),
      //                             Row(
      //                               mainAxisAlignment:
      //                                   MainAxisAlignment.spaceBetween,
      //                               children: [
      //                                 Row(
      //                                   children: [
      //                                     Icon(
      //                                       Icons.location_on,
      //                                       color: Colors.white,
      //                                       size: 14,
      //                                     ),
      //                                     SizedBox(
      //                                       width: 4,
      //                                     ),
      //                                     Text(
      //                                       snapshot.data!.docs[index]['place'],
      //                                       style: TextStyle(
      //                                         color: Colors.white,
      //                                         fontSize: 14,
      //                                       ),
      //                                     ),
      //                                     SizedBox(
      //                                       width: 8,
      //                                     ),
      //                                     Icon(
      //                                       Icons.zoom_out_map,
      //                                       color: Colors.white,
      //                                       size: 16,
      //                                     ),
      //                                     SizedBox(
      //                                       width: 4,
      //                                     ),
      //                                     Text(
      //                                       " sq/m",
      //                                       style: TextStyle(
      //                                         color: Colors.white,
      //                                         fontSize: 14,
      //                                       ),
      //                                     ),
      //                                   ],
      //                                 ),
      //                                 Row(
      //                                   children: [
      //                                     Icon(
      //                                       Icons.star,
      //                                       color: Colors.yellow[700],
      //                                       size: 14,
      //                                     ),
      //                                     SizedBox(
      //                                       width: 4,
      //                                     ),
      //                                     Text(
      //                                       " Reviews",
      //                                       style: TextStyle(
      //                                         color: Colors.white,
      //                                         fontSize: 14,
      //                                       ),
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ],
      //                             ),
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ));
      //             }),
      //       );
      //     } else if (snapshot.hasError) {
      //       return Text(snapshot.error.toString());
      //     } else {
      //       return CircularProgressIndicator();
      //     }
      //   },
      // ),
      body: Container(
        margin: EdgeInsets.only(bottom: 10.0, top: 10.0,left:17),
        height: MediaQuery.of(context).size.height, //for full screen as height
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            homeWidget(0),
            homeWidget(1),
            homeWidget(2),
            homeWidget(3),
            homeWidget(4),
            homeWidget(5),
            homeWidget(6),
            homeWidget(7),
            homeWidget(8),
            homeWidget(9),
            homeWidget(10),
            homeWidget(11),
            homeWidget(12),
            homeWidget(13),
            homeWidget(14),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 10.0, top: 5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
                color: Colors.blue,
                iconSize: 30,
                icon: Icon(Icons.filter_alt_outlined),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Filter()),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget homeWidget(ind) {
    var priceString = recommendedList[ind].cost;
    var housename = recommendedList[ind].name;
    var lookingfor;
    var document;
    var place;
    var OwnerName = recommendedList[ind].ownname;
    return InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return DetailsPage(
              hcost: priceString,
              hname: housename,
              Oname: OwnerName,
              // looking: lookingfor,
              // images: document['image'],
              // location: place
            );
          }));
        },
        child: Container(
          width: 250.0,
          height: 210.0,
          child: Stack(
            children: <Widget>[
              Container(
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    image: DecorationImage(
                        image: AssetImage(recommendedList[ind].imageUrl),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                bottom: 1,
                right: 30,
                child: FloatingActionButton(
                  heroTag: null,
                  mini: true,
                  backgroundColor: Colors.orange,
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
              Positioned(
                bottom: 15,
                right: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      recommendedList[ind].name,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        Text(recommendedList[ind].address,
                            style: TextStyle(color: Colors.white))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
