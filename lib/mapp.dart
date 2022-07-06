import 'package:flutter/material.dart';
import 'package:wheelchair/node.dart';
import 'package:wheelchair/position.dart';
import 'package:wheelchair/line.dart';

class Mapp extends StatefulWidget {
  const Mapp({Key? key, required this.current, required this.destination})
      : super(key: key);
  final String current;
  final String destination;

  @override
  State<Mapp> createState() => _MappState(current, destination);
}

class _MappState extends State<Mapp> {
  final String current;
  final String destination;

  @override
  void initState() {
    changeColour(current, destination);
    super.initState();
  }

  Map<String, bool> nodeCheck = {
    'lab 1': false,
    'lab 2': false,
    'lab 3': false,
    'lab 4': false,
    'lab 5': false,
    'lab 6': false,
    'hall 1': false,
    'hall 2': false,
    'hall 3': false,
    'hall 4': false,
    'hall 5': false,
    'lecture hall 1': false,
    'lecture hall 2': false,
    'student affairs': false,
    'A': false,
    'B': false,
    'C': false,
    'D': false,
    'E': false,
    'F': false,
    'G': false,
    'H': false,
    'I': false,
    'J': false,
    'K': false,
  };

  _MappState(this.current, this.destination);

  void changeValue(node) {
    nodeCheck[node] = true;
  }

