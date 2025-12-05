// widgets/hashtag_text_field.dart
import 'package:flutter/material.dart';
import '../utils/hashtag_helper.dart';

class HashtagTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final IconData icon;

  const HashtagTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    required this.icon,
  });

  @override
  State<HashtagTextField> createState() => _HashtagTextFieldState();
}

class _HashtagTextFieldState extends State<HashtagTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  void _onTextChanged() {
    setState(() {});
  }

  void _onFocusChanged() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: _isFocused
              ? const Color(0xFF667eea)
              : Colors.grey[300]!,
          width: _isFocused ? 2.5 : 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: _isFocused
                ? const Color(0xFF667eea).withOpacity(0.2)
                : Colors.black.withOpacity(0.06),
            blurRadius: _isFocused ? 15 : 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 0),
            child: Row(
              children: [
                Icon(
                  widget.icon,
                  color: _isFocused
                      ? const Color(0xFF667eea)
                      : Colors.grey[400],
                  size: 22,
                ),
                const SizedBox(width: 10),
                Text(
                  _isFocused ? 'Typing...' : 'Start typing',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: _isFocused
                        ? const Color(0xFF667eea)
                        : Colors.grey[500],
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
          TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            maxLines: widget.maxLines,
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Color(0xFF1E293B),
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 16,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.fromLTRB(18, 12, 18, 18),
            ),
          ),
          if (widget.controller.text.isNotEmpty)
            Container(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 16),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFE2E8F0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.remove_red_eye_rounded,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Preview',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[600],
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text.rich(
                      HashtagHelper.buildHighlightedText(
                        widget.controller.text,
                      ),
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}