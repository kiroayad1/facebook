import 'package:flutter/material.dart';

import '../constants.dart';

class FeedPost extends StatelessWidget {
  const FeedPost({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _PostHeader(),
        _PostImage(),
        _PostActions(),
      ],
    );
  }
}

class _PostHeader extends StatelessWidget {
  const _PostHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('Images/429820590_791043733050594_2437304548159507703_n.jpg'),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Route', style: TextStyle(fontSize: 18, color: kBlack, fontWeight: FontWeight.bold)),
              SizedBox(height: 3),
              Row(
                children: [
                  Text('8h', style: TextStyle(fontSize: 16, color: kGray)),
                  SizedBox(width: 4),
                  Icon(Icons.public, size: 16, color: kGray),
                ],
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.more_horiz, color: kBlack, size: 30),
        ],
      ),
    );
  }
}

class _PostImage extends StatelessWidget {
  const _PostImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhite,
      width: double.infinity,
      height: 390,
      alignment: Alignment.center,
      child: Image.asset(
        'Images/394207767_709508957870739_4789263993603935944_n.jpg',
        fit: BoxFit.contain,
        width: double.infinity,
        height: 380,
      ),
    );
  }
}

class _PostActions extends StatelessWidget {
  const _PostActions();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 2, 16, 10),
      child: Row(
        children: [
          Icon(Icons.favorite_border, color: kBlack, size: 25),
          SizedBox(width: 12),
          Icon(Icons.mode_comment_outlined, color: kBlack, size: 25),
          SizedBox(width: 12),
          Icon(Icons.send_outlined, color: kBlack, size: 25),
          Spacer(),
          Icon(Icons.bookmark_border, color: kBlack, size: 25),
        ],
      ),
    );
  }
}
