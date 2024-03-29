import 'package:deviley_production/FirstLoginDetails/addiction.dart';
import 'package:flutter/material.dart';

class SexOrientationDetails extends StatefulWidget {
  final String name;
  final String age;
  final String gender;
  final String marital;

  const SexOrientationDetails(
      {Key key, this.name, this.age, this.gender, this.marital})
      : super(key: key);

  @override
  _SexOrientationDetailsState createState() => _SexOrientationDetailsState();
}

class _SexOrientationDetailsState extends State<SexOrientationDetails> {
  String orientation = 'Male';
  List<String> orientations = [
    'Male',
    'Female',
    'Both Male and Female',
    'Others',
    'I Love All People'
  ];

  List<Widget> orientationRadioList() {
    List<Widget> widgets = [];
    for (int i = 0; i < orientations.length; i++) {
      widgets.add(
        RadioListTile(
          value: i,
          groupValue: orientations.indexOf(orientation),
          title: Text(orientations[i]),
          onChanged: (val) {
            setState(() {
              orientation = orientations[val];
            });
          },
          selected: orientation == orientations[i],
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.pink[600]),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.pink[50],
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Center(
                  child: Text(
                    'I Like',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: orientationRadioList(),
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddictionDetails(
                                      name: widget.name,
                                      gender: widget.gender,
                                      age: widget.age,
                                      marital: widget.marital,
                                      orientation: orientation,
                                    )));
                      },
                      child: Text('Next'),
                      splashColor: Colors.transparent,
                      color: Colors.pink[600],
                      highlightColor: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
