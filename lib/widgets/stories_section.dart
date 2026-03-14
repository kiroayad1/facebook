import 'package:flutter/material.dart';

import '../constants.dart';

class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        scrollDirection: Axis.horizontal,
        children: const [
          _CreateStoryCard(),
          SizedBox(width: 8),
          _StoryCard(
            imagePath: 'Images/429820590_791043733050594_2437304548159507703_n.jpg',
            userImagePath: 'Images/model4.jpg',
          ),
          SizedBox(width: 8),
          _StoryCard(
            imagePath: 'Images/model2.jpg',
            userImagePath: 'Images/096ff7fd728e880bca931a69a1417a5f.jpg',
          ),
          SizedBox(width: 8),
          _StoryCard(
            imagePath: 'Images/image4.jpg',
            userImagePath: 'Images/model3.jpg',
          ),
        ],
      ),
    );
  }
}

class _CreateStoryCard extends StatelessWidget {
  const _CreateStoryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 124,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFD2D6DF)),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(
                    'Images/096ff7fd728e880bca931a69a1417a5f.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                const Positioned(
                  bottom: -14,
                  left: 46,
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: kBlue,
                    child: Icon(Icons.add, color: kWhite, size: 20),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Create a\nStory',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: kBlack, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({required this.imagePath, required this.userImagePath});

  final String imagePath;
  final String userImagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 124,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: kBlue, width: 2),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(backgroundImage: AssetImage(userImagePath)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
