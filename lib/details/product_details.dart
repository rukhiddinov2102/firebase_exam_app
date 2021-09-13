import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examscreens/constant/colors.dart';
import 'package:examscreens/constant/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

var instance = FirebaseFirestore.instance;

class DetailScreen extends StatefulWidget {
  final index;
  DetailScreen(this.index);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  PageController? _pageController;

final _currentPageNotifier = ValueNotifier<int>(0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Orders")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final doclist = snapshot.data!.docs;
                      return Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back_ios),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                              ),
                            ],
                          ),Container(
                                  height: 220,
                                  child: PageView.builder(
                                      itemCount: snapshot.data!.docs.length,
                                      controller: _pageController,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            Container(
                                              width: 220,
                                              height: 220,
                                              child: Image.network(
                                                snapshot.data!
                                                        .docs[widget.index!]
                                                    ['Image'],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                      onPageChanged: (int index) {
                                        _currentPageNotifier.value = index;
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CirclePageIndicator(
                                    selectedDotColor: vermilion,
                                    dotColor: Colors.grey.shade300,
                                    itemCount: snapshot.data!.docs.length,
                                    currentPageNotifier: _currentPageNotifier,
                                  ),
                                ),
                          Padding(padding: EdgeInsets.all(16)),
                          AppText(
                            text: snapshot.data!.docs[widget.index]["Name"].toString(),
                            size: 28,
                            color: Colors.black,
                            weight: FontWeight.w600,
                            textAlign: TextAlign.center,
                          ),
                          AppText(
                            text: "N1,900",
                            size: 22,
                            color: vermilion,
                            weight: FontWeight.w700,
                            textAlign: TextAlign.center,
                          ),
                          Padding(padding: EdgeInsets.all(16)),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: AppText(
                              text: "Delivery info",
                              size: 17,
                              color: Colors.black,
                              weight: FontWeight.w600,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(4)),
                          AppText(
                            text:
                                "Delivered between monday aug and thursday 20 from 8pm to 91:32 pm",
                            size: 15,
                            color: black_50,
                            weight: FontWeight.w400,
                            textAlign: TextAlign.start,
                          ),
                          Padding(padding: EdgeInsets.all(16)),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: AppText(
                              text: "Return policy",
                              size: 17,
                              color: Colors.black,
                              weight: FontWeight.w600,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(4)),
                          AppText(
                            text:
                                "All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.",
                            size: 15,
                            color: black_50,
                            weight: FontWeight.w400,
                            textAlign: TextAlign.start,
                          ),
                          AppButton(
                              backgraoundColors: vermilion,
                              borderRadiuss: 30,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              onTap: () {
                                // Navigator.pushNamed(context, Routes.home);
                              },
                              text: "Add to cart ",
                              textColor: athens_gray)
                        ],
                      );
                    } else {
                      return CupertinoActivityIndicator();
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
