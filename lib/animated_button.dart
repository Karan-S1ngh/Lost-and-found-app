// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum ButtonState {
  SHOW_ONLY_TEXT,
  SHOW_ONLY_ICON,
  SHOW_TEXT_ICON,
}

class ButtonStyle {
  final TextStyle initialTextStyle, finalTextStyle;
  final Color primaryColor, secondaryColor;
  final MaterialStateProperty<double?>? elevation;
  final double borderRadius;

  ButtonStyle({
    required this.primaryColor,
    required this.secondaryColor,
    required this.initialTextStyle,
    required this.finalTextStyle,
    this.elevation,
    required this.borderRadius,
  });
}

class AnimatedButton extends StatefulWidget {
  final String initialText, finalText;
  final ButtonStyle buttonStyle;
  final IconData iconData;
  final double iconSize;
  final Duration animationDuration;
  final Function onTap;

  const AnimatedButton({
    super.key,
    required this.initialText,
    required this.finalText,
    required this.iconData,
    required this.iconSize,
    required this.animationDuration,
    required this.buttonStyle,
    required this.onTap,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late ButtonState _currentState;
  late Animation<double> _scaleFinalTextAnimation;

  @override
  void initState() {
    super.initState();
    _currentState = ButtonState.SHOW_ONLY_TEXT;
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..addListener(() {
        final controllerValue = _controller.value;
        if (controllerValue < 0.2) {
          setState(() {
            _currentState = ButtonState.SHOW_ONLY_ICON;
          });
        } else if (controllerValue > 0.8) {
          setState(() {
            _currentState = ButtonState.SHOW_TEXT_ICON;
          });
        }
      });

    _controller.addStatusListener((currentStatus) {
      if (currentStatus == AnimationStatus.completed) {
        widget.onTap();
      }
    });

    _scaleFinalTextAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(widget.buttonStyle.borderRadius),
      child: InkWell(
        onTap: () {
          _controller.forward();
        },
        child: AnimatedContainer(
          duration: widget.animationDuration,
          height: widget.iconSize + 16,
          decoration: BoxDecoration(
            color: _currentState == ButtonState.SHOW_ONLY_TEXT
                ? widget.buttonStyle.primaryColor
                : widget.buttonStyle.secondaryColor,
            border: Border.all(
              color: widget.buttonStyle.primaryColor,
            ),
            borderRadius:
                BorderRadius.circular(widget.buttonStyle.borderRadius),
          ),
          padding: EdgeInsets.symmetric(
            horizontal:
                _currentState == ButtonState.SHOW_ONLY_ICON ? 16.0 : 48.0,
            vertical: 8.0,
          ),
          child: AnimatedSize(
            curve: Curves.easeIn,
            duration: widget.animationDuration,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _currentState == ButtonState.SHOW_ONLY_TEXT ||
                        _currentState == ButtonState.SHOW_TEXT_ICON
                    ? Icon(
                        widget.iconData,
                        size: widget.iconSize,
                        color: widget.buttonStyle.primaryColor,
                      )
                    : Container(),
                SizedBox(
                  width:
                      _currentState == ButtonState.SHOW_TEXT_ICON ? 30.0 : 0.0,
                ),
                _currentState != ButtonState.SHOW_ONLY_TEXT
                    ? ScaleTransition(
                        scale: _scaleFinalTextAnimation,
                        child: Text(
                          _currentState == ButtonState.SHOW_ONLY_ICON
                              ? widget.finalText
                              : widget.initialText,
                          style: _currentState == ButtonState.SHOW_ONLY_ICON
                              ? widget.buttonStyle.finalTextStyle
                              : widget.buttonStyle.initialTextStyle,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
