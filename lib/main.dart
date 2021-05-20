import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';

final routes = {
  '/': (BuildContext context) => MyHomePage(),
  '/second': (BuildContext context) => SecondPage(),
};
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Counter(),
        ),
      ],
      child: MaterialApp(
        title: 'Provider Pattern Example',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final consumer = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${consumer.getCount.toString()}',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(onPressed: () {
              consumer.incrementCounter();
            }, child: Text('Increment')),
            Container(
              margin: EdgeInsets.only(top: 120),
              child:RaisedButton(onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            child: Text('Next Page'),
            ))
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final consumer = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Count'),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text('Count',style: TextStyle(fontWeight: FontWeight.bold),),
            Text(consumer.getCount.toString(),style: Theme.of(context).textTheme.headline4,)
            ]
          )
        )
    );
  }
}