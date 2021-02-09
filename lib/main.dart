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

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

void openPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Next page'),
        ),
        body: const Center(
          child: Text(
            'This is the next page',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    },
  ));
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _estado = false;
  final _formKey = GlobalKey<FormState>();
  String _estadoPalavra = 'desligado';
  int _resultado = 0;

  //int _valorUm = 0;
  //int _valorDois = 0;
  final valorUmcontroller = TextEditingController();
  final valorDoiscontroller = TextEditingController();

/*
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
*/
  void _multiplicaValor() {
    setState(() {
      _resultado =
          int.parse(valorUmcontroller.text) * int.parse(valorUmcontroller.text);

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(content: Text('$_resultado'));
          });
    });
  }

  @override
  void dispose() {
    valorUmcontroller.dispose();
    valorDoiscontroller.dispose();
    super.dispose();
  }

  Future<String> _calculation =
      Future<String>.delayed(Duration(seconds: 2), () => 'Data carregado');


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
        key: scaffoldKey,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_a_photo_outlined),
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Próxima página',
            onPressed: () {
              openPage(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  height: 100,
                  width: 100,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.green,
                    height: 100,
                    width: 100,
                  ),
                ),
                Container(
                  color: Colors.blue,
                  height: 100,
                  width: 100,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Wrap(
                alignment: WrapAlignment.end,
                spacing: 10.0,
                runSpacing: 20.0,
                children: [
                  Opacity(
                    opacity: 0.10,
                    child: Container(
                      color: Colors.blue,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Container(
                    color: Colors.amber,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.pink,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.black,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.green,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.tealAccent,
                    height: 100,
                    width: 100,
                  ),
                ],
              ),
            ),
            Container(
              child: FutureBuilder<String>(
                  future: _calculation,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    List<Widget> children;
                    if (snapshot.hasData) {
                      children = <Widget>[
                        Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                          size: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('Resultado:  ${snapshot.data}'),
                        )
                      ];
                    } else if (snapshot.hasError) {
                      children = <Widget>[
                        Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('Error: ${snapshot.error}'),
                        )
                      ];
                    } else {
                      children = <Widget>[
                        SizedBox(
                          child: CircularProgressIndicator(),
                          width: 60,
                          height: 60,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text('Esperando resultado...'),
                        )
                      ];
                    }
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: children,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
