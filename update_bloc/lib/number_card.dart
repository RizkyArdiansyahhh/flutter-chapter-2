import 'package:flutter/material.dart';

class NumberCard extends StatelessWidget {
  final String text;
  final int? number;
  const NumberCard({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, color: Color(0xffFFFFFF)),
            ),
          ),
        ),
        Container(
          width: 100,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Center(
            child: Text(
              "$number",
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
