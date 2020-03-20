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
    _body = CupertinoAlertDemo(type: AlertDemoType.alert);
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
                  _body = CupertinoAlertDemo(type: AlertDemoType.alert);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_two),
              onPressed: () {
                setState(() {
                  _body = CupertinoAlertDemo(type: AlertDemoType.alertTitle);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_3),
              onPressed: () {
                setState(() {
                  _body = CupertinoAlertDemo(type: AlertDemoType.alertButtons);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_4),
              onPressed: () {
                setState(() {
                  _body = CupertinoAlertDemo(
                    type: AlertDemoType.alertButtonsOnly,
                  );
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_5),
              onPressed: () {
                setState(() {
                  _body = CupertinoAlertDemo(type: AlertDemoType.actionSheet);
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
