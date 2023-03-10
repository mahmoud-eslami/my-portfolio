import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/constants/constants.dart';

import 'custom_mouse_region.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.height,
    this.textStyle,
  });

  final String title;
  final VoidCallback onPressed;
  final double? width, height;
  final TextStyle? textStyle;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isHoverd = false;

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: isHoverd ? Constants.creamColor : Colors.black,
    );
    return CustomMouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          isHoverd = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHoverd = false;
        });
      },
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: FilledButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(
                isHoverd ? Colors.black : Constants.orangeColor,
              ),
              elevation: MaterialStatePropertyAll<double>(isHoverd ? 15 : 5),
              shape: MaterialStatePropertyAll<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(isHoverd ? 15 : 35),
                  ),
                ),
              ),
            ),
            onPressed: widget.onPressed,
            child: Text(
              widget.title,
              style: widget.textStyle?.copyWith(
                    color: isHoverd ? Constants.creamColor : Colors.black,
                  ) ??
                  style,
            ),
          ),
        ),
      ),
    );
  }
}
