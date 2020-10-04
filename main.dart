//import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  Map data;
  var textdata1 = " ";
  var textdata2 = " ";
  var textdata3 = " ";
  var textdata4 = " ";
  var textdata5 = " ";
  var textdata6 = " ";
  var textdata7 = " ";
  var textdata8 = " ";
  var heating_load = " ";
  var cooling_load = " ";
  var dropdownvalue1 = "Select Orientation";
  var dropdownvalue2 = "Select Glazing Area Distribution";
  bool _loading = false;
  bool _temp = true;
  bool _isallright = false;
  bool _surfacearea = false;
  bool _wallarea = false;
  bool _roofarea = false;
  bool _relative = false;
  bool _height = false;
  final _textcontroller1 = new TextEditingController();
  final _textcontroller2 = new TextEditingController();
  final _textcontroller3 = new TextEditingController();
  final _textcontroller4 = new TextEditingController();
  final _textcontroller5 = new TextEditingController();
  final _textcontroller6 = new TextEditingController();
  final _textcontroller7 = new TextEditingController();
  final _textcontroller8 = new TextEditingController();
  fetchData() async {
    
    var response = await http.post(a);
    print(response.statusCode);
    print(response.body);
    data = json.decode(response.body);

    setState(() {
      _loading = false;
      _temp = false;
      heating_load = data['Heating_Load'];
      cooling_load = data['Cooling_load'];
      if (double.parse(heating_load) > 22.3071953 &&
          double.parse(cooling_load) > 24.58776042) {
        _isallright = true;
        if (double.parse(textdata2) < 800) {
          _surfacearea = true;
        }
        if (double.parse(textdata1) > 0.55) {
          _relative = true;
        }
        if (double.parse(textdata3) > 300) {
          _wallarea = true;
        }
        if (double.parse(textdata4) < 200) {
          _roofarea = true;
        }
        if (double.parse(textdata5) > 4) {
          _height = true;
        }
      }
    });

    print(data);
  }

  void dispose() {
    _textcontroller1.dispose();
    _textcontroller2.dispose();
    _textcontroller3.dispose();
    _textcontroller4.dispose();
    _textcontroller5.dispose();
    _textcontroller6.dispose();
    _textcontroller7.dispose();
    _textcontroller8.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Hackathon Application'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: <Widget>[
            TextFormField(
              controller: _textcontroller1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Enter Relative Compactness",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                if (double.parse(value) > 1 || double.parse(value) < 0.45) {
                  return 'Value should be Between 0.45 and 1';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _textcontroller2,
              decoration: InputDecoration(
                  hintText: "Enter Surface Area",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                if (double.parse(value) > 1000 || double.parse(value) < 400) {
                  return 'Value should be Between 400 and 1000';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Enter Wall Area",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
              keyboardType: TextInputType.number,
              controller: _textcontroller3,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                if (double.parse(value) > 500 || double.parse(value) < 200) {
                  return 'Value should be Between 200 and 500';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Enter Roof Area",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
              keyboardType: TextInputType.number,
              controller: _textcontroller4,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                if (double.parse(value) > 250 || double.parse(value) < 70) {
                  return 'Value should be Between 70 and 250';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Enter Overall Height",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
              keyboardType: TextInputType.number,
              controller: _textcontroller5,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                if (double.parse(value) > 8 || double.parse(value) < 2) {
                  return 'Value should be Between 2 and 8';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: dropdownvalue1,
              icon: Icon(Icons.arrow_downward),
              iconSize: 20,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                margin: const EdgeInsets.only(right: 230.0),
                width: 3,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownvalue1 = newValue;
                  if (newValue == 'North') {
                    textdata6 = "2";
                  } else if (newValue == 'East') {
                    textdata6 = "3";
                  } else if (newValue == 'South') {
                    textdata6 = "4";
                  } else {
                    textdata6 = "5";
                  }
                });
              },
              items: <String>[
                'Select Orientation',
                'North',
                'East',
                'South',
                'West'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Enter Glazing Area",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
              keyboardType: TextInputType.number,
              controller: _textcontroller7,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                if (double.parse(value) > 0.5 || double.parse(value) < 0) {
                  return 'Value should be Between 0 and 0.5';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: dropdownvalue2,
              icon: Icon(Icons.arrow_downward),
              iconSize: 20,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                margin: const EdgeInsets.only(right: 140.0),
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownvalue2 = newValue;
                  if (newValue == 'Uniform on Each Side') {
                    textdata8 = "1";
                  } else if (newValue == 'Majority of on North Side') {
                    textdata8 = "2";
                  } else if (newValue == 'Majority of on East Side') {
                    textdata8 = "3";
                  } else if (newValue == 'Majority of on South Side') {
                    textdata8 = "4";
                  } else {
                    textdata8 = "5";
                  }
                });
              },
              items: <String>[
                'Select Glazing Area Distribution',
                'Uniform on Each Side',
                'Majority of on North Side',
                'Majority of on East Side',
                'Majority of on South Side',
                'Majority of on West Side'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            RaisedButton(
              child: Text('Check'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    _loading = true;
                    _isallright = false;
                    _surfacearea = false;
                    _wallarea = false;
                    _roofarea = false;
                    _relative = false;
                    _height = false;
                    textdata1 = _textcontroller1.text;
                    textdata2 = _textcontroller2.text;
                    textdata3 = _textcontroller3.text;
                    textdata4 = _textcontroller4.text;
                    textdata5 = _textcontroller5.text;
                    textdata7 = _textcontroller7.text;
                    print(textdata1);
                  });
                  print(textdata1);
                  fetchData();
                }
              },
            ),
            _loading
                ? CircularProgressIndicator()
                : _temp
                    ? Text(" ")
                    : Column(
                        children: <Widget>[
                          SizedBox(height: 10),
                          Text("Heating Load  - " + heating_load + " BTM"),
                          SizedBox(height: 10),
                          Text("Cooling Load  - " + cooling_load + " BTM"),
                          _isallright
                              ? Container(
                                  child: Column(
                                    children: <Widget>[
                                      _surfacearea
                                          ? Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Text(" Surface Area "),
                                                  Container(
                                                    child: Icon(
                                                        Icons.arrow_upward),
                                                  )
                                                ],
                                              ),
                                            )
                                          : Container(),
                                      _relative
                                          ? Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                      " Relative Compactness "),
                                                  Container(
                                                    child: Icon(
                                                        Icons.arrow_downward),
                                                  )
                                                ],
                                              ),
                                            )
                                          : Container(),
                                      _wallarea
                                          ? Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Text(" Wall Area "),
                                                  Container(
                                                    child: Icon(
                                                        Icons.arrow_downward),
                                                  )
                                                ],
                                              ),
                                            )
                                          : Container(),
                                      _roofarea
                                          ? Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Text(" Roof Area "),
                                                  Container(
                                                    child: Icon(
                                                        Icons.arrow_upward),
                                                  )
                                                ],
                                              ),
                                            )
                                          : Container(),
                                      _height
                                          ? Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Text(" Overall Height "),
                                                  Container(
                                                    child: Icon(
                                                        Icons.arrow_downward),
                                                  )
                                                ],
                                              ),
                                            )
                                          : Container()
                                    ],
                                  ),
                                )
                              : Text("All things Is Good")
                        ],
                      )
          ],
        ),
      ),
    ));
  }
}
