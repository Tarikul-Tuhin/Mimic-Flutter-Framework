import 'framework.dart';

void main() {
  final counterApp = MyCounterApp();
  final element = counterApp.createElement();
  element.mount();
}

class MyCounterApp extends StatefulWidget {
  const MyCounterApp();

  @override
  State createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounterApp> {
  int count = 0;

  @override
  void initState() {
    print("initState called");
  }

  @override
  Widget build(BuildContext context) {
    print("Building with count = $count");
    return Text();
  }

  void increment() {
    setState(() {
      count++;
    });
  }
}

class Text extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return this;
  }
}


// ---------------------------- Output -----------------------------
// initState called
// Building with count = 0
// StatefulElement rebuilt: Instance of 'Text'