import 'package:flutter/material.dart';
import 'am_pm.dart';
import 'hours.dart';
import 'minutes.dart';

class TimeWheel extends StatefulWidget {
  const TimeWheel({Key? key}) : super(key: key);

  @override
  _TimeWheelState createState() => _TimeWheelState();
}

class _TimeWheelState extends State<TimeWheel> {
  late FixedExtentScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width * 0.4,
      height: 50,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // hours wheel
            Container(
              width: 50,
              child: ListWheelScrollView.useDelegate(
                controller: _controller,
                itemExtent: 50,
                perspective: 0.005,
                diameterRatio: 1.2,
                physics: FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 13,
                  builder: (context, index) {
                    return MyHours(
                      hours: index,
                    );
                  },
                ),
              ),
            ),
            // minutes wheel
            Container(
              width: 50,
              child: ListWheelScrollView.useDelegate(
                itemExtent: 50,
                perspective: 0.005,
                diameterRatio: 1.2,
                physics: FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 60,
                  builder: (context, index) {
                    return MyMinutes(
                      mins: index,
                    );
                  },
                ),
              ),
            ),
            // am or pm
            Container(
              width: 50,
              child: ListWheelScrollView.useDelegate(
                itemExtent: 50,
                perspective: 0.005,
                diameterRatio: 1.2,
                physics: FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 2,
                  builder: (context, index) {
                    if (index == 0) {
                      return AmPm(
                        isItAm: true,
                      );
                    } else {
                      return AmPm(
                        isItAm: false,
                      );
                    }
                  },
                ),
              ),
            ),
          ],
      ),
    );
  }
}