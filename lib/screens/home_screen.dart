import 'dart:io';
import 'package:flutter/material.dart';
import 'package:i_can/utils/string_ext.dart';
import 'package:intl/intl.dart';
import 'dart:async' show Future, Timer;
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer _timer;
  var _index = 0;
  String _motivation = 'You are stronger than you think :)';

  final _dateNow = DateTime.now();
  late DateTime _durationLastOpen;
  Duration _durationNoSmoking = const Duration();
  late Timer _timerNoSmoking;
  int _lastSeconds = 0;

  void _timerStopWatch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('first_open') == null) {
      _lastSeconds = _durationNoSmoking.inSeconds;
      prefs.setString('first_open', _dateNow.toString());
      print('test 1 ${_lastSeconds++}');
    } else {
      _durationLastOpen = DateTime.parse((prefs.getString('first_open') ?? ''));
      _lastSeconds = _dateNow.difference(_durationLastOpen).inSeconds;
      print('test 2 ${_lastSeconds++}');
    }
  }

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/motivations.json');
    List data = json.decode(jsonText)['results'];
    _timer = Timer.periodic(const Duration(seconds: 30), (_) {
      setState(() {
        _index++;
        _index = _index >= data.length ? 0 : _index;
        _motivation = data.elementAt(_index);
      });
    });
    return 'Success';
  }

  @override
  void initState() {
    loadJsonData();
    _timerStopWatch();
    _timerNoSmoking = Timer.periodic(const Duration(seconds: 1), (_) {
      final seconds = _lastSeconds++;
      setState(() {
        _durationNoSmoking = Duration(seconds: seconds);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _timerNoSmoking.cancel();
    super.dispose();
  }

  final controller = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    String _twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = _twoDigits(_durationNoSmoking.inHours);
    final minutes = _twoDigits(_durationNoSmoking.inMinutes.remainder(60));
    final seconds = _twoDigits(_durationNoSmoking.inSeconds.remainder(60));

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
                child: Screenshot(
                  controller: controller,
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
                                TimerCircle(timeUnit: "hours", value: hours),
                                TimerCircle(
                                    timeUnit: "minutes", value: minutes),
                                TimerCircle(
                                  timeUnit: "seconds",
                                  value: seconds,
                                )
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "of no smoking",
                                textAlign: TextAlign.center,
                                style: TextStyle(
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
                              children: const [
                                Text(
                                  "Cigarettes Avoided",
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 7.5,
                          child: Text(
                            _motivation,
                            style: const TextStyle(
                              color: Color(0xffd9d9d9),
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              const SizedBox(height: 25),
              NavBar(
                controller: controller,
              ),
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
                "Money Saved",
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
    );
  }
}

class Greetings extends StatefulWidget {
  const Greetings({Key? key}) : super(key: key);

  @override
  State<Greetings> createState() => _GreetingsState();
}

class _GreetingsState extends State<Greetings> {
  DateTime now = DateTime.now();
  late String _formattedDate;
  String _name = '';

  void getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _name = prefs.getString('name') ?? '';
  }

  @override
  void initState() {
    getName();
    _formattedDate = DateFormat('kk').format(now);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${_formattedDate.toTimeConvention()}, $_name",
          style: const TextStyle(
            color: Color(0xffebe9e9),
            fontSize: 35,
          ),
        ),
        const SizedBox(height: 9),
        const Text(
          "Glad to see your performance",
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
  ScreenshotController controller;
  NavBar({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff313433), borderRadius: BorderRadius.circular(40)),
      height: 60,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        IconButton(
          onPressed: () async {
            final image = await controller.capture();

            final name = 'ICAN_${DateTime.now()}';
            if (image == null) return;
            await [Permission.storage].request();
            final directory = await getApplicationDocumentsDirectory();
            final file = File('${directory.path}/$name.jpg');
            file.writeAsBytesSync(image);
            await Share.shareFiles([file.path], text: 'I CAN');
          },
          icon: const Icon(
            Icons.share,
            color: Color(0xffd9d9d9),
            size: 35,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
            color: Color(0xffd9d9d9),
            size: 35,
          ),
        ),
      ]),
    );
  }
}
