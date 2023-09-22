import 'package:flutter/material.dart';
import 'package:flutter_application_2/page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have changed size of the picture this amount of times',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(),
                  ),
                );
              },
              child: const Text('Go to Second Page'),
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: _counter % 2 == 0 ? 200 : 100,
              height: _counter % 2 == 0 ? 200 : 100,
              color: _counter % 2 == 0 ? Colors.blue : Colors.red,
              child: Image.network(
                "https://imagedelivery.net/5MYSbk45M80qAwecrlKzdQ/a82b5282-48c6-4011-2699-fa6342b02900/thumbnail?v=2023082802",
              ),
            ),
            const Text(
              'Move this Image',
            ),
            Positioned(
              child: Draggable(
                feedback: Image.network(
                  "https://imagedelivery.net/5MYSbk45M80qAwecrlKzdQ/a82b5282-48c6-4011-2699-fa6342b02900/thumbnail?v=2023082802",
                  width: 100.0,
                  height: 100.0,
                ),
                childWhenDragging: Container(),
                child: Image.network(
                  "https://imagedelivery.net/5MYSbk45M80qAwecrlKzdQ/a82b5282-48c6-4011-2699-fa6342b02900/thumbnail?v=2023082802",
                  width: 100.0,
                  height: 100.0,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
