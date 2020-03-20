void main() => runApp(Example());

class Example extends StatefulWidget {
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  Widget _body;

  static const String _title = 'Material Button Demonstration';

  @override
  void initState() {
    super.initState();
    _body = ButtonDemo(type: ButtonDemoType.flat);
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
                  _body = ButtonDemo(type: ButtonDemoType.flat);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_two),
              onPressed: () {
                setState(() {
                  _body = ButtonDemo(type: ButtonDemoType.raised);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_3),
              onPressed: () {
                setState(() {
                  _body = ButtonDemo(type: ButtonDemoType.outline);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_4),
              onPressed: () {
                setState(() {
                  _body = ButtonDemo(type: ButtonDemoType.toggle);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_5),
              onPressed: () {
                setState(() {
                  _body = ButtonDemo(type: ButtonDemoType.floating);
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
