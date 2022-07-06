import 'package:flutter/material.dart';

class LineMap extends StatelessWidget {
  final dynamic top;
  final dynamic left;
  final dynamic width;
  final dynamic height;

  const LineMap({
    Key? key,
    required this.width,
    required this.height,
    required this.top,
    required this.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: width,
      height: height,
      top: top,
      left: left,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.black,
        ),
      ),
    );
  }
}
