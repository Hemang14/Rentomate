import 'dart:developer';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:rentomate/screens/filter.dart';
import 'package:rentomate/screens/feedback.dart';
import 'package:rentomate/screens/search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentomate/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rentomate/screens/details_page.dart';
import 'package:rentomate/screens/searchLists.dart';
import 'package:rentomate/constants.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("Welcome"),
  //       centerTitle: true,
  //     ),
  //     body: Center(
  //       child: Padding(
  //         padding: EdgeInsets.all(20),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: <Widget>[
  //             SizedBox(
  //               height: 150,
  //               child: Image.asset("assets/logo.png", fit: BoxFit.contain),
  //             ),
  //             Text(
  //               "Welcome Back",
  //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
  //                 style: TextStyle(
  //                   color: Colors.black54,
  //                   fontWeight: FontWeight.w500,
  //                 )),
  //             Text("${loggedInUser.email}",
  //                 style: TextStyle(
  //                   color: Colors.black54,
  //                   fontWeight: FontWeight.w500,
  //                 )),
  //             SizedBox(
  //               height: 15,
  //             ),
  //             ActionChip(
  //                 label: Text("Logout"),
  //                 onPressed: () {
  //                   logout(context);
  //                 }),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // the logout function
  // Future<void> logout(BuildContext context) async {
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => LoginScreen()));
  // }

  // trying hemang's homepage

  @override
  int index = 1;
  int ind = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 245, 238, 1.0),
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.purple.withOpacity(0.5),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('Rentomate')),
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple,
                image: DecorationImage(
                    // image: NetworkImage(
                    //     "https://images.unsplash.com/photo-1541260894924-7ff059b93d54?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXwxNzQ4MDU0fHxlbnwwfHx8fA%3D%3D&w=1000&q=80"),
                    // fit: BoxFit.cover),
                    image: AssetImage('assets/images/avatar.jpeg'),
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     Text(
              //       "Hello Hemang Singh!!",
              //       style: TextStyle(
              //         fontSize: 18.0,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.black,
              //       ),
              //     ),
              //     Container(
              //       width: 50.0,
              //       height: 50.0,
              //       decoration: BoxDecoration(
              //         shape: BoxShape.circle,
              //         color: Colors.purple,
              //         image: DecorationImage(
              //             // image: NetworkImage(
              //             //     "https://images.unsplash.com/photo-1541260894924-7ff059b93d54?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXwxNzQ4MDU0fHxlbnwwfHx8fA%3D%3D&w=1000&q=80"),
              //             // fit: BoxFit.cover),
              //             image: AssetImage('assets/images/avatar.jpeg'),
              //             fit: BoxFit.cover),
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 10.0,
              // ),
              Text(
                "Discover",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              Text(
                "Your bed between nightlife & culture!!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(.5),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        )),
                    child: GestureDetector(
                      child: TextField(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchList()),
                          );
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Find a good Home",
                        ),
                      ),
                      // onTap: () {
                      //   Navigator.of(context).pushReplacement(
                      //     MaterialPageRoute(builder: (BuildContext context) => new Search(
                      //       cost: "", house: "", looking: "", images: "", location: "",),),
                      //   );
                      // var route = new MaterialPageRoute(
                      //   builder: (BuildContext context) => new Search(
                      //       cost: "", house: "", looking: "", images: "", location: "",),
                      // );
                      // Navigator.of(context).push(route);
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Stack(children: <Widget>[
                  new IconButton(
                    icon: new Icon(Icons.filter_alt_outlined),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Filter()),
                      );
                    },
                  ),
                  Positioned(
                      top: 1,
                      right: 1,
                      child: Container(
                          padding: EdgeInsets.all(2.0),
                          child: Text(
                            "2",
                            style:
                                TextStyle(color: Colors.white, fontSize: 10.0),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ))),
                ])
              ]),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "Top Recommended",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      )
                    ],
                  ),
                  Text("See All",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                ],
              ),
              SizedBox(height: 20.0),
              Container(
                height: 400.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    homeWidget(0),
                    homeWidget(1),
                    homeWidget(0),
                    homeWidget(1),
                    homeWidget(0),
                    homeWidget(1),
                    homeWidget(0),
                    homeWidget(1),
                    homeWidget(0),
                    homeWidget(1),
                    homeWidget(0),
                    homeWidget(1),
                    homeWidget(0),
                    homeWidget(1),
                    homeWidget(0),
                    homeWidget(1),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "Best Offer",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      )
                    ],
                  ),
                  Text("See All",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                ],
              ),
              SizedBox(height: 20.0),
              Container(
                  height: 400.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      bestOfferWidget(0),
                      bestOfferWidget(1),
                      bestOfferWidget(0),
                      bestOfferWidget(1),
                      bestOfferWidget(0),
                      bestOfferWidget(1),
                      bestOfferWidget(0),
                      bestOfferWidget(1),
                      bestOfferWidget(0),
                      bestOfferWidget(1),
                      bestOfferWidget(0),
                      bestOfferWidget(1),
                      bestOfferWidget(0),
                      bestOfferWidget(1),
                      bestOfferWidget(0),
                      bestOfferWidget(1),
                    ],
                  )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 10.0, top: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            index == 1
                ? _selectedWidget(Icon(Icons.home), "Home")
                : IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      setState(() {
                        index = 1;
                      });
                    }),
            index == 2
                ? _selectedWidget(Icon(Icons.bookmark_border), "Bookmark")
                : IconButton(
                    icon: Icon(Icons.bookmark_border),
                    onPressed: () {
                      setState(() {
                        index = 2;
                      });
                    },
                  ),
            index == 3
                ? _selectedWidget(
                    Icon(Icons.notifications_none_outlined), "Notifications")
                : IconButton(
                    icon: Icon(Icons.notifications_none_outlined),
                    onPressed: () {
                      setState(() {
                        index = 3;
                      });
                    },
                  ),
            index == 4
                ? _selectedWidget(Icon(Icons.message), "Messages")
                : IconButton(
                    icon: Icon(Icons.message),
                    onPressed: () {
                      setState(() {
                        index = 4;
                      });
                    },
                  ),
            index == 5
                ? _selectedWidget(Icon(Icons.person_outline), "Profile")
                : IconButton(
                    icon: Icon(Icons.person_outline),
                    onPressed: () {
                      setState(() {
                        index = 5;
                      });
                    },
                  ),
          ],
        ),
      ),
    );
  }

  Widget homeWidget(ind) {
    var priceString = "₹12,000";
    var housename = "Ram Pg";
    var lookingfor;
    var document;
    var place;
    var OwnerName = "Mr. Krishna Reddy";
    return InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return DetailsPage(
              cost: priceString,
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
          height: 400.0,
          child: Stack(
            children: <Widget>[
              Container(
                width: 230.0,
                height: 375.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
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
                bottom: 40,
                right: 60,
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

// for best offers
  Widget bestOfferWidget(ind) {
    var priceString = "₹12,000";
    var housename = "Hari Pg";
    var lookingfor;
    var document;
    var place;
    var OwnerName = "Mr. Krishna Reddy";

    return InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return DetailsPage(
              cost: priceString,
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
          height: 400.0,
          child: Stack(
            children: <Widget>[
              Container(
                width: 230.0,
                height: 375.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                    image: DecorationImage(
                        image: AssetImage(bestofferList[ind].imageUrl),
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
                bottom: 40,
                right: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      bestofferList[ind].name,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        Text(bestofferList[ind].address,
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

  Widget _selectedWidget(Icon icon, String str) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
        color: Colors.purple.withOpacity(0.4),
      ),
      child: Row(
        children: <Widget>[
          icon,
          Text(str),
        ],
      ),
    );
  }

  //for side bar
  Widget NavDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              "Welcome!! \n ${loggedInUser.firstName} ${loggedInUser.secondName}",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.5),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/house01.jpeg'))),
          ),
          // ListTile(
          //   leading: Icon(Icons.login_outlined),
          //   title: Text('Signin/Signup'),
          //   onTap: () => {},
          // ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            /*onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>()),
              );
            },*/
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MyCustomForm()),
              );
            },
          ),

          // ListTile(
          //   leading: Icon(Icons.border_color),
          //   title: Text('Feedback'),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => MyCustomForm()),
          //     );
          //   },
          // ),

// onTap: () {
//                           var route = new MaterialPageRoute(
//                             builder: (BuildContext context) => new Search(
//                                 cost: "", house: "", looking: "", images: "", location: "",),
//                           );
//                           Navigator.of(context).push(route);
//                         }),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen()))
            },
          ),
        ],
      ),
    );
  }
}

// the logout function
// Future<void> logout(BuildContext context) async {
//   await FirebaseAuth.instance.signOut();
//   Navigator.of(context)
//       .pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
// }
