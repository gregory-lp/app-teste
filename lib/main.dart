import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Aplicativo Flutter soma'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _estado = false;
  final _formKey = GlobalKey<FormState>();
  String _estadoPalavra = 'desligado';
  int _resultado = 1;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter += 2;
    });
  }

  void _mudaEstado() {
    setState(() {
      if (_estado == false) {
        _estado = true;
        _estadoPalavra = 'ligado';
      }
      if (_estado == true) {
        _estado = false;
        _estadoPalavra = 'desligado';
      }
    });
  }

  void _multiplicaValor() {
    setState(() {
    _resultado *= _resultado;
    });
  }

/*
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many vezes teste:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Teste',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
            ),
          MaterialButton(
            onPressed: _incrementCounter,
            child: Text(
              'Adicionar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              )
            ),
            color: Color.fromARGB(100, 255, 0, 255),
            padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
          ),
            IconButton(
              icon: Icon(Icons.add_alarm_sharp),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add_alarm_sharp),
        backgroundColor: Color.fromARGB(50, 255, 0, 255),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  */
/*
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Text('$_estadoPalavra'),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.add_circle_rounded),
                  onPressed: _mudaEstado,
                )
              ],
            ),
            Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Digite um número',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'campo vazio';
                        }
                        return null;
                      },
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {}
                          },
                          child: Text('Submit'),
                        )
                    )
                  ]
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Digite um número',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'campo vazio';
                    }
                    return null;
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: _multiplicaValor,
                    child: Text('Calcular'),
                  ))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RichText(
              text: TextSpan(
                text: 'sç~lfk',
              ),
              strutStyle: StrutStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
