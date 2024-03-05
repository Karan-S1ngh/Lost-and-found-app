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
  final int selectedBarIndex;

  const AnimatedBottomBar({
    super.key,
    required this.barItems,
    required this.animationDuration,
    required this.barStyle,
    required this.onBarTap,
    required this.selectedBarIndex,
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
            selectedIndex: selectedBarIndex,
          ),
        ),
      ),
    );
  }

  Widget _buildBarItem(
      {required BarItem item, required int index, required int selectedIndex}) {
    final isSelected = index == selectedIndex;
    return Expanded(
      child: InkWell(
        onTap: () => onBarTap(index),
        child: SizedBox(
          height: 70,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: isSelected ? 8 : 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: const Color.fromARGB(255, 73, 71, 71)
                                    .withOpacity(0.3),
                                blurRadius: 13,
                                offset: const Offset(0, 3),
                              ),
                            ]
                          : [],
                    ),
                    child: Icon(
                      item.iconData,
                      size: barStyle.iconSize,
                      color: isSelected
                          ? const Color.fromARGB(255, 109, 57, 199)
                          : item.color,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      item.text,
                      style: TextStyle(
                        fontSize: barStyle.fontSize,
                        fontWeight: FontWeight.w700,
                        color: isSelected
                            ? const Color.fromARGB(255, 109, 57, 199)
                            : item.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
