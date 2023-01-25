import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.height,
  });

  final String title;
  final VoidCallback onPressed;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.black,
    );
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: FilledButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(
              Constants.orangeColor,
            ),
            elevation: MaterialStatePropertyAll<double>(5),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: style,
          ),
        ),
      ),
    );
  }
}
