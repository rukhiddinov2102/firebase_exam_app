import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int count2 = 1;
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/Images/finger.png",
                  scale: 3,
                ),
                SizedBox(width: 5),
                Text("swipe on an item to delete")
              ],
            ),
            SizedBox(height: 19),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              width: double.infinity,
              height: 102,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 16,
                    child: Image.asset("assets/Images/food1.png",scale: 8,)
                  ),
                  Positioned(top: 27, left: 117, child: Text("Tomatto Vegie")),
                  Positioned(
                    top: 58,
                    left: 96,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "GHS 8.00",
                          style: TextStyle(color: Color.fromRGBO(250, 74, 12, 1)),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.deepOrange),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (count > 1) {
                                        count--;
                                      }
                                    });
                                  },
                                  child: Container(
                                    child: Text("-"),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(count.toString()),
                              )),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      count += 1;
                                    });
                                  },
                                  child: Container(
                                    child: Text("+"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 14),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              width: double.infinity,
              height: 102,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 16,
                    child: Image.asset("assets/Images/food2.png",scale: 9,)
                  ),
                  Positioned(
                      top: 27, left: 117, child: Text("Fish with mix orange")),
                  Positioned(
                    top: 58,
                    left: 96,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "GHS 20.00",
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.deepOrange),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (count2 > 1) {
                                        count2--;
                                      }
                                    });
                                  },
                                  child: Container(
                                    child: Text("-"),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(count2.toString()),
                              )),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      count2 += 1;
                                    });
                                  },
                                  child: Container(
                                    child: Text("+"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:ElevatedButton(
          child: Text("Complete order"),
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            fixedSize: Size(314, 70),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            primary: Colors.deepOrange
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Color.fromRGBO(245, 245, 248, 1),
      );
    
  }
}
