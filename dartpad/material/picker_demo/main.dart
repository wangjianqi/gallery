// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gallery/l10n/gallery_localizations.dart';
import 'package:intl/intl.dart';

// BEGIN pickerDemo

enum PickerDemoType {
  date,
  time,
}

class PickerDemo extends StatefulWidget {
  const PickerDemo({Key key, this.type}) : super(key: key);

  final PickerDemoType type;

  @override
  _PickerDemoState createState() => _PickerDemoState();
}

class _PickerDemoState extends State<PickerDemo> {
  DateTime _fromDate = DateTime.now();
  TimeOfDay _fromTime = TimeOfDay.fromDateTime(DateTime.now());

  String get _title {
    switch (widget.type) {
      case PickerDemoType.date:
        return 'Date Picker';
      case PickerDemoType.time:
        return 'Time Picker';
    }
    return '';
  }

  String get _labelText {
    switch (widget.type) {
      case PickerDemoType.date:
        return DateFormat.yMMMd().format(_fromDate);
      case PickerDemoType.time:
        return _fromTime.format(context);
    }
    return '';
  }

  Future<void> _showDatePicker() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _fromDate,
      firstDate: DateTime(2015, 1),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _fromDate) {
      setState(() {
        _fromDate = picked;
      });
    }
  }

  Future<void> _showTimePicker() async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _fromTime,
    );
    if (picked != null && picked != _fromTime) {
      setState(() {
        _fromTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(_title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_labelText),
            SizedBox(height: 16),
            RaisedButton(
              child: Text(
                'SHOW PICKER',
              ),
              onPressed: () {
                switch (widget.type) {
                  case PickerDemoType.date:
                    _showDatePicker();
                    break;
                  case PickerDemoType.time:
                    _showTimePicker();
                    break;
                }
              },
            )
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

  static const String _title = 'Picker Demonstration';

  @override
  void initState() {
    super.initState();
    _body = PickerDemo(type: PickerDemoType.date);
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
                  _body = PickerDemo(type: PickerDemoType.date);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_two),
              onPressed: () {
                setState(() {
                  _body = PickerDemo(type: PickerDemoType.time);
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
