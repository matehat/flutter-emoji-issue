import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
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
        title: Text(widget.title),
      ),
      body: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 36.0,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, int) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0))),
                        width: 32.0,
                        height: 32.0,
                        child: Text('$_counter'),
                        alignment: Alignment.center,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Title'), // 1
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'You have pushed the button this many times: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(fontWeight: FontWeight.w300),
                                ),
                                TextSpan(
                                  text: '$_counter\n',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                TextSpan(
                                  text: '😢',
                                  style: TextStyle(fontSize: 24.0),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              childCount: 5,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 36.0,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
