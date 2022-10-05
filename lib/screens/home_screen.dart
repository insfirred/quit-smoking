import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1F2120),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Eveving, John",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffebe9e9),
                      fontSize: 35,
                    ),
                  ),
                  SizedBox(height: 9),
                  Text(
                    "Glad to see your performance",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffd9d9d9),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Row(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff313432),
                        ),
                        padding: const EdgeInsets.only(
                          left: 22,
                          right: 24,
                          top: 32,
                          bottom: 40,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Money Saved",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xffd9d9d9),
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "₹15",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xffd9d9d9),
                                fontSize: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff313432),
                        ),
                        padding: const EdgeInsets.only(
                          left: 34,
                          right: 36,
                          top: 32,
                          bottom: 40,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Life Saved",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xffd9d9d9),
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "16 h",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xffd9d9d9),
                                fontSize: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 131,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: Stack(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x26000000),
                                      blurRadius: 4,
                                      offset: Offset(2, 4),
                                    ),
                                  ],
                                  color: Color(0xff313433),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "16",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xffd9d9d9),
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "hours",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xffd9d9d9),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    width: 100,
                    height: 131,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: Stack(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x26000000),
                                      blurRadius: 4,
                                      offset: Offset(2, 4),
                                    ),
                                  ],
                                  color: Color(0xff313433),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "48",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xffd9d9d9),
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "seconds",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xffd9d9d9),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    width: 100,
                    height: 131,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: Stack(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x26000000),
                                      blurRadius: 4,
                                      offset: Offset(2, 4),
                                    ),
                                  ],
                                  color: Color(0xff313433),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "35",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xffd9d9d9),
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "minutes",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xffd9d9d9),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                "of no smoking",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffd9d9d9),
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 213,
                    height: 104,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 8,
                          offset: Offset(2, 4),
                        ),
                      ],
                      color: Color(0xff313433),
                    ),
                    padding: const EdgeInsets.only(
                      left: 32,
                      right: 29,
                      top: 17,
                      bottom: 14,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Cigarettes Avoided",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xffd9d9d9),
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "6",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                "You are stronger than you think :)",
                style: TextStyle(
                  color: Color(0xffd9d9d9),
                  fontSize: 30,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
