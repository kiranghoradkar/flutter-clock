import 'dart:async';

import 'package:clock/model/data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Clock extends StatefulWidget {
  static String tag = "Clock-page";

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List dateDateTime = getCurrentDateTime();
    Data data = getTimeString(dateDateTime[2]);

    return Scaffold(
        body: Center(
      child: AspectRatio(
        aspectRatio: 1.66,
        child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(data.imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  dateDateTime[0],
                  style: TextStyle(
                      shadows: [
                        Shadow(
                          blurRadius: 8.0,
                          color: Colors.black45,
                          offset: Offset(2.0, 2.0),
                        ),
                        Shadow(
                          color: Colors.black45,
                          blurRadius: 8.0,
                          offset: Offset(-4.0, 2.0),
                        ),
                      ],
                      fontSize: 30, color: Colors.white, fontFamily: "Lora"),
                ),
                Text(
                  dateDateTime[1],
                  style: TextStyle(
                      shadows: [
                        Shadow(
                          blurRadius: 8.0,
                          color: Colors.black45,
                          offset: Offset(2.0, 2.0),
                        ),
                        Shadow(
                          color: Colors.black45,
                          blurRadius: 8.0,
                          offset: Offset(-4.0, 2.0),
                        ),
                      ],
                      fontSize: 120, color: Colors.white, fontFamily: "Lora"),
                ),
                Text(data.timeText,
                    style: TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 8.0,
                            color: Colors.black45,
                            offset: Offset(2.0, 2.0),
                          ),
                          Shadow(
                            color: Colors.black45,
                            blurRadius: 8.0,
                            offset: Offset(-4.0, 2.0),
                          ),
                        ],
                        fontSize: 20, color: Colors.white, fontFamily: "Lora"))
              ],
            )),
      ),
    ));
  }

// use custom font it will be look beautiful
  List getCurrentDateTime() {
    final timeFormat = DateFormat("HH:mm:ss");
    final dateFormat = DateFormat("dd/MM/yyyy");

    var now = DateTime.now();
    return [dateFormat.format(now), timeFormat.format(now), now];
  }

  Data getTimeString(DateTime currentTime) {
    var now = DateTime.now();
    var goodMorningStart =
        DateTime(now.year, now.month, now.day, 4, 0, 0, 0, 0);
    var goodMorningEnd = DateTime(now.year, now.month, now.day, 12, 0, 0, 0, 0);

    var goodAfternoonStart =
        DateTime(now.year, now.month, now.day, 12, 0, 0, 0, 0);
    var goodAfternoonEnd =
        DateTime(now.year, now.month, now.day, 20, 0, 0, 0, 0);

    var goodEveningStart =
        DateTime(now.year, now.month, now.day, 20, 0, 0, 0, 0);
    var goodEveningEnd = DateTime(now.year, now.month, now.day, 4, 0, 0, 0, 0);

    if (currentTime.isBefore(goodMorningEnd) &&
        currentTime.isAfter(goodMorningStart)) {
      return Data("Good Morning", "assets/morning.webp");
    } else if (currentTime.isBefore(goodAfternoonEnd) &&
        currentTime.isAfter(goodAfternoonStart)) {
      return Data("Good Afternoon", "assets/afternoon.webp");
    } else if (currentTime.isBefore(goodEveningEnd) &&
        currentTime.isAfter(goodEveningStart)) {
      return Data("Good Evening", "assets/evening.webp");
    } else {
      return Data("Good Evening", "assets/evening.webp");
    }
  }
}
