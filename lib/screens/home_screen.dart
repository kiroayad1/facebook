import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/feed_post.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/mind_row.dart';
import '../widgets/stories_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Column(
          children: [
            const HomeAppBar(),
            const Divider(height: 1, color: Color(0xFFC9CDD6)),
            const MindRow(),
            const Divider(height: 1, color: Color(0xFFC9CDD6)),
            const StoriesSection(),
            const Divider(height: 1, color: Color(0xFFC9CDD6)),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  FeedPost(),
                  SizedBox(height: 8),
                  Divider(height: 1, color: Color(0xFFE3E6ED)),
                  SizedBox(height: 8),
                  FeedPost(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
