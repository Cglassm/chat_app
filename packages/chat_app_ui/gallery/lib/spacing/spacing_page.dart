import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';

class SpacingPage extends StatelessWidget {
  const SpacingPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SpacingPage());
  }

  @override
  Widget build(BuildContext context) {
    const spacingList = [
      _SpacingItem(spacing: CHSpacing.xxxs, name: 'xxxs'),
      _SpacingItem(spacing: CHSpacing.xxs, name: 'xxs'),
      _SpacingItem(spacing: CHSpacing.xs, name: 'xs'),
      _SpacingItem(spacing: CHSpacing.sm, name: 'sm'),
      _SpacingItem(spacing: CHSpacing.md, name: 'md'),
      _SpacingItem(spacing: CHSpacing.lg, name: 'lg'),
      _SpacingItem(spacing: CHSpacing.xlg, name: 'xlg'),
      _SpacingItem(spacing: CHSpacing.xxlg, name: 'xxlg'),
      _SpacingItem(spacing: CHSpacing.xxxlg, name: 'xxxlg'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Spacing')),
      body: ListView.builder(
        itemCount: spacingList.length,
        itemBuilder: (_, index) => spacingList[index],
      ),
    );
  }
}

class _SpacingItem extends StatelessWidget {
  const _SpacingItem({required this.spacing, required this.name});

  final double spacing;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CHSpacing.sm),
      child: Row(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                color: CHColors.black,
                width: CHSpacing.xxs,
                height: CHSpacing.lg,
              ),
              Container(
                width: spacing,
                height: CHSpacing.lg,
                color: CHColors.lightViolet,
              ),
              Container(
                color: CHColors.black,
                width: CHSpacing.xxs,
                height: CHSpacing.lg,
              ),
            ],
          ),
          const SizedBox(width: CHSpacing.sm),
          Text(name),
        ],
      ),
    );
  }
}
