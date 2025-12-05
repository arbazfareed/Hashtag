// widgets/hashtag_text.dart
import 'package:flutter/material.dart';
import '../utils/hashtag_helper.dart';

class HashtagText extends StatelessWidget {
  final String text;

  const HashtagText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 360;

    return Text.rich(
      HashtagHelper.buildHighlightedText(text),
      style: TextStyle(
        fontSize: isSmallScreen ? 14 : 15,
        height: 1.6,
        color: const Color(0xFF334155),
      ),
    );
  }
}