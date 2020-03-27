import 'package:flutter/material.dart';
// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';



// BEGIN cupertinoButtonDemo

class CupertinoButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle:
            Text('Buttons'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              child: Text(
                'Button',
              ),
              onPressed: () {},
            ),
            SizedBox(height: 16),
            CupertinoButton.filled(
              child: Text(
                'With Background',
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// END
void main() {
	runApp(
		MaterialApp(
			debugShowCheckedModeBanner: false,
			home: CupertinoButtonDemo(),
		),
	);
}
