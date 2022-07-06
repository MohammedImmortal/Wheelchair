import 'package:flutter/material.dart';
import 'package:wheelchair/nodedata.dart';
import 'package:wheelchair/mapp.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:alan_voice/alan_voice.dart';
import 'dart:convert';

import 'package:wheelchair/welcomescreen.dart';

class FieldsState {
  String? current;
  String? destination;

  FieldsState(this.current, this.destination);
  Map<String, dynamic> toJason() => {
        'current': current,
        'destination': destination,
      };
}

class Command extends StatefulWidget {
  const Command({Key? key}) : super(key: key);

  @override
  State<Command> createState() => _CommandState();
}

class _CommandState extends State<Command> {
  var currentController = TextEditingController();
  var destinationController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? selectedNode;
  final currentState = FieldsState("", "");
  bool _greetingIsPlayed = false;

  void setVisuals() {
    var visual = jsonEncode(currentState);
    AlanVoice.setVisualState(visual);
  }

  @override
  void initState() {
    super.initState();
  }

  _CommandState() {
    AlanVoice.addButton(
        "fba5be6235b56128cbb29253aea935592e956eca572e1d8b807a3e2338fdd0dc/prod");
    AlanVoice.onCommand.add((command) => _handleCommand(command.data));
    AlanVoice.onButtonState.add((state) {
      if (state.name == "ONLINE" && !_greetingIsPlayed) {
        _greetingIsPlayed = true;
        AlanVoice.activate();
        AlanVoice.playText("Hello! I'm your Voice Assistant!");
        AlanVoice.playText("What's your name?");
      }
    });
  }

  void _handleCommand(Map<String, dynamic> command) {
    switch (command["command"]) {
      case "getDestination":
        destinationController.text = command["text"];
        currentState.destination = destinationController.text;
        setVisuals();
        break;
      case "getCurrent":
        currentController.text = command["text"];
        currentState.current = currentController.text;
        setVisuals();
        break;
      case "submit":
        final form = formKey.currentState!;
        if (form.validate()) {
          form.save();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Mapp(
                        current: currentController.text.toLowerCase(),
                        destination: destinationController.text.toLowerCase(),
                      )));
        }
        break;
      default:
        debugPrint("Unknown Command");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const WelcomeScreen()),
          ),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text("Destination"),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Please Enter Current Location and Destination',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  TypeAheadFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: currentController,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          labelText: 'Current Location',
                          contentPadding: EdgeInsets.all(10)),
                    ),
                    suggestionsCallback: NodeData.getSuggestions,
                    itemBuilder: (context, String? suggestion) => ListTile(
                      title: Text(suggestion!),
                    ),
                    onSuggestionSelected: (String? suggestion) =>
                        currentController.text = suggestion!,
                    validator: (value) {
                      String valuelower = value!.toLowerCase();
                      bool isInTheList = false;
                      for (var item in NodeData.nodeList) {
                        if (item == valuelower) {
                          isInTheList = true;
                        }
                      }
                      if (valuelower.isEmpty || isInTheList == false) {
                        return 'Please Select Places only from the List';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (valuelower) => selectedNode = valuelower,
                  ),
                  const SizedBox(height: 15.0),
                  TypeAheadFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: destinationController,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          labelText: 'Destination',
                          contentPadding: EdgeInsets.all(10)),
                    ),
                    suggestionsCallback: NodeData.getSuggestions,
                    itemBuilder: (context, String? suggestion) => ListTile(
                      title: Text(suggestion!),
                    ),
                    onSuggestionSelected: (String? suggestion) =>
                        destinationController.text = suggestion!,
                    validator: (value) {
                      String valuelower = value!.toLowerCase();
                      bool isInTheList = false;
                      for (var item in NodeData.nodeList) {
                        if (item == valuelower) {
                          isInTheList = true;
                        }
                      }
                      if (valuelower.isEmpty || isInTheList == false) {
                        return 'Please Select Places only from the List';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (valuelower) => selectedNode = valuelower,
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          elevation: MaterialStateProperty.all(5),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(10)),
                        ),
                        child: const Text('SUBMIT'),
                        onPressed: () {
                          final form = formKey.currentState!;
                          if (form.validate()) {
                            form.save();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Mapp(
                                          current: currentController.text
                                              .toLowerCase(),
                                          destination: destinationController
                                              .text
                                              .toLowerCase(),
                                        )));
                          }
                        }),
                  ),
                  //const SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
