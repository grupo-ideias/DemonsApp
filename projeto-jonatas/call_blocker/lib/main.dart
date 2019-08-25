import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'Telefone.dart';
import 'main2.dart';
import 'ListaTelefones.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CallBlocker',
      debugShowCheckedModeBanner: false,
//      home: Telefones(),
      initialRoute: '/',
      routes: {
        '/': (context) => Telefones(),
        '/second': (context) => MyApp2(),
      },
    );
  }
}

class TelefonesState extends State<Telefones> {

  final List<WordPair> _suggestions = <WordPair>[];
  final List<Telefone> _telefones = new ListaTelefones().telefones;
  final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call blocker'),
      ),
      body: _buildSuggestions(),
      floatingActionButton: FloatingActionButton(
        onPressed: _telaCadastrarTelefone,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildSuggestions() {

    if (_telefones.isEmpty) {
      return Scaffold(
        body: const Center(
          child: const Text('Informe um número que deseja bloquear'),
        ),
      );
    }

    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext _context, int i) {
          return _buildRow(_telefones[i]);
        },
        itemCount: _telefones.length,
    );
  }

  Widget _buildRow(Telefone telefone) {
    return ListTile(
      title: Text(
        telefone.descricao +' - ' +telefone.numero,
        style: _biggerFont,
      ),
      trailing: Icon(
        Icons.delete,
        color: Colors.black54,
      ),
      onTap: () {
        setState(() {
          _telefones.remove(telefone);
        });
      },
    );
  }

  void _telaCadastrarTelefone() {
    Navigator.pushNamed(context, '/second');
  }
}

//Classe que realmente é o widget com estado, no médoto createState declara
//quem é a classe que gerencia e representa o seu estado, no caso a RandomWordsState
class Telefones extends StatefulWidget {
  @override
  TelefonesState createState() => TelefonesState();
}
