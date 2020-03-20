void main() => runApp(Example());

class Example extends StatefulWidget {
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  Widget _body;

  static const String _title = 'Material Chip Demonstration';

  @override
  void initState() {
    super.initState();
    _body = ChipDemo(type: ChipDemoType.action);
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
                  _body = ChipDemo(type: ChipDemoType.action);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_two),
              onPressed: () {
                setState(() {
                  _body = ChipDemo(type: ChipDemoType.choice);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_3),
              onPressed: () {
                setState(() {
                  _body = ChipDemo(type: ChipDemoType.filter);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_4),
              onPressed: () {
                setState(() {
                  _body = ChipDemo(type: ChipDemoType.input);
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
