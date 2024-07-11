import 'package:flutter/material.dart';

/// Pagina de ejemplo donde se muestran los componentes de un UI Kit.
/// TextFlield
/// Botones
/// Switch
/// Checkbox
/// Radio
/// Slider
/// Fecha
/// ShowTime
/// Dialog
///

import 'package:flutter/material.dart';

class UIKitPage extends StatefulWidget {

  const UIKitPage({super.key});

  static const routeName = '/ui_kit';

  @override
  _UIKitPageState createState() => _UIKitPageState();
}

class _UIKitPageState extends State<UIKitPage> {
  bool _switchValue = false;
  bool _checkboxValue = false;
  String _radioValue = 'Option 1';
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI Kit'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'TextField',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('Elevated Button'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Text Button'),
          ),
          IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () {},
          ),
          Switch(
            value: _switchValue,
            onChanged: (newValue) {
              setState(() {
                _switchValue = newValue;
              });
            },
          ),
          Checkbox(
            value: _checkboxValue,
            onChanged: (bool? newValue) {
              setState(() {
                _checkboxValue = newValue!;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<String>(
                value: 'Option 1',
                groupValue: _radioValue,
                onChanged: (String? value) {
                  setState(() {
                    _radioValue = value!;
                  });
                },
              ),
              Radio<String>(
                value: 'Option 2',
                groupValue: _radioValue,
                onChanged: (String? value) {
                  setState(() {
                    _radioValue = value!;
                  });
                },
              ),
            ],
          ),
          Slider(
            value: _sliderValue,
            onChanged: (newValue) {
              setState(() {
                _sliderValue = newValue;
              });
            },
          ),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: Text('Pick Date'),
          ),
          ElevatedButton(
            onPressed: () => _selectTime(context),
            child: Text('Pick Time'),
          ),
          ElevatedButton(
            onPressed: () => _showDialog(context),
            child: Text('Show Dialog'),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      // Handle the selected date
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      // Handle the selected time
    }
  }

  Future<void> _showDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dialog Title'),
          content: Text('This is a sample dialog.'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}