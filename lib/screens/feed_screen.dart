import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_flutter/utils/colors.dart';

import '../widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SvgPicture.asset(
            'assets/images/ic_instagram.svg',
            color: primaryColor,
          ),
          const Icon(
            Icons.chat_outlined,
            color: primaryColor,
          )
        ]),
      ),
      body: const PostCard(),
    );
  }
}
