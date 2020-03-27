// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';



enum SelectionControlsDemoType {
  checkbox,
  radio,
  switches,
}

class SelectionControlsDemo extends StatelessWidget {
  SelectionControlsDemo({Key key, @required this.type}) : super(key: key);

  final SelectionControlsDemoType type;

  String _title(BuildContext context) {
    switch (type) {
      case SelectionControlsDemoType.checkbox:
        return GalleryLocalizations.of(context)
            .demoSelectionControlsCheckboxTitle;
      case SelectionControlsDemoType.radio:
        return 'Radio';
      case SelectionControlsDemoType.switches:
        return GalleryLocalizations.of(context)
            .demoSelectionControlsSwitchTitle;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    Widget controls;
    switch (type) {
      case SelectionControlsDemoType.checkbox:
        controls = _CheckboxDemo();
        break;
      case SelectionControlsDemoType.radio:
        controls = _RadioDemo();
        break;
      case SelectionControlsDemoType.switches:
        controls = _SwitchDemo();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(_title(context)),
      ),
      body: controls,
    );
  }
}

// BEGIN selectionControlsDemoCheckbox

class _CheckboxDemo extends StatefulWidget {
  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<_CheckboxDemo> {
  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: checkboxValueA,
            onChanged: (value) {
              setState(() {
                checkboxValueA = value;
              });
            },
          ),
          Checkbox(
            value: checkboxValueB,
            onChanged: (value) {
              setState(() {
                checkboxValueB = value;
              });
            },
          ),
          Checkbox(
            value: checkboxValueC,
            tristate: true,
            onChanged: (value) {
              setState(() {
                checkboxValueC = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

// END

// BEGIN selectionControlsDemoRadio

class _RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<_RadioDemo> {
  int radioValue = 0;

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int index = 0; index < 3; ++index)
            Radio<int>(
              value: index,
              groupValue: radioValue,
              onChanged: handleRadioValueChanged,
            ),
        ],
      ),
    );
  }
}

// END

// BEGIN selectionControlsDemoSwitches

class _SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<_SwitchDemo> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Semantics(
        container: true,
        label:
            'Switch',
        child: Switch(
          value: switchValue,
          onChanged: (value) {
            setState(() {
              switchValue = value;
            });
          },
        ),
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

	static const String _title = 'Selection Controls Demonstration';

	@override
	void initState() {
		super.initState();
		_body = SelectionControlsDemo(type:SelectionControlsDemoType.checkbox,);
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
									_body = SelectionControlsDemo(type:SelectionControlsDemoType.checkbox,);
								});
							},
						),
						IconButton(
							icon: const Icon(Icons.looks_two),
							onPressed: () {
								setState(() {
									_body = SelectionControlsDemo(type:SelectionControlsDemoType.radio,);
								});
							},
						),
						IconButton(
							icon: const Icon(Icons.looks_3),
							onPressed: () {
								setState(() {
									_body = SelectionControlsDemo(type:SelectionControlsDemoType.switches,);
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
