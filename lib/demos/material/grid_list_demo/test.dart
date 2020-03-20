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
    _body = GridListDemo(type: GridListDemoType.imageOnly);
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
                  _body = GridListDemo(type: GridListDemoType.imageOnly);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_two),
              onPressed: () {
                setState(() {
                  _body = GridListDemo(type: GridListDemoType.header);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_3),
              onPressed: () {
                setState(() {
                  _body = GridListDemo(type: GridListDemoType.footer);
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
