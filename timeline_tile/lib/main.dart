import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(
              width: 100,
              height: 150,
              child: TimelineTile(
                alignment: TimelineAlign.manual,
                endChild: Text("Start"),
                beforeLineStyle: LineStyle(thickness: 6),
                isFirst: true,
                lineXY: 0,
              ),
            ),
            SizedBox(
              width: 100,
              child: TimelineDivider(begin: 0.12, end: 0.88, thickness: 6),
            ),
            SizedBox(
              width: 100,
              height: 150,
              child: TimelineTile(
                alignment: TimelineAlign.manual,
                beforeLineStyle: LineStyle(thickness: 6),
                endChild: Text("Mid"),
                lineXY: 1,
              ),
            ),
            SizedBox(
              width: 100,
              child: TimelineDivider(begin: 0.12, end: 0.88, thickness: 6),
            ),
            SizedBox(
              width: 100,
              height: 150,
              child: TimelineTile(
                alignment: TimelineAlign.manual,
                endChild: Text("End"),
                isLast: true,
                beforeLineStyle: LineStyle(thickness: 6),
                lineXY: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
