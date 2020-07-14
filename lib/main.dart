import 'package:flutter/material.dart';
import 'package:flutter_dark_mode/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider<ThemeState>(
      create: (context)=>ThemeState(),
      child: MyApp(),

  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeState>(context).theme == ThemeType.DARK
      ? ThemeData.dark()
      : ThemeData.light(),

//      theme: ThemeData.light(),
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

  int _tapAmount = 0;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    final themeState = Provider.of<ThemeState>(context);

    return GestureDetector(
      onTap: (){
        setState(() {
            _tapAmount++;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_tapAmount.toString()),

              Switch(
                value: themeState.theme == ThemeType.DARK,
                onChanged: (value) {

                  print(value);
//                print(Provider.of<ThemeState>(context).theme);

                  themeState.theme = value ? ThemeType.DARK : ThemeType.LIGHT;

                  setState(() {});


                },
              ),

            ],
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
