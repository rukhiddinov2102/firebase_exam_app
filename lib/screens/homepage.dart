import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examscreens/constant/colors.dart';
import 'package:examscreens/constant/custom_text.dart';
import 'package:examscreens/details/product_details.dart';
import 'package:examscreens/screens/acocunt_page.dart';
import 'package:examscreens/screens/cart_page.dart';
import 'package:examscreens/screens/favorite_page.dart';
import 'package:examscreens/screens/history_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomePage extends StatefulWidget {
  ZoomDrawerController? _zoomDrawerController;
  HomePage(this._zoomDrawerController);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _drawerController = ZoomDrawerController();
  List pages = [
    FavoritePage(),
    ProfilePage(),
    HistoryPage(),
  ];

  List subtitle = ["sauce", "cucumber", "beaf soup", "vegie"];
  int selectedIndex = 0;
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (e) {
          if (e == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => FavoritePage()));
          } else if (e == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => ProfilePage()));
          } else if (e == 3) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => HistoryPage()));
          }
        },
        elevation: 0,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Home"),
        ],
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                widget._zoomDrawerController!.open!();
                              },
                              icon: Icon(Icons.menu),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => CartPage()));
                              },
                              icon: Icon(Icons.shopping_cart_rounded),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 140.0, top: 16),
                          child: AppText(
                            text: "Delicious food for you",
                            size: 34,
                            color: Colors.black,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          // child: SearchBox(hint: "Search"),
                        ),
                        SizedBox(height: 20),
                        TabBar(
                          isScrollable: true,
                          tabs: [
                            Tab(text: "Foods"),
                            Tab(text: "Drinks"),
                            Tab(text: "Snacks"),
                            Tab(text: "Sauce")
                          ],
                          labelColor: vermilion,
                          labelStyle: TextStyle(color: vermilion, fontSize: 17),
                          unselectedLabelStyle:
                              TextStyle(color: vermilion, fontSize: 17),
                          unselectedLabelColor: manatee,
                          indicatorColor: vermilion,
                          controller: _tabController,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppText(
                              text: "see more",
                              color: vermilion,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 400,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection("Orders")
                                    .snapshots(),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    final doclist = snapshot.data.docs;
                                    print(snapshot.data.docs[0]["Image"]);
                                    return ListView.builder(
                                        physics: AlwaysScrollableScrollPhysics(
                                            parent: BouncingScrollPhysics()),
                                        itemCount: doclist.length,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 14.0, vertical: 28),
                                            child: Container(
                                              width: 220,
                                              height: double.infinity,
                                              child: InkWell(
                                                onTap: () {
                                                  print("ontap");
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              DetailScreen(index)));
                                                },
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      top: 40.0,
                                                      child: Container(
                                                        width: 200.0,
                                                        height: 240.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                        bottom: 140.0,
                                                        left: 0.0,
                                                        right: 20.0,
                                                        child: Image.network(
                                                            doclist[index]
                                                                ["Image"])),
                                                    Positioned(
                                                      bottom: 70.0,
                                                      left: 45.0,
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                              doclist[index]
                                                                  ["Name"],
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      22.0)),
                                                          Text(subtitle[index],
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      22.0)),
                                                          SizedBox(
                                                              height: 25.0),
                                                          Text(
                                                            doclist[index]
                                                                ["price"],
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 17.0),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                },
                              ),
                              Container(child: Center(child: Text("2Page"))),
                              Container(child: Center(child: Text("3Page"))),
                              Container(child: Center(child: Text("4Page"))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
