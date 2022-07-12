// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet/util/my_button.dart';
import 'package:wallet/util/my_card.dart';
import 'package:wallet/util/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[100],
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  //app bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "My",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " Cards",
                              style: TextStyle(fontSize: 28),
                            ),
                          ],
                        ),

                        //plus button
                        Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle),
                            child: Icon(Icons.add))
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  SingleChildScrollView(
                    child: Column(
                      children: [],
                    ),
                  ),
                  //cards
                  Container(
                    height: 200,
                    child: PageView(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      children: [
                        MyCard(
                          balance: 5250.20,
                          cardNumber: 12345678,
                          expiryMonth: 10,
                          expiryYear: 24,
                          color: Color.fromARGB(255, 76, 171, 249),
                        ),
                        MyCard(
                          balance: 550.20,
                          cardNumber: 78945612,
                          expiryMonth: 09,
                          expiryYear: 25,
                          color: Color.fromARGB(255, 255, 173, 41),
                        ),
                        MyCard(
                          balance: 52540.20,
                          cardNumber: 123455678,
                          expiryMonth: 22,
                          expiryYear: 23,
                          color: Color.fromARGB(255, 66, 244, 75),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: ExpandingDotsEffect(
                        activeDotColor: Colors.grey.shade600),
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  //3 buttons -> send, pay, bills
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //send button
                        MyButton(
                            iconImagePath: 'lib/icons/send-money.png',
                            buttonText: 'Send'),
                        //pay button
                        MyButton(
                            iconImagePath: 'lib/icons/credit-card.png',
                            buttonText: 'Pay'),
                        //bill button
                        MyButton(
                            iconImagePath: 'lib/icons/bill.png',
                            buttonText: 'Bills'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  //column -> stats + transactions
                  MyListTile(
                    iconImagePath: 'lib/icons/statistics.png',
                    tileTitle: 'Statistics',
                    tileSubTitle: 'Payments and Income',
                  ),
                  MyListTile(
                    iconImagePath: 'lib/icons/transaction.png',
                    tileTitle: 'Transaction',
                    tileSubTitle: 'Transaction History',
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.home,
                          size: 32,
                          color: Colors.greenAccent.shade200,
                        )),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings,
                        size: 32,
                        color: Colors.grey,
                      ),
                    ),
                  ]),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.greenAccent.shade400,
            child: Icon(
              Icons.monetization_on,
              size: 28,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked),
    );
  }
}
