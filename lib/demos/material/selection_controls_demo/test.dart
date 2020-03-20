void main() => runApp(Example());

class Example extends StatefulWidget {
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  Widget _body;

  static const String _title = 'Button Example';

  @override
  void initState() {
    super.initState();
    _body = SelectionControlsDemo(
      type: SelectionControlsDemoType.checkbox,
    );
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
                  _body = SelectionControlsDemo(
                    type: SelectionControlsDemoType.checkbox,
                  );
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_two),
              onPressed: () {
                setState(() {
                  _body = SelectionControlsDemo(
                    type: SelectionControlsDemoType.radio,
                  );
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_3),
              onPressed: () {
                setState(() {
                  _body = SelectionControlsDemo(
                    type: SelectionControlsDemoType.switches,
                  );
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
