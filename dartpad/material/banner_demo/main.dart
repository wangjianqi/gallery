// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:gallery/l10n/gallery_localizations.dart';

// BEGIN bannerDemo

enum BannerDemoAction {
  reset,
  showMultipleActions,
  showLeading,
}

class BannerDemo extends StatefulWidget {
  @override
  _BannerDemoState createState() => _BannerDemoState();
}

class _BannerDemoState extends State<BannerDemo> {
  static const _itemCount = 20;
  var _displayBanner = true;
  var _showMultipleActions = true;
  var _showLeading = true;

  void handleDemoAction(BannerDemoAction action) {
    setState(() {
      switch (action) {
        case BannerDemoAction.reset:
          _displayBanner = true;
          _showMultipleActions = true;
          _showLeading = true;
          break;
        case BannerDemoAction.showMultipleActions:
          _showMultipleActions = !_showMultipleActions;
          break;
        case BannerDemoAction.showLeading:
          _showLeading = !_showLeading;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final banner = MaterialBanner(
      content: Text('Your password was updated on your other device'),
      leading: _showLeading
          ? CircleAvatar(
              child: Icon(Icons.access_alarm, color: colorScheme.onPrimary),
              backgroundColor: colorScheme.primary,
            )
          : null,
      actions: [
        FlatButton(
          child: Text('SIGN IN'),
          onPressed: () {
            setState(() {
              _displayBanner = false;
            });
          },
        ),
        if (_showMultipleActions)
          FlatButton(
            child: Text('DISMISS'),
            onPressed: () {
              setState(() {
                _displayBanner = false;
              });
            },
          ),
      ],
      backgroundColor: colorScheme.background,
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Banner'),
        actions: [
          PopupMenuButton<BannerDemoAction>(
            onSelected: handleDemoAction,
            itemBuilder: (context) => <PopupMenuEntry<BannerDemoAction>>[
              PopupMenuItem<BannerDemoAction>(
                value: BannerDemoAction.reset,
                child:
                    Text('Reset the banner'),
              ),
              const PopupMenuDivider(),
              CheckedPopupMenuItem<BannerDemoAction>(
                value: BannerDemoAction.showMultipleActions,
                checked: _showMultipleActions,
                child: Text(
                    'Multiple actions'),
              ),
              CheckedPopupMenuItem<BannerDemoAction>(
                value: BannerDemoAction.showLeading,
                checked: _showLeading,
                child: Text(
                    'Leading Icon'),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: _displayBanner ? _itemCount + 1 : _itemCount,
          itemBuilder: (context, index) {
            if (index == 0 && _displayBanner) {
              return banner;
            }
            return ListTile(
              title: Text(
                GalleryLocalizations.of(context)
                    .starterAppDrawerItem(_displayBanner ? index : index + 1),
              ),
            );
          }),
    );
  }
}

// END
void main() {
	runApp(
		MaterialApp(
			debugShowCheckedModeBanner: false,
			home: BannerDemo(),
		),
	);
}
