import 'package:flutter/material.dart';
import 'Telefone.dart';
import 'ListaTelefones.dart';


class MyApp2 extends StatefulWidget  {

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }

}

class MyCustomFormState extends State<MyApp2> {
  final _formKey = GlobalKey<FormState>();
  final appTitle = 'Cadastro do telefone';
  final controllerDescricao = TextEditingController();
  final controllerNumero = TextEditingController();

  @override
  void dispose() {
    controllerDescricao.dispose();
    controllerNumero.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context, false),
          )
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 25.0, left: 5, right: 5),
                child: TextFormField(
                  autofocus: true,
                  validator: (value) => value.isEmpty ? 'Por favor informe a descrição do telefone' : null,
                  decoration: InputDecoration(hintText: "Informe a descrição do telefone"),
                  controller: controllerDescricao,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.0, left: 5, right: 5),
                child: TextFormField(
                  validator: (value) => value.isEmpty ? 'Por favor informe o telefone' : null,
                  decoration: InputDecoration(hintText: "Informe o telefone"),
                  controller: controllerNumero,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 5),
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      cadastrarTelefone(context);
                    }
                  },
                  child: Text('Cadastrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void cadastrarTelefone(BuildContext context) {
    ListaTelefones lista = ListaTelefones();
    Telefone telefone = new Telefone();
    telefone.numero = controllerNumero.text;
    telefone.descricao = controllerDescricao.text;
    lista.telefone = telefone;
    Navigator.pop(context);
  }
}
