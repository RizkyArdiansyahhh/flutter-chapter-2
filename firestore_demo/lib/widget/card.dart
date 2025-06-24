import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String name;
  final int age;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  const CardWidget({
    super.key,
    required this.name,
    required this.age,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      width: MediaQuery.of(context).size.width * .95,
      height: 80,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "$age",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: onEdit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber[400],
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(12),
                ),
                child: Icon(Icons.edit_note_rounded, color: Colors.black),
              ),
              ElevatedButton(
                onPressed: onDelete,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(12),
                ),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
