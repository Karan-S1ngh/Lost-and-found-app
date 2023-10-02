import 'package:flutter/material.dart';

class BarItem {
  final String text;
  final IconData iconData;
  final Color color;

  BarItem({
    required this.text,
    required this.iconData,
    required this.color,
  });
}

class BarStyle {
  final double fontSize;
  final double iconSize;

  BarStyle({
    required this.fontSize,
    required this.iconSize,
  });
}

class AnimatedBottomBar extends StatelessWidget {
  final List<BarItem> barItems;
  final Duration animationDuration;
  final BarStyle barStyle;
  final void Function(int) onBarTap;

  const AnimatedBottomBar({
    super.key,
    required this.barItems,
    required this.animationDuration,
    required this.barStyle,
    required this.onBarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          barItems.length,
          (index) => _buildBarItem(
            item: barItems[index],
            index: index,
          ),
        ),
      ),
    );
  }

  Widget _buildBarItem({required BarItem item, required int index}) {
    return Expanded(
      child: InkWell(
        onTap: () => onBarTap(index),
        child: SizedBox(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                item.iconData,
                size: barStyle.iconSize,
                color: item.color,
              ),
              const SizedBox(height: 4),
              Text(
                item.text,
                style: TextStyle(
                  fontSize: barStyle.fontSize,
                  color: item.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
