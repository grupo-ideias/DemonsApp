import 'package:flutter/material.dart';
import 'package:phonenumber_blacklist/add_phone.dart';
import './phone.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Phone> _phones = new List<Phone>();
  List<Phone> _phonesDisplayed = new List<Phone>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  var _addPhonePage = null;
  Widget currentPage;

  @override
  void initState() {
    super.initState();
    _addPhonePage = AddPhonePage(title: "Adicionar Número", callback: () => this.callback);

    currentPage = _addPhonePage;
  }

  void callback(Widget nextPage) {
    print("callback called!!");
    setState(() {
      this.currentPage = nextPage;
    });
  }

  void _goToAddPhone() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => _addPhonePage),
    );
  }

  Widget _buildRow(Phone phone) {
    return ListTile(
      title: Text(
        "Número: " + phone.getNumber(),
        style: _biggerFont,
      ),
      subtitle: Text(
        "Bloqueado: " + (phone.isBlocked() ? "SIM" : "NÃO"),
        style: _biggerFont,
      ),
    );
  }

  Widget _buildPhones() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (_phones.isNotEmpty && index <= _phones.length) {
            _phonesDisplayed.addAll(_phones.take(1)); /*4*/
            return _buildRow(_phonesDisplayed[index]);
          }
          return null;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildPhones(),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToAddPhone,
        tooltip: 'Adicionar',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
