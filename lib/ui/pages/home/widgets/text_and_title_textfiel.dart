import 'package:flutter/material.dart';
import 'package:tenis_club/utils/resources/colors.dart';

class TextAndTitle extends StatelessWidget {
  const TextAndTitle({
    super.key,
    required this.title,
    required this.text,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RichText(
      text: TextSpan(
        style: theme.textTheme.titleSmall?.copyWith(color: AppColors.fontTitle),
        children: <TextSpan>[
           TextSpan(
              text: '$title: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: text),
        ],
      ),
    );
  }
}