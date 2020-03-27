// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';



// BEGIN listDemo

enum ListDemoType {
  oneLine,
  twoLine,
}

class ListDemo extends StatelessWidget {
  const ListDemo({Key key, this.type}) : super(key: key);

  final ListDemoType type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Lists'),
      ),
      body: Scrollbar(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 8),
          children: [
            for (int index = 1; index < 21; index++)
              ListTile(
                leading: ExcludeSemantics(
                  child: CircleAvatar(child: Text('$index')),
                ),
                title: Text(
                  'Item '(index),
                ),
                subtitle: type == ListDemoType.twoLine
                    ? Text('Secondary text')
                    : null,
              ),
          ],
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

	static const String _title = 'List Demonstration';

	@override
	void initState() {
		super.initState();
		_body = ListDemo(type:ListDemoType.oneLine);
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
									_body = ListDemo(type:ListDemoType.oneLine);
								});
							},
						),
						IconButton(
							icon: const Icon(Icons.looks_two),
							onPressed: () {
								setState(() {
									_body = ListDemo(type:ListDemoType.twoLine);
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
