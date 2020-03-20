void main() => runApp(Example());

class Example extends StatefulWidget {
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  Widget _body;

  static const String _title = 'Material Picker Demonstration';

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
