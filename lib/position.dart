import 'package:flutter/material.dart';

class PositionMap extends StatelessWidget {
  final String texxt;
  final dynamic top;
  final dynamic left;
  final bool ispushed;

  const PositionMap({
    Key? key,
    required this.texxt,
    this.top,
    this.left,
    required this.ispushed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        width: 30,
        height: 50,
        top: top,
        left: left,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ispushed ? Colors.red : Colors.black,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
          ),
          child: Text(
            texxt,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
