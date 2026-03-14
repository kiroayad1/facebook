import 'package:flutter/material.dart';

import '../constants.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Facebook',
                style: TextStyle(
                  color: kBlue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const _ActionCircle(icon: Icons.add, filled: true),
              const SizedBox(width: 10),
              const Icon(Icons.search, color: kBlack, size: 28),
              const SizedBox(width: 10),
              const _ActionCircle(icon: Icons.chat, filled: true),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _TopTab(icon: Icons.home, active: true),
              const _TopTab(icon: Icons.ondemand_video_outlined),
              const _TopTab(icon: Icons.storefront_outlined),
              const _TopTab(icon: Icons.account_circle_outlined),
              const _TopTab(icon: Icons.notifications_none),
              CircleAvatar(
                radius: 15,
                backgroundImage: const AssetImage('Images/096ff7fd728e880bca931a69a1417a5f.jpg'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionCircle extends StatelessWidget {
  const _ActionCircle({required this.icon, this.filled = false});

  final IconData icon;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: filled ? kBlack : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: filled ? kWhite : kBlack, size: 17),
    );
  }
}

class _TopTab extends StatelessWidget {
  const _TopTab({required this.icon, this.active = false});

  final IconData icon;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      child: Column(
        children: [
          Icon(icon, color: active ? kBlue : kGray, size: 29),
          const SizedBox(height: 6),
          Container(
            height: 2,
            color: active ? kBlue : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
