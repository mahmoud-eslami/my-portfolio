import 'package:flutter/material.dart';

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
      fontSize: 30,
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
              Color(0xffF6820C),
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
