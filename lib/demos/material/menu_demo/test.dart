void main() => runApp(Example());

class Example extends StatefulWidget {
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  Widget _body;

  static const String _title = 'Material Menu Demonstration';

  @override
  void initState() {
    super.initState();
    _body = MenuDemo(
      type: MenuDemoType.contextMenu,
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
                  _body = MenuDemo(
                    type: MenuDemoType.contextMenu,
                  );
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_two),
              onPressed: () {
                setState(() {
                  _body = MenuDemo(
                    type: MenuDemoType.sectionedMenu,
                  );
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_3),
              onPressed: () {
                setState(() {
                  _body = MenuDemo(
                    type: MenuDemoType.checklistMenu,
                  );
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_4),
              onPressed: () {
                setState(() {
                  _body = MenuDemo(
                    type: MenuDemoType.simpleMenu,
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
