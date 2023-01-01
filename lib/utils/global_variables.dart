import 'package:flutter/material.dart';
import 'package:instagram_flutter/screens/feed_screen.dart';

import '../screens/add_post_screen.dart';

const webScreenSize = 600;

const homeScreenItems = [
  FeedScreen(),
  const Text('search'),
  AddPostScreen(),
  const Text('like'),
  const Text('profile'),
];
