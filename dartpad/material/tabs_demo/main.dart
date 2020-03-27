// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';


enum TabsDemoType {
  scrollable,
  nonScrollable,
}

class TabsDemo extends StatelessWidget {
  const TabsDemo({Key key, this.type}) : super(key: key);

  final TabsDemoType type;

  @override
  Widget build(BuildContext context) {
    Widget tabs;
    switch (type) {
      case TabsDemoType.scrollable:
        tabs = _TabsScrollableDemo();
        break;
      case TabsDemoType.nonScrollable:
        tabs = _TabsNonScrollableDemo();
    }
    return tabs;
  }
}

// BEGIN tabsScrollableDemo

class _TabsScrollableDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> tabs = [
      'RED',
      'ORANGE',
      'GREEN',
      'BLUE',
      'INDIGO',
      'PURPLE',
      'RED',
      'ORANGE',
      'GREEN',
      'BLUE',
      'INDIGO',
      'PURPLE',
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Scrolling'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              for (final tab in tabs) Tab(text: tab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (final tab in tabs)
              Center(
                child: Text(tab),
              ),
          ],
        ),
      ),
    );
  }
}

// END

// BEGIN tabsNonScrollableDemo

class _TabsNonScrollableDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> tabs = [
      'RED',
      'ORANGE',
      'GREEN',
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title:
              Text('Non'),
          bottom: TabBar(
            isScrollable: false,
            tabs: [
              for (final tab in tabs) Tab(text: tab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (final tab in tabs)
              Center(
                child: Text(tab),
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

	static const String _title = 'Tabs Demonstration';

	@override
	void initState() {
		super.initState();
		_body = TabsDemo(type:TabsDemoType.scrollable);
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
									_body = TabsDemo(type:TabsDemoType.scrollable);
								});
							},
						),
						IconButton(
							icon: const Icon(Icons.looks_two),
							onPressed: () {
								setState(() {
									_body = TabsDemo(type:TabsDemoType.nonScrollable);
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
