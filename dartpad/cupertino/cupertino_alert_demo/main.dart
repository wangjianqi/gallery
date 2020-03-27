import 'package:flutter/material.dart';
// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';

import 'package:gallery/data/gallery_options.dart';
import 'package:gallery/l10n/gallery_localizations.dart';

// BEGIN cupertinoAlertDemo

enum AlertDemoType {
  alert,
  alertTitle,
  alertButtons,
  alertButtonsOnly,
  actionSheet,
}

class CupertinoAlertDemo extends StatefulWidget {
  const CupertinoAlertDemo({
    Key key,
    @required this.type,
  }) : super(key: key);

  final AlertDemoType type;

  @override
  _CupertinoAlertDemoState createState() => _CupertinoAlertDemoState();
}

class _CupertinoAlertDemoState extends State<CupertinoAlertDemo> {
  String lastSelectedValue;

  String _title(BuildContext context) {
    switch (widget.type) {
      case AlertDemoType.alert:
        return 'Alert';
      case AlertDemoType.alertTitle:
        return GalleryLocalizations.of(context)
            .demoCupertinoAlertWithTitleTitle;
      case AlertDemoType.alertButtons:
        return 'Alert With Buttons';
      case AlertDemoType.alertButtonsOnly:
        return GalleryLocalizations.of(context)
            .demoCupertinoAlertButtonsOnlyTitle;
      case AlertDemoType.actionSheet:
        return 'Action Sheet';
    }
    return '';
  }

  void _showDemoDialog({BuildContext context, Widget child}) {
    showCupertinoDialog<String>(
      context: context,
      builder: (context) => ApplyTextOptions(child: child),
    ).then((value) {
      if (value != null) {
        setState(() {
          lastSelectedValue = value;
        });
      }
    });
  }

  void _showDemoActionSheet({BuildContext context, Widget child}) {
    child = ApplyTextOptions(
      child: CupertinoTheme(
        data: CupertinoTheme.of(context),
        child: child,
      ),
    );
    showCupertinoModalPopup<String>(
      context: context,
      builder: (context) => child,
    ).then((value) {
      if (value != null) {
        setState(() {
          lastSelectedValue = value;
        });
      }
    });
  }

  void _onAlertPress(BuildContext context) {
    _showDemoDialog(
      context: context,
      child: CupertinoAlertDialog(
        title: Text('Discard draft'),
        actions: [
          CupertinoDialogAction(
            child: Text(
              'Discard',
            ),
            isDestructiveAction: true,
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(
              'Discard',
            ),
          ),
          CupertinoDialogAction(
            child: Text(
              'Cancel',
            ),
            isDefaultAction: true,
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(
              'Cancel',
            ),
          ),
        ],
      ),
    );
  }

  void _onAlertWithTitlePress(BuildContext context) {
    _showDemoDialog(
      context: context,
      child: CupertinoAlertDialog(
        title: Text(
          'Allow ',
        ),
        content: Text(
          'Your current location will be displayed on the map and used for directions',
        ),
        actions: [
          CupertinoDialogAction(
            child: Text(
              'Don',
            ),
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(
              'Don',
            ),
          ),
          CupertinoDialogAction(
            child: Text(
              'Allow',
            ),
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(
              'Allow',
            ),
          ),
        ],
      ),
    );
  }

  void _onAlertWithButtonsPress(BuildContext context) {
    _showDemoDialog(
      context: context,
      child: CupertinoDessertDialog(
        title: Text(
          'Select Favorite Dessert',
        ),
        content: Text(
          'Please select your favorite type of dessert from the list below',
        ),
      ),
    );
  }

  void _onAlertButtonsOnlyPress(BuildContext context) {
    _showDemoDialog(
      context: context,
      child: const CupertinoDessertDialog(),
    );
  }

  void _onActionSheetPress(BuildContext context) {
    _showDemoActionSheet(
      context: context,
      child: CupertinoActionSheet(
        title: Text(
          'Select Favorite Dessert',
        ),
        message: Text(
          'Please select your favorite type of dessert from the list below',
        ),
        actions: [
          CupertinoActionSheetAction(
            child: Text(
              'Cheesecake',
            ),
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(
              'Cheesecake',
            ),
          ),
          CupertinoActionSheetAction(
            child: Text(
              'Tiramisu',
            ),
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(
              'Tiramisu',
            ),
          ),
          CupertinoActionSheetAction(
            child: Text(
              'Apple Pie',
            ),
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(
              'Apple Pie',
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text(
            'Cancel',
          ),
          isDefaultAction: true,
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(
            'Cancel',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text(_title(context)),
      ),
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              Expanded(
                child: Center(
                  child: CupertinoButton.filled(
                    child: Text(
                      'Show Alert',
                    ),
                    onPressed: () {
                      switch (widget.type) {
                        case AlertDemoType.alert:
                          _onAlertPress(context);
                          break;
                        case AlertDemoType.alertTitle:
                          _onAlertWithTitlePress(context);
                          break;
                        case AlertDemoType.alertButtons:
                          _onAlertWithButtonsPress(context);
                          break;
                        case AlertDemoType.alertButtonsOnly:
                          _onAlertButtonsOnlyPress(context);
                          break;
                        case AlertDemoType.actionSheet:
                          _onActionSheetPress(context);
                          break;
                      }
                    },
                  ),
                ),
              ),
              if (lastSelectedValue != null)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    GalleryLocalizations.of(context)
                        .dialogSelectedOption(lastSelectedValue),
                    style: CupertinoTheme.of(context).textTheme.textStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class CupertinoDessertDialog extends StatelessWidget {
  const CupertinoDessertDialog({Key key, this.title, this.content})
      : super(key: key);

  final Widget title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: title,
      content: content,
      actions: [
        CupertinoDialogAction(
          child: Text(
            'Cheesecake',
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop(
              'Cheesecake',
            );
          },
        ),
        CupertinoDialogAction(
          child: Text(
            'Tiramisu',
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop(
              'Tiramisu',
            );
          },
        ),
        CupertinoDialogAction(
          child: Text(
            'Apple Pie',
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop(
              'Apple Pie',
            );
          },
        ),
        CupertinoDialogAction(
          child: Text(
            'Chocolate Brownie',
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop(
              'Chocolate Brownie',
            );
          },
        ),
        CupertinoDialogAction(
          child: Text(
            'Cancel',
          ),
          isDestructiveAction: true,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop(
              'Cancel',
            );
          },
        ),
      ],
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

	static const String _title = 'Cupertino Alert Demonstration';

	@override
	void initState() {
		super.initState();
		_body = CupertinoAlertDemo(type:AlertDemoType.alert);
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
									_body = CupertinoAlertDemo(type:AlertDemoType.alert);
								});
							},
						),
						IconButton(
							icon: const Icon(Icons.looks_two),
							onPressed: () {
								setState(() {
									_body = CupertinoAlertDemo(type:AlertDemoType.alertTitle);
								});
							},
						),
						IconButton(
							icon: const Icon(Icons.looks_3),
							onPressed: () {
								setState(() {
									_body = CupertinoAlertDemo(type:AlertDemoType.alertButtons);
								});
							},
						),
						IconButton(
							icon: const Icon(Icons.looks_4),
							onPressed: () {
								setState(() {
									_body = CupertinoAlertDemo(type:AlertDemoType.alertButtonsOnly);
								});
							},
						),
						IconButton(
							icon: const Icon(Icons.looks_5),
							onPressed: () {
								setState(() {
									_body = CupertinoAlertDemo(type:AlertDemoType.actionSheet);
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
