import 'package:deviley_production/services/databse.dart';
import 'package:deviley_production/services/sharedprefs.dart';
import 'package:flutter/material.dart';

class ProfileMaritalEdit extends StatefulWidget {
  @override
  _ProfileMaritalEditState createState() => _ProfileMaritalEditState();
}

class _ProfileMaritalEditState extends State<ProfileMaritalEdit> {
  String marital = 'Divorced';
  Database database = Database();
  String myUserId;

  getUserId() async{
    await SharedPrefs.getUserIdSharedPreference().then((value){
      setState(() {
        myUserId=value;
      });
    });
  }

  List<String> maritals = [
    'Divorced',
    'Live-in',
    'Married',
    'Separated',
    'Single',
    'Widowed'
  ];

  List<Widget> maritalRadioList() {
    List<Widget> widgets = [];
    for (int i = 0; i < maritals.length; i++) {
      widgets.add(
        RadioListTile(
          value: i,
          groupValue: maritals.indexOf(marital),
          title: Text(maritals[i]),
          onChanged: (val) {
            setState(() {
              marital = maritals[val];
            });
          },
          selected: marital == maritals[i],
        ),
      );
    }
    return widgets;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();
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
                    'Change My Relationship Status',
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
                      children: maritalRadioList(),
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Builder(
                      builder: (context) {
                        return FlatButton(
                          onPressed: () {
                            database.updateProfileMarital(myUserId, marital).then((v){
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Relationship Status Updated'),
                                duration: Duration(seconds: 2),

                              ));
                            });
                          },
                          child: Text('Update Relationship Status'),
                          splashColor: Colors.transparent,
                          color: Colors.pink[600],
                          highlightColor: Colors.pinkAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                        );
                      }
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
