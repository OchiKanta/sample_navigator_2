import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _navigatorIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navigator(
          pages: [
            MaterialPage(
              child: FirstScreen(onTapButton: _addIndexCount),
            ),
            if (_navigatorIndex == 1)
              MaterialPage(
                child: SecondScreen(),
              )
          ],
          onPopPage: (route, result) {
            if (!route.didPop(result)) return false;
            setState(() {
              _navigatorIndex = 0;
            });
            return true;
          }),
    );
  }

  void _addIndexCount() {
    setState(() {
      _navigatorIndex = 1;
    });
  }
}

class FirstScreen extends StatelessWidget {
  final Function onTapButton;
  FirstScreen({
    @required this.onTapButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('first screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: const Text('Button'),
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () => onTapButton(),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second screen'),
      ),
      body: Center(
        child: const Text('no more'),
      ),
    );
  }
}
