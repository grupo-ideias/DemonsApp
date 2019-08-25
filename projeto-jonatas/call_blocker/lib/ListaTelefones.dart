import 'Telefone.dart';

class ListaTelefones {

  static final List<Telefone> _telefones = <Telefone>[];

  List<Telefone> get telefones => _telefones;

  set telefone(Telefone telefone) {
    _telefones.add(telefone);
  }

}