import 'package:flutter/material.dart';
import './phone.dart';

class AddPhonePage extends StatefulWidget {
  AddPhonePage({Key key, this.title, this.callback}) : super(key: key);

  final String title;
  final Function callback;

  @override
  _AddPhoneState createState() => _AddPhoneState(this.callback);
}

class _AddPhoneState extends State<AddPhonePage> {
  List<Phone> _phones = new List<Phone>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _formKey = GlobalKey<FormState>();
  String _number;
  bool _block = false;

  _AddPhoneState (Function callback) {
    callback();
  }

  void _addPhone() {
    setState(() {
      _phones.add(new Phone(this._number, this._block));
    });
    // print(_phones);
    Navigator.pop(context);
  }

 void _switchBlockNumber(bool value) => setState(() => this._block = value);

  Widget _buildPhones() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Digite o número';
              }
              return null;
            },onFieldSubmitted: (value) => {this._number = value},
          ),
          new Text("Bloquear"),
          new Switch(value: this._block, onChanged: _switchBlockNumber),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _addPhone();
                } else {
                  _displayAlert();
                }
              },
              child: Text('Adicionar'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildPhones(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPhone,
        tooltip: 'Adicionar',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> _displayAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Atenção'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text('Digite um número válido!')],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
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