  void changeColour(cur, des) {
    nodeCheck = {
      'lab 1': false,
      'lab 2': false,
      'lab 3': false,
      'lab 4': false,
      'lab 5': false,
      'lab 6': false,
      'hall 1': false,
      'hall 2': false,
      'hall 3': false,
      'hall 4': false,
      'hall 5': false,
      'lecture hall 1': false,
      'lecture hall 2': false,
      'student affairs': false,
      'A': false,
      'B': false,
      'C': false,
      'D': false,
      'E': false,
      'F': false,
      'G': false,
      'H': false,
      'I': false,
      'J': false,
      'K': false,
    };
    changeValue(cur);
    changeValue(des);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(' Map '),
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.teal,
            child: Stack(
              children: [
                NodeMap(
                  ispushed: nodeCheck["lab 1"]!,
                  top: 160.0,
                  left: 312.0,
                  texxt: "Lab 1",
                ),

                NodeMap(
                  ispushed: nodeCheck["lecture hall 1"]!,
                  top: 160.0,
                  left: 221.0,
                  texxt: "Lec Hall 1",
                ),
                NodeMap(
                  ispushed: nodeCheck["hall 2"]!,
                  top: 0.0,
                  left: 130.0,
                  texxt: "Hall 2",
                ),
                NodeMap(
                  ispushed: nodeCheck["lab 5"]!,
                  top: 0.0,
                  left: 50.0,
                  texxt: "Lab 5",
                ),
                NodeMap(
                  ispushed: nodeCheck["hall 1"]!,
                  top: 230.0,
                  left: 260.0,
                  texxt: "Hall 1",
                ),
                NodeMap(
                  ispushed: nodeCheck["hall 3"]!,
                  top: 230.0,
                  left: 130.0,
                  texxt: "Hall 3",
                ),
                NodeMap(
                  ispushed: nodeCheck["lab 6"]!,
                  top: 390.0,
                  left: 260.0,
                  texxt: "Lab 6",
                ),
                NodeMap(
                  ispushed: nodeCheck["lab 3"]!,
                  top: 390.0,
                  left: 130.0,
                  texxt: "Lab 3",
                ),
                NodeMap(
                  ispushed: nodeCheck["student affairs"]!,
                  top: 310.0,
                  left: 0.0,
                  texxt: "Student Affairs",
                ),
                NodeMap(
                  ispushed: nodeCheck["hall 5"]!,
                  top: 410.0,
                  left: 0.0,
                  texxt: "Hall 5",
                ),
                NodeMap(
                  ispushed: nodeCheck["lab 4"]!,
                  top: 420.0,
                  left: 190.0,
                  texxt: "Lab 4",
                ),
                NodeMap(
                  ispushed: nodeCheck["lab 2"]!,
                  top: 580.0,
                  left: 190.0,
                  texxt: "Lab 2",
                ),
                NodeMap(
                  ispushed: nodeCheck["lecture hall 2"]!,
                  top: 420.0,
                  left: 310.0,
                  texxt: "Lec Hall 2",
                ),
                NodeMap(
                  ispushed: nodeCheck["hall 4"]!,
                  top: 580.0,
                  left: 310.0,
                  texxt: "Hall 4",
                ),
                PositionMap(
                  ispushed: nodeCheck["A"]!,
                  top: 90.0,
                  left: 320.0,
                  texxt: "A",
                ),
                PositionMap(
                  ispushed: nodeCheck["B"]!,
                  top: 90.0,
                  left: 230.0,
                  texxt: "B",
                ),
                PositionMap(
                  ispushed: nodeCheck["C"]!,
                  top: 90.0,
                  left: 140.0,
                  texxt: "C",
                ),
                PositionMap(
                  ispushed: nodeCheck["D"]!,
                  top: 90.0,
                  left: 60.0,
                  texxt: "D",
                ),
                PositionMap(
                  ispushed: nodeCheck["E"]!,
                  top: 320.0,
                  left: 60.0,
                  texxt: "E",
                ),
                PositionMap(
                  ispushed: nodeCheck["F"]!,
                  top: 320.0,
                  left: 140.0,
                  texxt: "F",
                ),
                PositionMap(
                  ispushed: nodeCheck["G"]!,
                  top: 320.0,
                  left: 270.0,
                  texxt: "G",
                ),
                PositionMap(
                  ispushed: nodeCheck["H"]!,
                  top: 420.0,
                  left: 60.0,
                  texxt: "H",
                ),
                PositionMap(
                  ispushed: nodeCheck["I"]!,
                  top: 510.0,
                  left: 60.0,
                  texxt: "I",
                ),
                PositionMap(
                  ispushed: nodeCheck["J"]!,
                  top: 510.0,
                  left: 200.0,
                  texxt: "J",
                ),
                PositionMap(
                  ispushed: nodeCheck["K"]!,
                  top: 510.0,
                  left: 320.0,
                  texxt: "K",
                ),
                //Horizontal Lines
                const LineMap(
                  width: 60.0,
                  height: 25.0,
                  top: 100.0,
                  left: 260.0,
                ),
                const LineMap(
                  width: 60.0,
                  height: 25.0,
                  top: 100.0,
                  left: 170.0,
                ),
                const LineMap(
                  width: 50.0,
                  height: 25.0,
                  top: 100.0,
                  left: 90.0,
                ),
                const LineMap(
                  width: 100.0,
                  height: 25.0,
                  top: 330.0,
                  left: 170.0,
                ),
                const LineMap(
                  width: 50.0,
                  height: 25.0,
                  top: 330.0,
                  left: 90.0,
                ),
                const LineMap(
                  width: 10.0,
                  height: 15.0,
                  top: 338.0,
                  left: 50.0,
                ),
                const LineMap(
                  width: 10.0,
                  height: 15.0,
                  top: 438.0,
                  left: 50.0,
                ),
                const LineMap(
                  width: 90.0,
                  height: 25.0,
                  top: 525.0,
                  left: 230.0,
                ),
                const LineMap(
                  width: 110.0,
                  height: 25.0,
                  top: 525.0,
                  left: 90.0,
                ),
                //Vertical Lines
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 140.0,
                  left: 328.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 140.0,
                  left: 238.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 70.0,
                  left: 148.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 70.0,
                  left: 68.0,
                ),
                const LineMap(
                  width: 20.0,
                  height: 180.0,
                  top: 140.0,
                  left: 65.0,
                ),
                const LineMap(
                  width: 20.0,
                  height: 50.0,
                  top: 370.0,
                  left: 65.0,
                ),
                const LineMap(
                  width: 20.0,
                  height: 40.0,
                  top: 470.0,
                  left: 65.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 300.0,
                  left: 278.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 370.0,
                  left: 278.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 300.0,
                  left: 148.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 370.0,
                  left: 148.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 490.0,
                  left: 208.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 560.0,
                  left: 208.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 490.0,
                  left: 328.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 560.0,
                  left: 328.0,
                ),
              ],
            )));
  }
}
