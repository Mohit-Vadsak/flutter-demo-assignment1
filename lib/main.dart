import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Demo App',
    home: DemoApp(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        //brightness: Brightness.dark,
        primaryColor: Colors.red,
        accentColor: Colors.redAccent),
  ));
}

class DemoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DemoApp();
  }
}

enum option { Yes, No }

class _DemoApp extends State<DemoApp> {
  String dropdownValue = 'Darkside';
  option _option = option.Yes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Widget Demonstration',
          style: TextStyle(
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.w900,
            fontSize: 20.0,
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: ListView(
            children: <Widget>[
              getImage(),
              Center(
                child: Text(
                  '1. Select the Song Name for the respective Album Art given above.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              ),
              Center(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  elevation: 4, //dropdown shadow
                  iconSize: 25.0, //dropdown icon size
                  hint: Text('Select Anyone'),
                  isDense: false,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['Darkside', 'Alone', 'Faded', 'Spectre']
                      .map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 12.0, bottom: 10.0),
                  child: Text(
                    '2. Have you heard this Song ?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                  )),
              Center(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text('Yes'),
                      leading: Radio(
                        activeColor: Colors.green,
                        value: option.Yes,
                        groupValue: _option,
                        onChanged: (option value) {
                          setState(() {
                            _option = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('No'),
                      leading: Radio(
                        activeColor: Colors.green,
                        value: option.No,
                        groupValue: _option,
                        onChanged: (option value) {
                          setState(() {
                            _option = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SnackBarPage(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getImage() {
  AssetImage assetImage = AssetImage('images/alone.jpeg');
  Image image = Image(
    alignment: Alignment.center,
    gaplessPlayback:
        true, //continue showing the old image when the image provider changes.
    image: assetImage,
    fit: BoxFit.fitHeight, // showing full height even if width overflows
    width: 250.0,
    height: 250.0,
  );

  return Container(
    child: image,
    margin: EdgeInsets.all(25.0),
  );
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ButtonTheme(
      minWidth: 130.0,
      height: 42.0,
      buttonColor: Colors.white70,
      child: RaisedButton(
        child: Text(
          'SUBMIT',
          style: TextStyle(
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.w800,
            fontSize: 17.0,
          ),
        ),
        onPressed: () {
          final snackBar = SnackBar(
            content: Text(
              'Information Submitted Successfully!',
              style: TextStyle(
                fontFamily: 'WorkSans',
              ),
            ),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {},
            ),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
      ),
    ));
  }
}
