import 'package:flutter/material.dart';
import 'package:i_can/l10n/localization.dart';

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
        body: Padding(
          padding: EdgeInsets.fromLTRB(30, 15, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Greetings(),

              SizedBox(height: 25),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    ValueSaved(),
    
    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimerCircle(timeUnit: Localization.of(context)!.hours, value: 16),
                            TimerCircle(timeUnit: Localization.of(context)!.minutes, value: 35),
                            TimerCircle(timeUnit: Localization.of(context)!.seconds, value: 48,)
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            Localization.of(context)!.no_smoking,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xffd9d9d9),
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
    
    
                    Container(
                      width: 220,
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x26000000),
                            blurRadius: 8,
                            offset: Offset(2, 4),
                          ),
                        ],
                        color: Color(0xff313433),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Localization.of(context)!.cigarettes_avoided,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xffd9d9d9),
                                fontSize: 20,
                              ),
                            ),
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
                    ),
    
    
                    Text(
                      Localization.of(context)!.you_are_strong,
                      style: TextStyle(
                        color: Color(0xffd9d9d9),
                        fontSize: 30,
                      ),
                    ),
                  ]),
              ),
              SizedBox(height: 25),
              NavBar(),
            ],
          ),
        ),
      ),
    );
  }
}





class TimerCircle extends StatelessWidget {
  var value;
  String timeUnit;
  TimerCircle({
    Key? key,
    required this.value,
    required this.timeUnit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 131,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
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
                    value.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xffd9d9d9),
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            timeUnit,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xffd9d9d9),
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}





class ValueSaved extends StatelessWidget {
  const ValueSaved({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(0xff313432),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Localization.of(context)!.money_saved,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffd9d9d9),
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
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
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(0xff313432),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Localization.of(context)!.life_saved,
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
    );
  }
}

class Greetings extends StatelessWidget {
  const Greetings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Localization.of(context)!.good_evening,
          style: TextStyle(
            color: Color(0xffebe9e9),
            fontSize: 35,
          ),
        ),
        SizedBox(height: 9),
        Text(
          Localization.of(context)!.glad_to_see,
          style: TextStyle(
            color: Color(0xffd9d9d9),
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff313433),
        borderRadius: BorderRadius.circular(40)
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.share, color: Color(0xffd9d9d9),size: 35,),
          Icon(Icons.settings, color: Color(0xffd9d9d9),size: 35,)
        ]
      ),
    );
  }
}
