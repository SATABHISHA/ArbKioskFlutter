import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({required this.colour, required this.title, required this.onPressed, required this.title_color});

  final Color colour;
  final String title;
  final Color title_color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 10.0,
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 50.0,
          child: AutoSizeText(
            title,
            style: TextStyle(color: title_color, fontSize: 15,),
            textAlign: TextAlign.center,
            maxLines: 1,
            minFontSize: 10,
          ),
        ),
      ),
    );
  }
}