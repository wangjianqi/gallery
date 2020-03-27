// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:gallery/l10n/gallery_localizations.dart';

enum ChipDemoType {
  action,
  choice,
  filter,
  input,
}

class ChipDemo extends StatelessWidget {
  const ChipDemo({Key key, this.type}) : super(key: key);

  final ChipDemoType type;

  String _title(BuildContext context) {
    switch (type) {
      case ChipDemoType.action:
        return 'Action Chip';
      case ChipDemoType.choice:
        return 'Choice Chip';
      case ChipDemoType.filter:
        return 'Filter Chip';
      case ChipDemoType.input:
        return 'Input Chip';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    Widget buttons;
    switch (type) {
      case ChipDemoType.action:
        buttons = _ActionChipDemo();
        break;
      case ChipDemoType.choice:
        buttons = _ChoiceChipDemo();
        break;
      case ChipDemoType.filter:
        buttons = _FilterChipDemo();
        break;
      case ChipDemoType.input:
        buttons = _InputChipDemo();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(_title(context)),
      ),
      body: buttons,
    );
  }
}

// BEGIN chipDemoAction

class _ActionChipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
        onPressed: () {},
        avatar: Icon(
          Icons.brightness_5,
          color: Colors.black54,
        ),
        label: Text('Turn on lights'),
      ),
    );
  }
}

// END

// BEGIN chipDemoChoice

class _ChoiceChipDemo extends StatefulWidget {
  @override
  _ChoiceChipDemoState createState() => _ChoiceChipDemoState();
}

class _ChoiceChipDemoState extends State<_ChoiceChipDemo> {
  int indexSelected = -1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          ChoiceChip(
            label: Text('Small'),
            selected: indexSelected == 0,
            onSelected: (value) {
              setState(() {
                indexSelected = value ? 0 : -1;
              });
            },
          ),
          SizedBox(width: 8),
          ChoiceChip(
            label: Text('Medium'),
            selected: indexSelected == 1,
            onSelected: (value) {
              setState(() {
                indexSelected = value ? 1 : -1;
              });
            },
          ),
          SizedBox(width: 8),
          ChoiceChip(
            label: Text('Large'),
            selected: indexSelected == 2,
            onSelected: (value) {
              setState(() {
                indexSelected = value ? 2 : -1;
              });
            },
          ),
        ],
      ),
    );
  }
}

// END

// BEGIN chipDemoFilter

class _FilterChipDemo extends StatefulWidget {
  @override
  _FilterChipDemoState createState() => _FilterChipDemoState();
}

class _FilterChipDemoState extends State<_FilterChipDemo> {
  bool isSelectedElevator = false;
  bool isSelectedWasher = false;
  bool isSelectedFireplace = false;

  @override
  Widget build(BuildContext context) {
    final chips = [
      FilterChip(
        label: Text('Elevator'),
        selected: isSelectedElevator,
        onSelected: (value) {
          setState(() {
            isSelectedElevator = !isSelectedElevator;
          });
        },
      ),
      FilterChip(
        label: Text('Washer'),
        selected: isSelectedWasher,
        onSelected: (value) {
          setState(() {
            isSelectedWasher = !isSelectedWasher;
          });
        },
      ),
      FilterChip(
        label: Text('Fireplace'),
        selected: isSelectedFireplace,
        onSelected: (value) {
          setState(() {
            isSelectedFireplace = !isSelectedFireplace;
          });
        },
      ),
    ];

    return Center(
      child: Wrap(
        children: [
          for (final chip in chips)
            Padding(
              padding: const EdgeInsets.all(4),
              child: chip,
            )
        ],
      ),
    );
  }
}

// END

// BEGIN chipDemoInput

class _InputChipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InputChip(
        onPressed: () {},
        onDeleted: () {},
        avatar: Icon(
          Icons.directions_bike,
          size: 20,
          color: Colors.black54,
        ),
        deleteIconColor: Colors.black54,
        label: Text('Biking'),
      ),
    );
  }
}

// END
void main() => runApp(Example());

class Example extends StatefulWidget {
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  Widget _body;

  static const String _title = 'Chip Demonstration';

  @override
  void initState() {
    super.initState();
    _body = ChipDemo(type: ChipDemoType.action);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.looks_one),
              onPressed: () {
                setState(() {
                  _body = ChipDemo(type: ChipDemoType.action);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_two),
              onPressed: () {
                setState(() {
                  _body = ChipDemo(type: ChipDemoType.choice);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_3),
              onPressed: () {
                setState(() {
                  _body = ChipDemo(type: ChipDemoType.filter);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_4),
              onPressed: () {
                setState(() {
                  _body = ChipDemo(type: ChipDemoType.input);
                });
              },
            ),
          ],
        ),
        body: _body,
      ),
    );
  }
}
