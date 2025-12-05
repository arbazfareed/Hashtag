// utils/hashtag_helper.dart
import 'package:flutter/material.dart';

class HashtagHelper {
  /// Extracts all hashtags from the given text
  static List<String> extractHashtags(String text) {
    final RegExp hashtagRegex = RegExp(r'#\w+');
    final matches = hashtagRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Builds a TextSpan with highlighted hashtags
  static TextSpan buildHighlightedText(String text) {
    final RegExp hashtagRegex = RegExp(r'#\w+');
    final List<TextSpan> spans = [];
    int lastIndex = 0;

    for (final match in hashtagRegex.allMatches(text)) {
      // Add regular text before the hashtag
      if (match.start > lastIndex) {
        spans.add(TextSpan(
          text: text.substring(lastIndex, match.start),
          style: const TextStyle(color: Color(0xFF334155)),
        ));
      }

      // Add highlighted hashtag with gradient effect
      spans.add(TextSpan(
        text: match.group(0),
        style: const TextStyle(
          color: Color(0xFF667eea),
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
          shadows: [
            Shadow(
              color: Color(0xFF667eea),
              blurRadius: 0.5,
            ),
          ],
        ),
      ));

      lastIndex = match.end;
    }

    // Add remaining text after the last hashtag
    if (lastIndex < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastIndex),
        style: const TextStyle(color: Color(0xFF334155)),
      ));
    }

    return TextSpan(children: spans);
  }

  /// Count the number of hashtags in text
  static int countHashtags(String text) {
    return extractHashtags(text).length;
  }

  /// Validate if a string is a proper hashtag
  static bool isValidHashtag(String tag) {
    final RegExp hashtagRegex = RegExp(r'^#\w+$');
    return hashtagRegex.hasMatch(tag);
  }
}