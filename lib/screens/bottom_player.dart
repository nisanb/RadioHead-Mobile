import 'package:flutter/material.dart';

class BottomPlayer extends StatefulWidget {
  @override
  _BottomPlayerState createState() => _BottomPlayerState();
}

class _BottomPlayerState extends State<BottomPlayer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("Want to open bottom sheet"),
      child: Container(
        child: Row(
          children: <Widget>[
            Icon(
              Icons.play_circle_filled,
              color: Colors.grey,
              size: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
