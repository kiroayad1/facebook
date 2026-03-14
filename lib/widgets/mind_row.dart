import 'package:flutter/material.dart';

import '../constants.dart';

class MindRow extends StatelessWidget {
  const MindRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('Images/096ff7fd728e880bca931a69a1417a5f.jpg'),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              "What's in Your Mind?",
              style: TextStyle(fontSize: 16, color: kGray, fontWeight: FontWeight.w400),
            ),
          ),
          Icon(Icons.image_outlined, color: Colors.green.shade500, size: 28),
        ],
      ),
    );
  }
}
